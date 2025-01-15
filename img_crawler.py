import requests
import re
import json
from typing import Optional, Dict, List
from dataclasses import dataclass
from pathlib import Path
import logging

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)


@dataclass
class VideoData:
    name: str
    instructor: str
    image_url: str
    video_url: str


@dataclass
class PlaylistData:
    name: str
    description: str
    image_url: str
    instructor: str
    sub_courses: List[VideoData]


class YouTubePlaylistCrawler:
    def __init__(self, proxies: Optional[Dict] = None):
        self.proxies = proxies

    def _sanitize_text(self, text: str) -> str:
        """Sanitize text for SQL insertion."""
        return text.replace("'", "''").replace('"', '""')

    def _fetch_data(self, url: str) -> Optional[dict]:
        """Fetch raw data from YouTube URL."""
        try:
            response = requests.get(url, proxies=self.proxies)
            response.raise_for_status()

            initial_data_match = re.search(
                r"var ytInitialData = ({.*?});", response.text)
            if not initial_data_match:
                logger.error(f"ytInitialData not found in {url}")
                return None

            return json.loads(initial_data_match.group(1))

        except requests.exceptions.RequestException as e:
            logger.error(f"Request error: {e}")
        except json.JSONDecodeError as e:
            logger.error(f"JSON decoding error: {e}")
        except Exception as e:
            logger.error(f"Unknown error: {e}")

        return None

    def fetch_playlist_data(self, url: str) -> Optional[PlaylistData]:
        """Fetch and parse YouTube playlist data."""
        yt_initial_data = self._fetch_data(url)
        if not yt_initial_data:
            return None

        try:
            # Extract playlist metadata
            playlist_data = (
                yt_initial_data.get("contents", {})
                .get("twoColumnWatchNextResults", {})
                .get("playlist", {})
                .get("playlist", {})
            )

            name = playlist_data.get("title", "")

            # Extract description
            description = (
                yt_initial_data.get("contents", {})
                .get("twoColumnWatchNextResults", {})
                .get("results", {})
                .get("results", {})
                .get("contents", [])[1]
                .get("videoSecondaryInfoRenderer", {})
                .get("attributedDescription", {})
                .get("content", "")
            )

            # Extract videos
            video_items = playlist_data.get("contents", [])
            if not video_items:
                logger.error(f"No video items found in {url}")
                return None

            videos = []
            instructor = "Unknown"

            for item in video_items:
                video_renderer = item.get("playlistPanelVideoRenderer", {})
                if not video_renderer:
                    continue

                video_id = video_renderer.get("videoId", "")
                title = video_renderer.get(
                    "title", {}).get("simpleText", "N/A")

                # Extract creator's name
                runs = video_renderer.get("longBylineText", {}).get("runs", [])
                if runs:
                    instructor = runs[0].get("text", "Unknown")

                videos.append(VideoData(
                    name=self._sanitize_text(title),
                    instructor=instructor,
                    image_url=f"https://img.youtube.com/vi/{video_id}/hqdefault.jpg",
                    video_url=f"https://www.youtube.com/embed/{video_id}"
                ))

            first_image_url = videos[0].image_url if videos else ""

            return PlaylistData(
                name=self._sanitize_text(name),
                description=self._sanitize_text(description),
                image_url=first_image_url,
                instructor=instructor,
                sub_courses=videos
            )

        except Exception as e:
            logger.error(f"Error parsing playlist data: {e}")
            return None

    def generate_sql(self, playlist_data: PlaylistData, category_id: int = 2) -> str:
        """Generate SQL insert statements for the playlist data."""
        sql = []

        # Main course insert
        sql.append(f"""
INSERT INTO spiritai_v2.courses (
    coursesCategoryId, name, instructor, imageUrl, description
) VALUES (
    {category_id},
    '{playlist_data.name}',
    '{playlist_data.instructor}',
    '{playlist_data.image_url}',
    '{playlist_data.description}'
);""")

        # Sub-courses insert
        if playlist_data.sub_courses:
            values = []
            for video in playlist_data.sub_courses:
                values.append(f"""(
    {category_id},
    '{video.name}',
    '{video.instructor}',
    '{video.image_url}',
    '{video.video_url}',
    ''
)""")

            sql.append(f"""
INSERT INTO spiritai_v2.courses_sub (
    coursesCategoryId, name, instructor, imageUrl, videoUrl, description
) VALUES
{','.join(values)};""")

        return '\n'.join(sql)


def process_urls(input_path: str, output_path: str):
    """Process URLs from input file and generate SQL output."""
    crawler = YouTubePlaylistCrawler()

    input_path = Path(input_path)
    output_path = Path(output_path)

    if not input_path.exists():
        logger.error(f"Input file not found: {input_path}")
        return

    with output_path.open('w', encoding='utf-8') as f:
        for url in input_path.read_text().splitlines():
            url = url.strip()
            if not url:
                continue

            logger.info(f"Processing: {url}")
            playlist_data = crawler.fetch_playlist_data(url)

            if playlist_data:
                sql = crawler.generate_sql(playlist_data)
                f.write(sql + '\n')
            else:
                logger.error(f"Failed to process URL: {url}")

    logger.info(f"Processing complete. Results saved to {output_path}")


if __name__ == "__main__":
    process_urls('input_urls.txt', 'output_results.sql')
