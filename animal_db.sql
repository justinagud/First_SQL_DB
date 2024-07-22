CREATE DATABASE DB_ANIMAL_REGISTER;

USE ANIMAL_REGISTER;

CREATE TABLE CHIP_PLACE (
CHIP_PLACE_CODE INT NOT NULL PRIMARY KEY,
NAME VARCHAR(255)
);

CREATE TABLE CHIP (
CHIP_ID CHAR(3) NOT NULL PRIMARY KEY, 
MANUFACTURER_CODE VARCHAR(255),
NAME VARCHAR(255),
CHIP_PLACE_CODE INT NOT NULL,
FOREIGN KEY (CHIP_PLACE_CODE) REFERENCES CHIP_PLACE(CHIP_PLACE_CODE)
);

CREATE TABLE GENDER (
GENDER_ID INT NOT NULL PRIMARY KEY, 
NAME VARCHAR(255),
CASTRATION VARCHAR(255)
);

CREATE TABLE HOST (
HOST_ID CHAR(6) NOT NULL PRIMARY KEY, 
NAME TEXT,
SURNAME TEXT,
CITY TEXT, 
ADDRESS VARCHAR(255),
PHONE CHAR(12)
);

CREATE TABLE COLOUR (
COLOUR_CODE INT NOT NULL PRIMARY KEY, 
NAME TEXT, 
FUR_TYPE TEXT
);

CREATE TABLE SPECIES (
SPECIES_CODE CHAR(2) NOT NULL PRIMARY KEY, 
CATEGORY TEXT, 
NAME TEXT,
COLOUR_CODE INT NOT NULL,
FOREIGN KEY (COLOUR_CODE) REFERENCES COLOUR(COLOUR_CODE)
);

CREATE TABLE ANIMAL_BASIC (
ANIMAL_ID CHAR(9) NOT NULL PRIMARY KEY,
NAME VARCHAR(255),
SPECIES CHAR(2),
CHIP_ID CHAR(3) NOT NULL, 
HOST_ID CHAR(6) NOT NULL,
GENDER_ID INT,  
FOREIGN KEY (SPECIES) REFERENCES SPECIES(SPECIES_CODE),  
FOREIGN KEY (CHIP_ID) REFERENCES CHIP(CHIP_ID),
FOREIGN KEY (HOST_ID) REFERENCES HOST(HOST_ID),
FOREIGN KEY (GENDER_ID) REFERENCES GENDER(GENDER_ID)
);

CREATE TABLE ANIMAL (
ANIMAL_CARD_NO INT NOT NULL PRIMARY KEY, 
HOST_ID CHAR(6) NOT NULL,
ANIMAL_ID CHAR(9) NOT NULL,
FOREIGN KEY (HOST_ID) REFERENCES HOST(HOST_ID),
FOREIGN KEY (ANIMAL_ID) REFERENCES ANIMAL_BASIC(ANIMAL_ID)
);

INSERT INTO CHIP_PLACE (CHIP_PLACE_CODE, NAME)
VALUES (1, 'Between the shoulder blades'),
		(2, 'Left front leg'),
        (3, 'Right front leg'),
        (4, 'On the left side of the neck'),
        (5, 'On the right side of the neck'),
        (6, 'Left back leg'),
        (7, 'Right back leg');
        
INSERT INTO CHIP (CHIP_ID, MANUFACTURER_CODE, NAME, CHIP_PLACE_CODE)
VALUES (463, 'ALX', 'ALLFLEX', 2),
		(454, 'ALX', 'ALLFLEX', 3),
        (455, 'ALX', 'ALLFLEX', 6),
        (678, 'ALX', 'ALLFLEX', 7),
        (158, 'IB', 'IsoBlue', 1),
        (504, 'BM', 'BartMed', 2),
		(577, 'BM', 'BartMed', 3),
		(802, 'NA', 'Unknown', 1),
        (976, 'SWP', 'SwissPluss ID', 4),
        (910, 'SWP', 'SwissPluss ID', 5),
        (117, 'TRO', 'Trovan', 1),
        (215, 'AVI', 'Avid', 7),
        (213, 'AVI', 'Avid', 6),
        (248, 'AVI', 'Avid', 3),
        (279, 'AVI', 'Avid', 2);
        
INSERT INTO GENDER (GENDER_ID, NAME, CASTRATION)
VALUES (1, 'Female', 'Castrated'),
		(2, 'Female', 'Not Castrated'),
        (3, 'Female', 'Unknown'),
        (4, 'Male', 'Castrated'),
        (5, 'Male', 'Not Castrated'),
        (6, 'Male', 'Unknown');
        
