USE FinalProject;
DROP TABLE IF EXISTS ShipVia;

CREATE TABLE ShipVia(
  ShipViaID int(11) NOT NULL auto_increment,
  ShipVia VARCHAR(25) NOT NULL,
  PRIMARY KEY  (ShipViaID)
) AS
	SELECT DISTINCT ShipVia
	FROM invoices
	WHERE ShipVia IS NOT NULL
	ORDER BY ShipVia;

ALTER TABLE invoices
	ADD COLUMN ShipViaID INT(11),
	ADD FOREIGN KEY (ShipViaID) REFERENCES ShipVia(ShipVia_ID);

UPDATE invoices
	INNER JOIN ShipVia
	ON ShipVia.ShipVia = invoices.ShipVia
	SET invoices.ShipVia_ID = ShipVia.ShipViaID
	WHERE ShipVia.ShipVia IS NOT NULL;

ALTER TABLE invoices
	DROP COLUMN ShipVia;

#-------------- SHIPMENT STATUS --------------
DROP TABLE IF EXISTS ShipmentStatus;

CREATE TABLE ShipmentStatus(
  ShipmentStatusID int(11) NOT NULL auto_increment,
  ShipmentStatus VARCHAR(25) NOT NULL,
  PRIMARY KEY  (ShipmentStatusID)
) AS
	SELECT DISTINCT ShipmentStatus
	FROM invoices
	WHERE ShipmentStatus IS NOT NULL
	ORDER BY ShipmentStatus;

ALTER TABLE invoices
	ADD COLUMN ShipmentStatusID INT(11),
	ADD FOREIGN KEY (ShipmentStatusID) REFERENCES ShipmentStatus(ShipmentStatus_ID);

UPDATE invoices
	INNER JOIN ShipmentStatus
	ON ShipmentStatus.ShipmentStatus = invoices.ShipmentStatus
	SET invoices.ShipmentStatus_ID = ShipmentStatus.ShipmentStatusID
	WHERE ShipmentStatus.ShipmentStatus IS NOT NULL;

ALTER TABLE invoices
	DROP COLUMN ShipmentStatus;
