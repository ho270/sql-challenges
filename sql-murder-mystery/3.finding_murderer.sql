SELECT
    a.person_id,
    a.name as suspect_name,
    c.address_number,
    c.address_street_name,
    c.ssn
 FROM

(SELECT *
FROM get_fit_now_member
WHERE id LIKE "48Z%"
AND membership_status = "gold")a

LEFT JOIN

(SELECT *
FROM get_fit_now_check_in
WHERE membership_id LIKE "48Z%"
AND check_in_date LIKE "%0109")b

on a.id = b.membership_id

LEFT JOIN 

(SELECT *
FROM person)c

on a.person_id = c.id

INNER JOIN

(SELECT *
FROM drivers_license
WHERE plate_number LIKE "%H42W%")d

on c.license_id = d.id