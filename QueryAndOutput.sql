--Imported tables through SMSS and the csv files provided
--Changed Department_ID to Department_Id

--Adding Foreign Key to SampleData Table
ALTER TABLE DepartmentAndIntervalData
ADD FOREIGN KEY (Department_Id) REFERENCES Department

--Checking Tables were imported properly 
select * from department
select * from DepartmentAndIntervalData

--Output Query
SELECT 
  dt.Department_Name AS DepartmentName,
  CONVERT(VARCHAR(8), daid.Interval, 114) AS Interval,
  count(*) AS Received,
  COUNT(AnsweredTime) AS Answered,
  SUM(DATEDIFF(ss, ReceivedTime, AnsweredTime)) as WaitTime,
  SUM(DATEDIFF(ss, AnsweredTime, EndedTime)) as TalkTime
FROM DepartmentAndIntervalData daid
INNER JOIN Department dt ON daid.Department_Id = dt.Department_Id
GROUP BY dt.Department_Name, Interval
		

