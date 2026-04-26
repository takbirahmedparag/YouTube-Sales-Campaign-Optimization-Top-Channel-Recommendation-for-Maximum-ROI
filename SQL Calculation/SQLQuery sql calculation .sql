/*
1.Define the variables
2.Create a CTE that round the avarage view per video
3.Select the column that are required for the analysis
4.Filter the result by the youtubers channel with the highest subscribers bases
5.Order by Net profit (From Highest to Lowest)
*/
DECLARE @conversionRate FLOAT = 0.02;
DECLARE @productCost FLOAT = 5.0 ;
DECLARE @campaignCost FLOAT = 50000.0 ;

WITH CTE_AVG_view_per_video AS
(
SELECT 
channel_name,
ROUND((CAST(total_views AS FLOAT)/total_videos),-4) AS rounded_AVG_view_per_video
FROM dbo.viewyoutubedata2024
WHERE channel_name IN ('NoCopyrightSounds','DanTDM ','Dan Rhodes')
)

SELECT 
channel_name,
(rounded_AVG_view_per_video*@conversionRate) AS potential_product_per_video,
((rounded_AVG_view_per_video*@conversionRate)*@productCost) AS total_product_revenue_per_video,
(((rounded_AVG_view_per_video*@conversionRate)*@productCost)-@campaignCost) AS Net_profit
FROM CTE_AVG_view_per_video
WHERE channel_name IN ('NoCopyrightSounds','DanTDM ','Dan Rhodes')
Order By (((rounded_AVG_view_per_video*@conversionRate)*@productCost)-@campaignCost) DESC





