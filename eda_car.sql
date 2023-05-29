CREATE TABLE eda_2 AS
(
SELECT * FROM
 	(SELECT
   	(SELECT DISTINCT prodotto FROM fuel_price_it WHERE prodotto = "Diesel") AS fuel,
  	(SELECT 
    	TRUNCATE(AVG(prezzo),3) * (SELECT TRUNCATE((655/(100/4.3)),3)) 
      FROM fuel_price_it 
      WHERE prodotto = "Diesel" AND anno = 2003) AS rom_mil_car_03,
   	(SELECT 
    	TRUNCATE(AVG(prezzo),3) * (SELECT TRUNCATE((655/(100/4.3)),3)) 
      FROM fuel_price_it 
      WHERE prodotto = "Diesel" AND anno = 2022) AS rom_mil_car_22, 
   	(SELECT 
    	TRUNCATE(AVG(prezzo),3) * 4.3 
      FROM fuel_price_it 
      WHERE prodotto = "Diesel" AND anno = 2003) AS 100km_car_03,
   (SELECT 
    	TRUNCATE(AVG(prezzo),3) * 4.3
      FROM fuel_price_it 
      WHERE prodotto = "Diesel" AND anno = 2022) AS 100km_car_22) AS tb4
UNION
SELECT * FROM
 (SELECT
   	(SELECT DISTINCT prodotto FROM fuel_price_it WHERE prodotto = "Benzina") AS fuel,
  	(SELECT 
    	TRUNCATE(AVG(prezzo),3) * (SELECT TRUNCATE((655/(100/5)),3)) 
      FROM fuel_price_it 
      WHERE prodotto = "Benzina" AND anno = 2003) AS rom_mil_car_03,
   	(SELECT 
    	TRUNCATE(AVG(prezzo),3) * (SELECT TRUNCATE((655/(100/5)),3)) 
      FROM fuel_price_it 
      WHERE prodotto = "Benzina" AND anno = 2022) AS rom_mil_car_22, 
   	(SELECT 
    	TRUNCATE(AVG(prezzo),3) * 5
      FROM fuel_price_it 
      WHERE prodotto = "Benzina" AND anno = 2003) AS 100km_car_03,
   (SELECT 
    	TRUNCATE(AVG(prezzo),3) * 5
      FROM fuel_price_it 
      WHERE prodotto = "Benzina" AND anno = 2022) AS 100km_car_22) AS tb5
UNION
SELECT * FROM
 (SELECT
   	(SELECT DISTINCT prodotto FROM fuel_price_it WHERE prodotto = "GPL") AS fuel,
  	(SELECT 
    	TRUNCATE(AVG(prezzo),3) * (SELECT TRUNCATE((655/(100/5)),3)) 
      FROM fuel_price_it 
      WHERE prodotto = "GPL" AND anno = 2003) AS rom_mil_car_03,
   	(SELECT 
    	TRUNCATE(AVG(prezzo),3) * (SELECT TRUNCATE((655/(100/5)),3)) 
      FROM fuel_price_it 
      WHERE prodotto = "GPL" AND anno = 2022) AS rom_mil_car_22, 
   	(SELECT 
    	TRUNCATE(AVG(prezzo),3) * 7.2
      FROM fuel_price_it 
      WHERE prodotto = "GPL" AND anno = 2003) AS 100km_car_03,
   (SELECT 
    	TRUNCATE(AVG(prezzo),3) * 7.2
      FROM fuel_price_it 
      WHERE prodotto = "GPL" AND anno = 2022) AS 100km_car_22) AS tb6
  );


CREATE TABLE eda_car AS
(SELECT 
 fuel,
 TRUNCATE(rom_mil_car_03,2) AS rom_mil_car_03,
 TRUNCATE(rom_mil_car_22,2) AS rom_mil_car_22,
 TRUNCATE(100km_car_03,2) AS 100km_car_03,
 TRUNCATE(100km_car_22,2) AS 100km_car_22
FROM eda_2);