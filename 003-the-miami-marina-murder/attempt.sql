SELECT * FROM crime_scene
WHERE location="Coral Bay Marina";
/*
id	date	    location	        description
43	19860814	Coral Bay Marina	The body of an unidentified man was found near the docks. Two people were seen nearby: one who  lives on 300ish "Ocean Drive" and another whose first name ends with "ul" and his last name ends with "ez".
*/

SELECT * FROM person
WHERE address LIKE "%3%Ocean Drive%" OR name LIKE "%ul %ez";
/*
List of all possible suspects based on the crime scene table:

id	name	        alias	    occupation	    address
5	Michael Santos	Silent Mike	Bartender	    33 Ocean Drive
62	Jesse Brooks	The Judge	Court Clerk	    234 Ocean Drive
101	Carlos Mendez	Los Ojos	Fisherman	    369 Ocean Drive
102	Raul Gutierrez	The Cobra	Nightclub Owner	45 Sunset Ave
105	Victor Martinez	Slick Vic	Bartender	    33 Ocean Drive
*/

SELECT person.id, person.name, person.alias, person.occupation, person.address, hotel_checkins.hotel_name, hotel_checkins.check_in_date, surveillance_records.suspicious_activity, interviews.transcript
FROM person
INNER JOIN hotel_checkins
    ON person.id=hotel_checkins.person_id
INNER JOIN surveillance_records
    ON person.id=surveillance_records.person_id
INNER JOIN interviews
    ON person.id=interviews.person_id
WHERE person.id IN (101, 11, 102, 139);
/*
results in README.md
Suspect with id=139 didn't give an interview.
*/

SELECT * from confessions
WHERE person_id IN (101, 11, 102, 139);
/*
id	person_id	confession
5	11	        I have no idea what you're talking about.
96	101	        This is just a misunderstanding.
97	102	        Alright! I've been running a blackmail operation. <-- This sin't a murder confession
*/
