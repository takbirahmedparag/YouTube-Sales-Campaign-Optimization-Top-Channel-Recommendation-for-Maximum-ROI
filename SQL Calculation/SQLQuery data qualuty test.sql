/*
#Data quality test
1.The data needs to be 100 records of youtube channels(row count test)-----(PASSED)
2.The data needs 4 fields(column count test)-----(PASSED)
3.The channel name column must be string formate and the other column must be
numarical data type
4.Each record must be unique int the database(duplicate count test)
*/
--1.The data needs to be 100 records of youtube channels(row count test)
SELECT COUNT(*) AS TOTAL_NUMBER_OF_ROW
FROM dbo.viewyoutubedata2024
--2.The data needs 4 fields(column count test)
SELECT COUNT(*) AS TOTAL_NUMBER_OF_COLUMN
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'viewyoutubedata2024'
--3.The channel name column must be string formate and the other column must be
--numarical data type
SELECT DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'viewyoutubedata2024'
--4.Each record must be unique int the database(duplicate count test)
SELECT channel_name,COUNT(*) AS duplicate_count 
FROM dbo.viewyoutubedata2024
GROUP BY channel_name
HAVING COUNT(*)>1


SELECT *
FROM dbo.viewyoutubedata2024