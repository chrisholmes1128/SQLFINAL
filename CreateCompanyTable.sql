USE FinalProject;
DROP TABLE IF EXISTS Company;

CREATE TABLE Company(
  Company_ID int(11) NOT NULL auto_increment,
  Company VARCHAR(25) NOT NULL,
  PRIMARY KEY  (Company_ID)
) AS
	SELECT DISTINCT Company
	FROM Contact
	WHERE Company IS NOT NULL
	ORDER BY Company;

ALTER TABLE Contact
	ADD COLUMN Company_ID INT(11),
	ADD FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID);

UPDATE Contact
	INNER JOIN Company
	ON Company.Company = Contact.Company
	SET Contact.Company_ID = Company.Company_ID
	WHERE Company.Company IS NOT NULL;

ALTER TABLE Contact
	DROP COLUMN Company;