INSERT INTO HOST (HOST_ID, NAME, SURNAME, CITY, ADDRESS, PHONE)
VALUES (884733, 'Elsie', 'Mcdonalid', 'San Antonio', '8410 W Campbell Ave', '405548-3849'),
		(274369, 'Wesley', 'Jimenez', 'Colorado', '1961 Railrod St', '832921-7098'),
        (443072, 'Norma', 'Franklin', 'Houston', '3457 Homestead Rd', '646693-3350;'),
        (166599, 'Ruben', 'Barnes', 'Phoenix', '3317 Mockingbird Ln', '931673-3114'),
        (581384, 'Wyatt', 'Johnson', 'Chicago', '1096 Valwood Pkwy', '272725-4089'),
        (033437, 'Travis', 'Chapman', 'Houston', '2680 Saddle Dr', '805481-1482'),
        (698179, 'Kaylee', 'Little', 'Austin', '9778 W Gray St', ''),
        (927124, 'Eleanor', 'George', 'San Diego', '629 Pecan Acres Ln', '515303-0437'), 
        (577154, 'Carl', 'Fox', 'Chicago', '', '722771-5639'),
        (306890, 'Maurice', 'Knight', 'Colorado', '2326 Bruce St', '893431-7207'),
        (004689, 'Louise', 'Williamson', 'Indianapolis', '', ''),
        (704950, 'Vera', 'Perez', 'Chicago', '3371 Photinia Ave', '323371-5061'),
        (485875, 'Rafael', 'Fernandez', 'Colorado', '949 Northaven Rd', '983290-6343'),
        (995356, 'Bradley', 'Peterson', 'Austin', '1587 W Gray St', '');
        
INSERT INTO COLOUR (COLOUR_CODE, NAME, FUR_TYPE)
VALUES (1, 'Black', 'Long haired'),
		(2, 'White', 'Short haired'),
        (3, 'Brown', 'Long haired'),
        (4, 'Gray', 'Long haired'),
        (5, 'Black, White, Brown', 'Tortoiseshell'),
        (6, 'Colour mix', 'Curly'),
        (7, 'Unknown', 'Hairless'),
        (8, 'Black', 'Short haired'),
        (9, 'White, Brown', 'Tortoiseshell'),
        (10, 'Gray, Black','Curly'),
        (11, 'White','Long haired'),
        (12, 'Black', 'Curly');
        
INSERT INTO SPECIES (SPECIES_CODE, CATEGORY, NAME, COLOUR_CODE)
VALUES ('Dv', 'Dog', 'Vipet', 8),
		('Cs', 'Cat', 'Sphinx', 7),
        ('Ba', 'Bird', 'Ara', 6),
        ('Cd', 'Chinchilla', 'Domestic chinchilla', 3),
        ('Gd', 'Guinea pig', 'Domestic guinea pig', 11),
        ('Rd', 'Rabbit', 'Domestic rabbit', 4),
        ('Rs', 'Rabbit', 'Shriveled rabbit',  2),
        ('Dc', 'Dog', 'Corgi', 9),
        ('Cr', 'Cat', 'Rex', 12),
        ('Bk', 'Bird', 'Kakadu', 6),
        ('Cc', 'Cat', 'Maine coon', 4),
        ('Dl', 'Dog', 'Labrador', 2),
        ('Cm', 'Cat', 'Mixed bread', 5),
        ('Dm', 'Dog', 'Mixed bread', 9),
        ('Bd', 'Bird', 'Domestic bird', 8),
        ('Cu', 'Cat', 'Unknown', 1),
        ('Du', 'Dog', 'Unknown', 10);
        
INSERT INTO ANIMAL_BASIC (ANIMAL_ID, NAME, SPECIES, CHIP_ID, HOST_ID, GENDER_ID)
VALUES (174204129, 'Jasper', 'Dv', 463, 884733, 1),
		(945556716, 'Splash', 'Ba', 454, 274369, 2),
        (941206767, 'Opie', 'Cs', 455, 443072, 3),
        (184048043, 'Capone', 'Cd', 678, 166599, 4),
        (457651113, 'Tiny', 'Gd', 158, 581384, 5),
        (012776020, 'Tilly', 'Rd', 504, 033437, 6),
        (600854165, 'Ivy', 'Rs', 577, 698179, 6),
        (647145238, 'Tito', 'Dc', 802, 927124, 5),
        (342403104, 'Finch', 'Cr', 976, 577154, 4),
        (099977613, 'Milan', 'Bk', 910, 306890, 3),
        (750443341, 'Goro', 'Cc', 117, 004689, 2),
        (204515155, 'Dank', 'Dl', 215, 704950, 1),
        (919577484, 'Lucy', 'Dc', 213, 485875, 4),
        (165844074, 'Nimbus', 'Cm', 248, 995356, 5),
        (141098187, 'Nike', 'Dm', 279, 166599, 3),
        (190031731, 'Gin', 'Cu', 577, 443072, 3),
        (979916728, 'Whisky', 'Du', 158, 927124, 6),
        (975783529, 'Kai', 'Bd', 504, 033437, 2),
        (346399764, 'Thai', 'Cm', 117, 995356, 4),
        (089576028, 'Cork', 'Dc', 158, 927124, 6),
        (340273003, 'Roger', 'Ba', 158, 698179, 1);
        
INSERT INTO ANIMAL (ANIMAL_CARD_NO, HOST_ID, ANIMAL_ID)
VALUES (1, 884733, 174204129),
		(2, 274369, 945556716),
        (3, 443072, 941206767),
        (4, 166599, 184048043),
        (5, 581384, 457651113),
        (6, 033437, 012776020),
        (7, 698179, 600854165),
        (8, 927124, 647145238),
        (10, 577154, 342403104),
        (11, 306890, 099977613),
        (12, 004689, 750443341),
        (13, 704950, 204515155),
        (14, 485875, 919577484),
        (15, 995356, 165844074),
        (16, 166599, 141098187),
        (17, 443072, 190031731),
        (18, 927124, 979916728),
        (19, 033437, 975783529),
        (20, 995356, 346399764),
        (21, 927124, 089576028),
        (22, 698179, 340273003);
