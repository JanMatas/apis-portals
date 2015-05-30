/*POSITION OF All EMPLOYEES */
SELECT e.id 
FROM (
SELECT e.id, IF(STRCMP(t.direction, 'Out'), p.zoneTo, p.zoneFrom) as currentZone
FROM Employee e
  INNER JOIN Transaction t ON t.id =
    (SELECT t.id FROM Transaction t
       WHERE t.employeeId = e.id  ORDER BY timestamp DESC LIMIT 1) 
  INNER JOIN Portal p ON t.portalId = p.id
) AS emp_zone
WHERE currentZone = 1
/*EMPLOYEES IN ZONE*/
