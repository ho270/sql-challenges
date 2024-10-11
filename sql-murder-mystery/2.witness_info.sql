SELECT 
    a.id as witness_id,
    a.name as witness_name,
    b.transcript as interview_transcript
 FROM

(SELECT *
FROM person
WHERE address_street_name = "Northwestern Dr"
AND address_number = (SELECT MAX(address_number) FROM person)

UNION

SELECT *
FROM person
WHERE address_street_name = "Franklin Ave"
AND name LIKE "annabel%")a

LEFT JOIN

(SELECT *
FROM interview)b

on a.id = b.person_id
