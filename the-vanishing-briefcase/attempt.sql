SELECT * FROM crime_scene
WHERE location="Blue Note Lounge";
/*
id	date	type	    location	        description
76	19851120	theft	Blue Note Lounge	A briefcase containing sensitive documents vanished. 
                                            A witness reported a man in a trench coat with 
                                            a scar on his left cheek fleeing the scene.
*/

SELECT * FROM suspects
WHERE attire="trench coat";
/*
id	name	            attire	    scar
3	Frankie Lombardi	trench coat	left cheek
183	Vincent Malone	    trench coat	left cheek
237	Christopher Black	trench coat	right cheek
*/

SELECT * FROM interviews
WHERE suspect_id=3 OR suspect_id=183 or suspect_id=237;
/*
suspect_id	transcript
3	        NULL
183	        I wasn’t going to steal it, but I did. <--- WE FOUND THE SUSPECT !!
*/

SELECT * FROM suspects
WHERE id="183";
/*
id	name	        attire	        scar
183	Vincent Malone	trench coat	    left cheek

So answer is: Vincent Malone
*/