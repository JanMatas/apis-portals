

SELECT e.id, timestamp- (SELECT timestamp from Transaction t1 where t1.timestamp > t.timestamp and t1.employeeId = e.id ORDER BY timestamp LIMIT 1))
FROM Employee e JOIN Transaction t
	ON  e.id = t.employeeId
JOIN Portal p 
	ON	t.portalId = p.id


SELECT 
FROM 
(Transaction t JOIN Portal p ON t.portalId = p.id) as t1

(SELECT * Transaction t JOIN Portal p ON t.portalId = p.id WHERE id > t1.id and timestamp > t1.timestamp ORDER BY timestamp LIMIT 1) as t2
ON t1.timestamp < t2.timestamp


INSERT INTO TimeSpent
  (employeeId, zoneId, date, timeInside)
VALUES
  (1, 1, '2015-05-30', 40)
ON DUPLICATE KEY UPDATE
  timeInside = timeInside + VALUES(timeInside)