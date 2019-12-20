USE FinalProject;
DROP TABLE IF EXISTS Product;

ALTER TABLE invoices
	ADD PRIMARY KEY (InvoiceID);

CREATE TABLE Product(
  ProductID int(11),
  Price int(255),
  Quantity double(255, 4),
  ProductWeight int(255) NOT NULL,
  UnitDimentions VARCHAR(255),
  PartNumber int(255) NOT NULL,
  Taxable VARCHAR(1),
  FOREIGN KEY (ProductID) REFERENCES invoices(InvoiceID)
) AS
    SELECT DISTINCT Price, Quantity, ProductWeight, UnitDimensions,
                    PartNumber, ProductName ,Taxable
	FROM invoices
	ORDER BY PartNumber;

ALTER TABLE invoices
	DROP COLUMN PartNumber,
    DROP  ProductName,
    DROP  ProductWeight,
    DROP  Quantity,
    DROP  Price,
    DROP  Taxable,
    DROP  UnitDimensions;
