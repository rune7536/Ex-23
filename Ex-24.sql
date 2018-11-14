INSERT INTO Pet_Owner (OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail)VALUES
(
'Downs', 'Marsha', '5555378765', 'Marsha.Downs@somewhere.com'
);

INSERT INTO Pet_Owner (OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail)VALUES
(
'James', 'Richard', '5555377654', 'Richard.James@somewhere.som'
);

INSERT INTO Pet_Owner (OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail)VALUES
(
'Frier', 'Liz', '5555376543', 'Liz.Frier@somewhere.com'
);

INSERT INTO Pet_Owner (OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail)VALUES
(
'Trent', 'Miles', ' ', 'Miles.Trent@somewhere.com'
);

INSERT INTO Pet VALUES
(
1, 'King', 'Dog', 'Std. Poodle', '21.02.2011', 25.5, 1
);

INSERT INTO Pet VALUES
(
2, 'Teddy', 'Cat', 'Cashmere', '01.02.2012', 10.5, 2
);

INSERT INTO Pet VALUES
(
3, 'Fido', 'Dog', 'Std. Poodle', '17.07.2010', 28.5, 1
);

INSERT INTO Pet VALUES
(
4, 'AJ', 'Dog', 'Collie Mix', '05.05.2011', 20.0, 3
);

INSERT INTO Pet VALUES
(
5, 'Cedro', 'Cat', 'Unknown', '06.06.2009', 9.5, 2
);

INSERT INTO Pet VALUES
(
6, 'Wooley', 'Cat', 'Unknown', ' ', 9.5, 2
);

INSERT INTO Pet VALUES
(
7, 'Buster', 'Dog', 'Border Collie', '11.12.2008', 25.0, 4
);

--øvelse 3.15
SELECT	PetId, PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerId
FROM	Pet

-- øvelse 3.16
SELECT * FROM Pet

-- øvelse 3.17
SELECT	PetType, PetBreed
FROM	Pet

-- øvelse 3.18
SELECT	PetType, PetBreed, PetDOB
FROM	Pet
WHERE	PetType = 'Dog'

-- øvelse 3.19
SELECT	PetBreed
FROM	Pet

-- øvelse 3.20
SELECT	DISTINCT PetBreed
FROM	Pet

-- øvelse 3.21
SELECT	PetType, PetBreed, PetDOB
FROM	Pet
WHERE	PetType = 'Dog' AND PetBreed = 'Std. Poodle'

-- øvelse 3.22
SELECT	PetName, PetType, PetBreed
FROM	Pet
WHERE	PetType NOT IN ('Cat', 'Dog', 'Fish')

-- øvelse 3.24
SELECT	OwnerLastName, OwnerFirstName, OwnerEmail
FROM	Pet_Owner
WHERE	OwnerEmail LIKE '%somewhere.com'

-- øvelse 3.26
SELECT		PetName, PetBreed
FROM		Pet
ORDER BY	PetName 

-- øvelse 3.29
SELECT		COUNT(DISTINCT PetBreed) AS NumOfPetBreeds
FROM		Pet

-- øvelse 3.31
SELECT		MIN(PetWeight) AS MinWeight,
			MAX(PetWeight) AS MaxWeight,
			AVG(PetWeight) AS AvgWeight
FROM		Pet

-- øvelse 3.32
SELECT		PetBreed, AVG(PetWeight) AS AvgWeight
FROM		Pet
GROUP BY	PetBreed

-- øvelse 3.33
SELECT		PetBreed, AVG(PetWeight) AS AvgWeight
FROM		Pet
GROUP BY	PetBreed
HAVING		COUNT (*) > 1;

-- øvelse 3.34
SELECT		PetBreed, AVG(PetWeight) AS AvgWeight
FROM		Pet
WHERE		PetBreed NOT IN ('Unknown')
GROUP BY	PetBreed
HAVING		COUNT (*) > 1;

-- øvelse 3.35
SELECT	OwnerLastName, OwnerFirstName, OwnerEmail
FROM	Pet_Owner
Where	OwnerId IN 
		(SELECT		OwnerId
		 FROM		Pet
		 WHERE		PetType = 'Cat');

-- øvelse 3.36
