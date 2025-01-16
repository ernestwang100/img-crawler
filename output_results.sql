
INSERT INTO spiritai_v2.courses (
    coursesCategoryId, name, instructor, imageUrl, description, uuid, url
) VALUES (
    2,
    'Wealth & Poverty',
    'Robert Reich',
    'https://img.youtube.com/vi/1f2blKai7HA/hqdefault.jpg',
    'Welcome to my undergraduate course on Wealth and Poverty. This is the first of fourteen classes.

The questions we’ll focus on today: Is some inequality both inevitable and necessary? At what point, if ever, does it become a problem? What’s the difference between income and wealth inequality, and which is more important? How do income and wealth inequalities overlap with race and gender? And the real puzzle: why did these inequalities begin to widen so dramatically starting in the late 1970s and early 1980s, and continue widening since then?

Even though this isn’t a real classroom and I’m not with you in person, I hope you find this both enjoyable and challenging. Don’t expect to learn by just watching and listening, though. I want you to be an active learner — which means answering questions I pose and putting various puzzle pieces together. I’m not going to tell you what to think. I’m going to try to provoke you into thinking harder and more deeply.

If you wish, I’ve shared some select readings from the syllabus for you. They’re available at: https://robertreich.substack.com/p/fi...

Class Outline
-------------------------
00:00 - Introduction
14:35 - The paradox
42:11 - Economic inequality by race
52:39 - Mobility
59:59 - Should we care?
01:12:00 - The $1000 experiment
01:20:17 - Public values and social change',
    '44232687-d5ab-4032-a0f5-48b303d2f00b',
    'https://www.youtube.com/watch?v=1f2blKai7HA&list=PLOLArO56vjuoeaIPzKQibBDbx2m_Rfsit'
);

