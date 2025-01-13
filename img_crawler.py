@app.post("/api/youtube_crawler/config")
async def api_youtube_crawler_config(config: dict):
    """
    从 YouTube 播放列表页面抓取 HTML 并从中提取所有视频的标题、videoId 和 playlistId。
    """
    global proxies
    url = config.get("url")
    instructor = config.get("instructor")
    try:
        assert isinstance(url, str)
        if proxies:
            response = requests.get(url, proxies=proxies)
        else:
            response = requests.get(url)
        response.raise_for_status()
        html_text = response.text
        # pyperclip.copy(html_text)

        # 提取 ytInitialData 中的 JSON 数据
        initial_data_match = re.search(r"var ytInitialData = ({.*?});", html_text)
        if not initial_data_match:
            print("未找到 ytInitialData")
            return None

        yt_initial_data = json.loads(initial_data_match.group(1))
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
            .get("contents", [])[1]["videoSecondaryInfoRenderer"][
                "attributedDescription"
            ]["content"]
        )

        if not video_items:
            print("没有找到视频")
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

        res = {
            "name": name,
            "description": description,
            "imageUrl": video_data[0]["imageUrl"],
            "subCourses": video_data,
            "instructor": instructor,
        }

        return res

    except requests.exceptions.RequestException as e:
        print(f"请求错误：{e}")
        return None
    except json.JSONDecodeError as e:
        print(f"JSON 解析错误：{e}")
        return None
    except Exception as e:
        print(f"未知错误：{e}")
        if "attributedDescription" in f"{e}":
            assert isinstance(url, str)
            if proxies:
                response = requests.get(url, proxies=proxies)
            else:
                response = requests.get(url)
            response.raise_for_status()
            html_text = response.text
            # pyperclip.copy(html_text)

            # 提取 ytInitialData 中的 JSON 数据
            initial_data_match = re.search(r"var ytInitialData = ({.*?});", html_text)
            if not initial_data_match:
                print("未找到 ytInitialData")
                return None

            yt_initial_data = json.loads(initial_data_match.group(1))
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

            description = ""

            if not video_items:
                print("没有找到视频")
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

            res = {
                "name": name,
                "description": description,
                "imageUrl": video_data[0]["imageUrl"],
                "subCourses": video_data,
                "instructor": instructor,
            }
            return res
        return None