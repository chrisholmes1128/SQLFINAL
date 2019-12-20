DROP TABLE IF EXISTS PhoneType;

CREATE TABLE PhoneType(
  Type_ID int(11) NOT NULL auto_increment,
  Type VARCHAR(30) NOT NULL,
  PRIMARY KEY  (Type_ID)
) AS
	SELECT DISTINCT Type
	FROM PhoneNumber
	WHERE Type IS NOT NULL
	ORDER BY Type;

ALTER TABLE PhoneNumber
	ADD COLUMN Type_ID INT(11),
	ADD FOREIGN KEY (Type_ID) REFERENCES PhoneType(Type_ID);

UPDATE PhoneNumber
	INNER JOIN PhoneType
	ON PhoneType.Type = PhoneNumber.Type
	SET PhoneNumber.Type_ID = PhoneType.Type_ID
	WHERE PhoneType.Type IS NOT NULL;

ALTER TABLE PhoneNumber
	DROP COLUMN Type;