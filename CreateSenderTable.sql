USE FinalProject;
DROP TABLE IF EXISTS CreatedBy;

CREATE TABLE CreatedBy(
  CreatedBy_ID int(11) NOT NULL auto_increment,
  CreatedBy VARCHAR(25) NOT NULL,
  PRIMARY KEY  (CreatedBy_ID)
) AS
	SELECT DISTINCT CreatedBy
	FROM invoices
	WHERE CreatedBy IS NOT NULL
	ORDER BY CreatedBy;

ALTER TABLE invoices
	ADD COLUMN CreatedBy_ID INT(11),
	ADD FOREIGN KEY (CreatedBy_ID) REFERENCES CreatedBy(CreatedBy_ID);

UPDATE invoices
	INNER JOIN CreatedBy
	ON CreatedBy.CreatedBy = invoices.CreatedBy
	SET invoices.CreatedBy_ID = CreatedBy.CreatedBy_ID
	WHERE CreatedBy.CreatedBy IS NOT NULL;

ALTER TABLE invoices
	DROP COLUMN CreatedBy;