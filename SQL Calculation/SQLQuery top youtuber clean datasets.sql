
CREATE VIEW view_youtube_data_2024 AS
SELECT 
SUBSTRING(NOMBRE,1,CHARINDEX('@',NOMBRE)-1) AS channel_name,
total_subscribers,
total_views,
total_videos
FROM dbo.youtube_data_from_python