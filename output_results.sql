
INSERT INTO spiritai_v2.courses (
    uuid, coursesCategoryId, name,
    instructor, imageUrl, videoUrl, description
)
VALUES

                (
                    2,  -- Setting coursesCategoryId to 2
                    'Wealth & Poverty',  -- course name
                    'Welcome to my undergraduate course on Wealth and Poverty. This is the first of fourteen classes.

The questions we'll focus on today: Is some inequality both inevitable and necessary? At what point, if ever, does it become a problem? What's the difference between income and wealth inequality, and which is more important? How do income and wealth inequalities overlap with race and gender? And the real puzzle: why did these inequalities begin to widen so dramatically starting in the late 1970s and early 1980s, and continue widening since then?

Even though this isn't a real classroom and I'm not with you in person, I hope you find this both enjoyable and challenging. Don't expect to learn by just watching and listening, though. I want you to be an active learner — which means answering questions I pose and putting various puzzle pieces together. I'm not going to tell you what to think. I'm going to try to provoke you into thinking harder and more deeply.

If you wish, I've shared some select readings from the syllabus for you. They're available at: https://robertreich.substack.com/p/fi...

Class Outline
-------------------------
00:00 - Introduction
14:35 - The paradox
42:11 - Economic inequality by race
52:39 - Mobility
59:59 - Should we care?
01:12:00 - The $1000 experiment
01:20:17 - Public values and social change',  -- description
                    'https://img.youtube.com/vi/1f2blKai7HA/hqdefault.jpg',  -- imageUrl
                    'Robert Reich',  -- instructor
                )
                
