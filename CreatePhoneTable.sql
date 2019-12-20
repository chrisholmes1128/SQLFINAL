USE FinalProject;
DROP TABLE IF EXISTS PhoneNumber;

CREATE TABLE PhoneNumber(
  Phone_ID int(11),
  Phone VARCHAR(255) NOT NULL,
  Type VARCHAR(255),
  FOREIGN KEY  (Phone_ID) REFERENCES Contact(Contact_ID)
) AS
	SELECT DISTINCT Phone
	FROM Contact
	WHERE Phone IS NOT NULL
	ORDER BY Phone;

UPDATE PhoneNumber
	INNER JOIN Contact
	ON Contact.Phone = PhoneNumber.Phone
	SET PhoneNumber.Phone_ID = Contact.Contact_ID, PhoneNumber.Type = 'Cell'
	WHERE Contact.Phone IS NOT NULL;

INSERT INTO PhoneNumber
    SELECT DISTINCT Contact_ID,  null, Fax
    FROM Contact
    WHERE Fax IS NOT NULL
    ORDER BY Fax;

UPDATE PhoneNumber
	INNER JOIN Contact
	ON Contact.Fax = PhoneNumber.Phone
	SET PhoneNumber.Phone_ID = Contact.Contact_ID, PhoneNumber.Type = 'Fax'
	WHERE Contact.Fax IS NOT NULL;

ALTER TABLE Contact
	DROP Phone, DROP Fax;