INSERT INTO spiritai_v2.courses_sub (
    coursesCategoryId, name, instructor, imageUrl, videoUrl, description, courseuuid
) VALUES
(
    2,
    'Class 1: “What’s Happened to Income & Wealth” by UC Berkeley Professor Reich',
    'Robert Reich',
    'https://img.youtube.com/vi/1f2blKai7HA/hqdefault.jpg',
    'https://www.youtube.com/embed/1f2blKai7HA',
    'Welcome to my undergraduate course on Wealth and Poverty. This is the first of fourteen classes.The questions we’ll focus on today: Is some inequality both i...',
    '44232687-d5ab-4032-a0f5-48b303d2f00b'
),(
    2,
    'Class 2: “The Investor''s View” by UC Berkeley Professor Reich',
    'Robert Reich',
    'https://img.youtube.com/vi/O8RpyqauWOQ/hqdefault.jpg',
    'https://www.youtube.com/embed/O8RpyqauWOQ',
    'Hello again, friends. Thank you for joining me for the second week of my Wealth and Poverty class. In today’s class, we begin to explore why such inequalitie...',
    '44232687-d5ab-4032-a0f5-48b303d2f00b'
),(
    2,
    'Class 3: “Globalization, Tech & Future Work” by UC Berkeley Professor Reich',
    'Robert Reich',
    'https://img.youtube.com/vi/8SZMUWP9wpE/hqdefault.jpg',
    'https://www.youtube.com/embed/8SZMUWP9wpE',
    'Welcome to the third class in this 14-week series.Today we will get into questions that continue to be vigorously debated — the effects of globalization and ...',
    '44232687-d5ab-4032-a0f5-48b303d2f00b'
),(
    2,
    'Class 4: “Widening Inequalities of Place” by UC Berkeley Professor Reich',
    'Robert Reich',
    'https://img.youtube.com/vi/owqQQvmewaY/hqdefault.jpg',
    'https://www.youtube.com/embed/owqQQvmewaY',
    'This week’s class explores why geographic segregation by wealth and race has been on the rise. The trend is causing inequality to widen in particularly divis...',
    '44232687-d5ab-4032-a0f5-48b303d2f00b'
),(
    2,
    'Class 5: “Monopoly, Labor, and Antitrust” by UC Berkeley Professor Reich',
    'Robert Reich',
    'https://img.youtube.com/vi/zokSkRNqZBM/hqdefault.jpg',
    'https://www.youtube.com/embed/zokSkRNqZBM',
    'Our fifth class begins our focus on power — and on the relative power of workers and the corporations that hire or contract with them. It’s one of the oldest...',
    '44232687-d5ab-4032-a0f5-48b303d2f00b'
),(
    2,
    'Class 6: “Political Power and Wealth” by UC Berkeley Professor Reich',
    'Robert Reich',
    'https://img.youtube.com/vi/kQS2ptfayVI/hqdefault.jpg',
    'https://www.youtube.com/embed/kQS2ptfayVI',
    'This week brings us to one of the core problems of widening inequality — the inevitability that concentrated income and wealth at the top comes with politica...',
    '44232687-d5ab-4032-a0f5-48b303d2f00b'
),(
    2,
    'Class 7: “Taxing and Redistributing” by UC Berkeley Professor Reich',
    'Robert Reich',
    'https://img.youtube.com/vi/uz350LTmusw/hqdefault.jpg',
    'https://www.youtube.com/embed/uz350LTmusw',
    'We now turn to policies where widening inequality is directly implicated. The first and most obvious (and most politically contentious) involves taxing highe...',
    '44232687-d5ab-4032-a0f5-48b303d2f00b'
),(
    2,
    'Class 8: “Macroeconomic Policy” by UC Berkeley Professor Reich',
    'Robert Reich',
    'https://img.youtube.com/vi/rKv9EYpEuWc/hqdefault.jpg',
    'https://www.youtube.com/embed/rKv9EYpEuWc',
    'This week we look at one of most hidden of all domains affecting inequality — the role of macroeconomic policy. Don’t worry if you haven’t had a course in ma...',
    '44232687-d5ab-4032-a0f5-48b303d2f00b'
),(
    2,
    'Class 9: “Remedying Racial Inequity” by UC Berkeley Professor Reich',
    'Robert Reich',
    'https://img.youtube.com/vi/ZqWX4ve2VK4/hqdefault.jpg',
    'https://www.youtube.com/embed/ZqWX4ve2VK4',
    'Today I’m delighted to have as our lecturer David C. Wilson, Dean of the Goldman School of Public Policy. Dean Wilson’s research on racial resentment and jus...',
    '44232687-d5ab-4032-a0f5-48b303d2f00b'
),(
    2,
    'Class 10: “Public Assistance for the Poor” by UC Berkeley Professor Reich',
    'Robert Reich',
    'https://img.youtube.com/vi/lDmLAOgdNc4/hqdefault.jpg',
    'https://www.youtube.com/embed/lDmLAOgdNc4',
    'This week we’re looking at a suite of remedies for widening inequality that have all had some effect, but not nearly as much as they were intended to have. S...',
    '44232687-d5ab-4032-a0f5-48b303d2f00b'
),(
    2,
    'Class 11: “Reducing Health Inequities” by UC Berkeley Professor Reich',
    'Robert Reich',
    'https://img.youtube.com/vi/q9getidk8Yo/hqdefault.jpg',
    'https://www.youtube.com/embed/q9getidk8Yo',
    'Welcome back to my Wealth and Poverty class. We’re coming up to near the end of the semester but still have a lot to do — so keep your seatbelts on. This wee...',
    '44232687-d5ab-4032-a0f5-48b303d2f00b'
),(
    2,
    'Class 12: “Reducing Environmental Inequities” by UC Berkeley Professor Reich',
    'Robert Reich',
    'https://img.youtube.com/vi/uyXGgiXW5Qk/hqdefault.jpg',
    'https://www.youtube.com/embed/uyXGgiXW5Qk',
    'This week’s focus is in many ways an extension of last week’s focus on health and inequality, but this time we’ll examine the effects of climate change on in...',
    '44232687-d5ab-4032-a0f5-48b303d2f00b'
),(
    2,
    'Class 13: “Reducing Inequities in Education” by UC Berkeley Professor Reich',
    'Robert Reich',
    'https://img.youtube.com/vi/W9rtmYxwvD0/hqdefault.jpg',
    'https://www.youtube.com/embed/W9rtmYxwvD0',
    'This week’s focus is one that has received a great deal of attention in recent years — and not all of it terribly well-informed or constructive. It’s inequal...',
    '44232687-d5ab-4032-a0f5-48b303d2f00b'
),(
    2,
    'Class 14: “The Future of Inequality (& You?)” by UC Berkeley Professor Reich',
    'Robert Reich',
    'https://img.youtube.com/vi/H6ijLMsSBm8/hqdefault.jpg',
    'https://www.youtube.com/embed/H6ijLMsSBm8',
    'This is the last class of my Wealth &amp; Poverty course and my final time teaching it at UC Berkeley. Even if you haven’t had a chance to keep up with all the o...',
    '44232687-d5ab-4032-a0f5-48b303d2f00b'
);
