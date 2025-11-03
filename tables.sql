CREATE DATABASE analytics_db;
USE analytics_db;

CREATE TABLE CREATORS (
   creator_id INT AUTO_INCREMENT PRIMARY KEY,
   channel_name VARCHAR(100),
   registration_date DATETIME,
   subscription_level ENUM('free', 'premium', 'enterprise')
);

CREATE TABLE VIDEOS (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    creator_id INT,
    title VARCHAR(200),
    publication_date DATETIME,
    duration_seconds INT,
    category VARCHAR(100),
    FOREIGN KEY (creator_id) REFERENCES CREATORS(creator_id)
);

CREATE TABLE DAILY_METRICS (
    metric_id INT AUTO_INCREMENT PRIMARY KEY,
    video_id INT,
    metric_date DATETIME,
    views INT,
    watch_time_seconds INT,
    likes INT,
    dislikes INT,
    daily_comments INT,
    FOREIGN KEY (video_id) REFERENCES VIDEOS(video_id)
);

CREATE TABLE VISIBILITY_SCORE (
    score_id INT AUTO_INCREMENT PRIMARY KEY,
    video_id INT,
    calculated_score DECIMAL(5, 2),
    retention_rate DECIMAL(5, 2),
    comment_impact DECIMAL(5, 2),
    FOREIGN KEY (video_id) REFERENCES VIDEOS(video_id)
);

CREATE TABLE MONETIZATION (
    monetization_id INT AUTO_INCREMENT PRIMARY KEY,
    video_id INT,
    ad_budget_usd DECIMAL(10, 2),
    estimated_payment_usd DECIMAL(10, 2),
    FOREIGN KEY (video_id) REFERENCES VIDEOS(video_id)
);

