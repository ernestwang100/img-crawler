import requests
import re
import json

# Define global variable for proxies (if needed)
proxies = None  # Set your proxy if necessary


def fetch_youtube_playlist_data(url: str, instructor: str = None):
    """
    Fetch YouTube playlist data (videos, title, description, instructor)
    from the given URL. Optionally takes an instructor name.
    """
    try:
        if proxies:
            response = requests.get(url, proxies=proxies)
        else:
            response = requests.get(url)
        response.raise_for_status()
        html_text = response.text

        # Extract ytInitialData from the HTML
        initial_data_match = re.search(
            r"var ytInitialData = ({.*?});", html_text)
        if not initial_data_match:
            print(f"Error: ytInitialData not found in {url}")
            return None

        yt_initial_data = json.loads(initial_data_match.group(1))

        # Debugging: Print the entire yt_initial_data to understand its structure
        print("yt_initial_data:", json.dumps(
            yt_initial_data.get("contents", {})))

        video_items = (
            yt_initial_data.get("contents", {})
            .get("twoColumnWatchNextResults", {})
            .get("playlist", {})
            .get("playlist", {})
            .get("contents", [])
        )

        name = (
            yt_initial_data.get("contents", {})
            .get("twoColumnWatchNextResults", {})
            .get("playlist", {})
            .get("playlist", {})["title"]
        )

        description = (
            yt_initial_data.get("contents", {})
            .get("twoColumnWatchNextResults", {})
            .get("results", {})
            .get("results", {})
            .get("contents", [])[1]["videoSecondaryInfoRenderer"]
            .get("attributedDescription", {})
            .get("content", "")
        )

        if not video_items:
            print(f"Error: No video items found in {url}")
            return None

        video_data = []
        for item in video_items:
            video_renderer = item.get("playlistPanelVideoRenderer", {})
            title = video_renderer.get("title", {}).get("simpleText", "N/A")
            video_id = video_renderer.get("videoId", "")

            video_data.append(
                {
                    "imageUrl": f"https://img.youtube.com/vi/{video_id}/hqdefault.jpg",
                    "videoUrl": f"https://www.youtube.com/embed/{video_id}",
                    "name": title,
                }
            )

        # If instructor is not passed, we might extract from the page, if available
        if not instructor:
            # Try extracting instructor from the HTML metadata if not provided
            creator = yt_initial_data.get("header", {}).get(
                "c4TabbedHeaderRenderer", {}).get("owner", {}).get("title", "Unknown")
            if creator != "Unknown":
                instructor = creator
            else:
                # If no creator info found, default to "Unknown"
                instructor = "Unknown"

        result = {
            "name": name,
            "description": description,
            "imageUrl": video_data[0]["imageUrl"] if video_data else "",
            "subCourses": video_data,
            "instructor": instructor,
        }

        return result

    except requests.exceptions.RequestException as e:
        print(f"Request error: {e}")
        return None
    except json.JSONDecodeError as e:
        print(f"JSON decoding error: {e}")
        return None
    except Exception as e:
        print(f"Unknown error: {e}")
        return None


def crawl_from_file(input_file: str, output_file: str):
    """
    Read URLs from the input file, crawl YouTube playlists, and save results
    to the output file.
    """
    results = []
    with open(input_file, 'r') as file:
        urls = file.readlines()

    for url in urls:
        url = url.strip()
        if not url:
            continue

        print(f"Crawling data for: {url}")
        # Call the fetch function (can pass instructor if known, else leave it None)
        result = fetch_youtube_playlist_data(url)

        if result:
            results.append(result)

    # Save the results to the output file
    with open(output_file, 'w') as output:
        json.dump(results, output, indent=4)

    print(f"Crawling complete. Results saved to {output_file}.")


# Usage example
input_file = 'input_urls.txt'  # Replace with the path to your input file
output_file = 'output_results.txt'  # Replace with the path to your output file

crawl_from_file(input_file, output_file)
