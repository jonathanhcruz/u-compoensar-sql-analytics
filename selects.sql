USE analytics_db;

SELECT * FROM CREATORS;
SELECT * FROM VIDEOS;
SELECT * FROM DAILY_METRICS;
SELECT * FROM VISIBILITY_SCORE;
SELECT * FROM MONETIZATION;

-- 1. Total views and average watch time per video
SELECT video_id, SUM(views) AS total_views, AVG(watch_time_seconds) AS average_watch_time
FROM DAILY_METRICS
GROUP BY video_id;


-- 2. Top 5 creators by total estimated payment
SELECT creators.channel_name, SUM(M.estimated_payment_usd) AS total_estimated_payment
FROM CREATORS creators
JOIN VIDEOS V ON creators.creator_id = V.creator_id
JOIN MONETIZATION M ON V.video_id = M.video_id
GROUP BY creators.creator_id
ORDER BY total_estimated_payment DESC
LIMIT 5;

-- 3. Average visibility score per video category
SELECT V.category, AVG(VS.calculated_score) AS average_visibility_score
FROM VIDEOS V
JOIN VISIBILITY_SCORE VS ON V.video_id = VS.video_id
GROUP BY V.category;

-- 4. Daily average likes and dislikes across all videos
SELECT metric_date, AVG(likes) AS average_likes, AVG(dislikes) AS average_dislikes
FROM DAILY_METRICS
GROUP BY metric_date;

-- 5. Total comments per video
SELECT video_id, SUM(daily_comments) AS total_comments
FROM DAILY_METRICS
GROUP BY video_id;  

-- 6. Creators with premium or enterprise subscriptions and their total video count
SELECT creators.channel_name, COUNT(VIDEOS.video_id) AS total_videos
FROM CREATORS creators
JOIN VIDEOS ON creators.creator_id = VIDEOS.creator_id
WHERE creators.subscription_level IN ('premium', 'enterprise')
GROUP BY creators.creator_id;

-- 7. Videos with retention rate above 80%
SELECT V.video_id, V.title, VS.retention_rate
FROM VIDEOS V
JOIN VISIBILITY_SCORE VS ON V.video_id = VS.video_id
WHERE VS.retention_rate > 80.00;

-- 8. Total ad budget and estimated payment per creator
SELECT creators.channel_name, SUM(MONETIZATION.ad_budget_usd) AS total_ad_budget, SUM(MONETIZATION.estimated_payment_usd) AS total_estimated_payment
FROM CREATORS creators
JOIN VIDEOS ON creators.creator_id = VIDEOS.creator_id
JOIN MONETIZATION ON VIDEOS.video_id = MONETIZATION.video_id
GROUP BY creators.creator_id;

-- 9. Videos published in the last 6 months with their views
SELECT VIDEOS.video_id, VIDEOS.title, SUM(DAILY_METRICS.views) AS total_views
FROM VIDEOS
JOIN DAILY_METRICS ON VIDEOS.video_id = DAILY_METRICS.video_id
WHERE VIDEOS.publication_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY VIDEOS.video_id;

-- 10. Average daily comments for videos in the 'Gaming' category
SELECT VIDEOS.video_id, VIDEOS.title, AVG(DAILY_METRICS.daily_comments) AS average_daily_comments
FROM VIDEOS
JOIN DAILY_METRICS ON VIDEOS.video_id = DAILY_METRICS.video_id
WHERE VIDEOS.category = 'Gaming'
GROUP BY VIDEOS.video_id;

-- 11. Videos with 'Top' in the title and their total views
SELECT VIDEOS.video_id, VIDEOS.title, SUM(DAILY_METRICS.views) AS total_views, SUM(MONETIZATION.estimated_payment_usd) AS total_estimated_payment
FROM VIDEOS
JOIN DAILY_METRICS ON VIDEOS.video_id = DAILY_METRICS.video_id
JOIN MONETIZATION ON VIDEOS.video_id = MONETIZATION.video_id
WHERE VIDEOS.title LIKE '%Top%'
GROUP BY VIDEOS.video_id;