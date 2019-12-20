USE FinalProject;
DROP TABLE IF EXISTS City;

CREATE TABLE City(
  City_ID int(11) NOT NULL auto_increment,
  City VARCHAR(25) NOT NULL,
  PRIMARY KEY  (City_ID)
) AS
	SELECT DISTINCT City
	FROM Contact
	WHERE City IS NOT NULL
	ORDER BY City;

ALTER TABLE Contact
	ADD COLUMN City_ID INT(11),
	ADD FOREIGN KEY (City_ID) REFERENCES City(City_ID);

UPDATE Contact
	INNER JOIN City
	ON City.City = Contact.City
	SET Contact.City_ID = City.City_ID
	WHERE City.City IS NOT NULL;

ALTER TABLE Contact
	DROP COLUMN City;

CREATE TABLE State(
  State_ID int(11) NOT NULL auto_increment,
  State VARCHAR(25) NOT NULL,
  TaxRate INT(11),
  PRIMARY KEY  (State_ID)
) AS
	SELECT DISTINCT State, TaxRate
	FROM Contact
	WHERE State IS NOT NULL
	ORDER BY State;

ALTER TABLE Contact
	ADD COLUMN State_ID INT(11),
	ADD FOREIGN KEY (State_ID) REFERENCES State(State_ID);

UPDATE Contact
	INNER JOIN State
	ON State.State = Contact.State
	SET Contact.State_ID = State.State_ID
	WHERE State.State IS NOT NULL;

UPDATE Contact
    INNER JOIN State
    ON State.TaxRate = Contact.TaxRate
    SET Contact.TaxRate = State.TaxRate
    WHERE State.State IS NOT NULL;


ALTER TABLE Contact
	DROP COLUMN State;