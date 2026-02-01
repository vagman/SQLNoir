SELECT * FROM crime_scene
WHERE location="West Hollywood Records";
/*
id	date	    type	location	    description
65	19830715	theft	West Hollywood  Records	A prized vinyl record was stolen from the store during a busy evening.

So now we search for witnesses that witnessed the crime with crime_scene_id=65
*/

SELECT * FROM witnesses
WHERE crime_scene_id=65;
/*
id	crime_scene_id	clue
28	65	            I saw a man wearing a red bandana rushing out of the store.
75	65	            The main thing I remember is that he had a distinctive gold watch on his wrist.
*/

SELECT * FROM suspects
WHERE bandana_color="red" AND accessory="gold watch";
/*
id	name	        bandana_color	accessory
35	Tony Ramirez	red	            gold watch
44	Mickey Rivera	red	            gold watch
97	Rico Delgado	red	            gold watch

So we have possible suspects: 35, 44 and 97
*/

SELECT * FROM interviews
WHERE suspect_id="35" OR suspect_id="44" OR suspect_id="97";
/*
suspect_id	transcript
35	        I wasn't anywhere near West Hollywood Records that night.
44	        I was busy with my music career; I have nothing to do with this theft.
97	        I couldn't help it. I snapped and took the record.

So the thief is suspect 97 - let's find out who he is
*/

SELECT * FROM suspects
WHERE id="97";
/*
id	name	        bandana_color	accessory
97	Rico Delgado	red	gold watch

So the thief is Rico Delgado.
*/