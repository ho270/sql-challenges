SELECT 
    b.name as villian_name,
    c.event_id,
    c.event_name,
    COUNT(c.event_id)
 FROM

(
(SELECT *
FROM drivers_license
WHERE hair_color = "red"
AND gender = "female"
AND height BETWEEN "65" AND "67"
AND car_make = "Tesla"
AND car_model = "Model S")a

INNER JOIN

(SELECT * FROM person)b

on a.id = b.license_id

INNER JOIN

(SELECT * FROM facebook_event_checkin
WHERE event_name = "SQL Symphony Concert"
AND date LIKE "201712%")c

on b.id = c.person_id
)

GROUP BY c.event_name

HAVING COUNT(c.event_id) = 3