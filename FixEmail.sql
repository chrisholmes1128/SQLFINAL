USE FinalProject;
DROP TABLE IF EXISTS Email;

CREATE TABLE Email(
  Email_ID int(11),
  Email VARCHAR(255) NOT NULL,
  FOREIGN KEY  (Email_ID) REFERENCES Contact(Contact_ID)
) AS
	SELECT DISTINCT Email
	FROM Contact
	WHERE Email IS NOT NULL
	ORDER BY Email;

UPDATE Email
	INNER JOIN Contact
	ON Contact.Email = Email.Email
	SET Email.Email_ID = Contact.Contact_ID
	WHERE Contact.Email IS NOT NULL;
ALTER TABLE Contact
	DROP COLUMN Email;