INSERT INTO spiritai_v2.courses_sub (
    coursesCategoryId, name,
    instructor, imageUrl, videoUrl, description
)
VALUES

                    (
                        2,  -- Setting coursesCategoryId to 2
                        'Class 1: "What's Happened to Income & Wealth" by UC Berkeley Professor Reich',  -- course name
                        'Robert Reich',  -- instructor
                        'https://img.youtube.com/vi/1f2blKai7HA/hqdefault.jpg',  -- imageUrl
                        'https://www.youtube.com/embed/1f2blKai7HA',  -- videoUrl
                        '' -- Description
                    )
                    ,

                    (
                        2,  -- Setting coursesCategoryId to 2
                        'Class 2: "The Investor's View" by UC Berkeley Professor Reich',  -- course name
                        'Robert Reich',  -- instructor
                        'https://img.youtube.com/vi/O8RpyqauWOQ/hqdefault.jpg',  -- imageUrl
                        'https://www.youtube.com/embed/O8RpyqauWOQ',  -- videoUrl
                        '' -- Description
                    )
                    ,

                    (
                        2,  -- Setting coursesCategoryId to 2
                        'Class 3: "Globalization, Tech & Future Work" by UC Berkeley Professor Reich',  -- course name
                        'Robert Reich',  -- instructor
                        'https://img.youtube.com/vi/8SZMUWP9wpE/hqdefault.jpg',  -- imageUrl
                        'https://www.youtube.com/embed/8SZMUWP9wpE',  -- videoUrl
                        '' -- Description
                    )
                    ,

                    (
                        2,  -- Setting coursesCategoryId to 2
                        'Class 4: "Widening Inequalities of Place" by UC Berkeley Professor Reich',  -- course name
                        'Robert Reich',  -- instructor
                        'https://img.youtube.com/vi/owqQQvmewaY/hqdefault.jpg',  -- imageUrl
                        'https://www.youtube.com/embed/owqQQvmewaY',  -- videoUrl
                        '' -- Description
                    )
                    ,

                    (
                        2,  -- Setting coursesCategoryId to 2
                        'Class 5: "Monopoly, Labor, and Antitrust" by UC Berkeley Professor Reich',  -- course name
                        'Robert Reich',  -- instructor
                        'https://img.youtube.com/vi/zokSkRNqZBM/hqdefault.jpg',  -- imageUrl
                        'https://www.youtube.com/embed/zokSkRNqZBM',  -- videoUrl
                        '' -- Description
                    )
                    ,

                    (
                        2,  -- Setting coursesCategoryId to 2
                        'Class 6: "Political Power and Wealth" by UC Berkeley Professor Reich',  -- course name
                        'Robert Reich',  -- instructor
                        'https://img.youtube.com/vi/kQS2ptfayVI/hqdefault.jpg',  -- imageUrl
                        'https://www.youtube.com/embed/kQS2ptfayVI',  -- videoUrl
                        '' -- Description
                    )
                    ,

                    (
                        2,  -- Setting coursesCategoryId to 2
                        'Class 7: "Taxing and Redistributing" by UC Berkeley Professor Reich',  -- course name
                        'Robert Reich',  -- instructor
                        'https://img.youtube.com/vi/uz350LTmusw/hqdefault.jpg',  -- imageUrl
                        'https://www.youtube.com/embed/uz350LTmusw',  -- videoUrl
                        '' -- Description
                    )
                    ,

                    (
                        2,  -- Setting coursesCategoryId to 2
                        'Class 8: "Macroeconomic Policy" by UC Berkeley Professor Reich',  -- course name
                        'Robert Reich',  -- instructor
                        'https://img.youtube.com/vi/rKv9EYpEuWc/hqdefault.jpg',  -- imageUrl
                        'https://www.youtube.com/embed/rKv9EYpEuWc',  -- videoUrl
                        '' -- Description
                    )
                    ,

                    (
                        2,  -- Setting coursesCategoryId to 2
                        'Class 9: "Remedying Racial Inequity" by UC Berkeley Professor Reich',  -- course name
                        'Robert Reich',  -- instructor
                        'https://img.youtube.com/vi/ZqWX4ve2VK4/hqdefault.jpg',  -- imageUrl
                        'https://www.youtube.com/embed/ZqWX4ve2VK4',  -- videoUrl
                        '' -- Description
                    )
                    ,

                    (
                        2,  -- Setting coursesCategoryId to 2
                        'Class 10: "Public Assistance for the Poor" by UC Berkeley Professor Reich',  -- course name
                        'Robert Reich',  -- instructor
                        'https://img.youtube.com/vi/lDmLAOgdNc4/hqdefault.jpg',  -- imageUrl
                        'https://www.youtube.com/embed/lDmLAOgdNc4',  -- videoUrl
                        '' -- Description
                    )
                    ,

                    (
                        2,  -- Setting coursesCategoryId to 2
                        'Class 11: "Reducing Health Inequities" by UC Berkeley Professor Reich',  -- course name
                        'Robert Reich',  -- instructor
                        'https://img.youtube.com/vi/q9getidk8Yo/hqdefault.jpg',  -- imageUrl
                        'https://www.youtube.com/embed/q9getidk8Yo',  -- videoUrl
                        '' -- Description
                    )
                    ,

                    (
                        2,  -- Setting coursesCategoryId to 2
                        'Class 12: "Reducing Environmental Inequities" by UC Berkeley Professor Reich',  -- course name
                        'Robert Reich',  -- instructor
                        'https://img.youtube.com/vi/uyXGgiXW5Qk/hqdefault.jpg',  -- imageUrl
                        'https://www.youtube.com/embed/uyXGgiXW5Qk',  -- videoUrl
                        '' -- Description
                    )
                    ,

                    (
                        2,  -- Setting coursesCategoryId to 2
                        'Class 13: "Reducing Inequities in Education" by UC Berkeley Professor Reich',  -- course name
                        'Robert Reich',  -- instructor
                        'https://img.youtube.com/vi/W9rtmYxwvD0/hqdefault.jpg',  -- imageUrl
                        'https://www.youtube.com/embed/W9rtmYxwvD0',  -- videoUrl
                        '' -- Description
                    )
                    ,

                    (
                        2,  -- Setting coursesCategoryId to 2
                        'Class 14: "The Future of Inequality (& You?)" by UC Berkeley Professor Reich',  -- course name
                        'Robert Reich',  -- instructor
                        'https://img.youtube.com/vi/H6ijLMsSBm8/hqdefault.jpg',  -- imageUrl
                        'https://www.youtube.com/embed/H6ijLMsSBm8',  -- videoUrl
                        '' -- Description
                    )
                    ;
