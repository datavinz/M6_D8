CREATE TABLE Eda_1 AS
(
SELECT * FROM
(SELECT 
	(SELECT DISTINCT prodotto FROM fuel_price_it WHERE prodotto = "GPL") AS fuel, -- nome carburante
	(SELECT TRUNCATE(AVG(prezzo),3) FROM fuel_price_it 
   	WHERE (anno BETWEEN 2003 AND 2007) AND prodotto = "GPL") AS 03_07_avg, -- media prezzo 5 anni 03/07
  (SELECT TRUNCATE(AVG(prezzo),3) FROM fuel_price_it 
   	WHERE (anno BETWEEN 2008 AND 2012) AND prodotto = "GPL") AS 08_12_avg, -- media prezzo 5 anni 08/12
  (SELECT TRUNCATE(AVG(prezzo),3) FROM fuel_price_it 
   	WHERE (anno BETWEEN 2013 AND 2017) AND prodotto = "GPL") AS 13_17_avg, -- media prezzo 5 anni 13/17
  (SELECT TRUNCATE(AVG(prezzo),3) FROM fuel_price_it 
   	WHERE (anno BETWEEN 2018 AND 2022) AND prodotto = "GPL") AS 18_22_avg, -- media prezzo 5 anni 18/22
  (SELECT TRUNCATE(AVG(prezzo),3) FROM fuel_price_it 
   	WHERE prodotto = "GPL" AND anno = 2022) AS 22_avg, -- media prezzo 2022, ultimo anno intero
  (SELECT TRUNCATE(MIN(prezzo),3) FROM fuel_price_it 
   	WHERE prodotto = "GPL") AS min_p, -- prezzo minimo
  (SELECT DISTINCT anno FROM fuel_price_it 
   	WHERE prodotto = "GPL" AND prezzo = (SELECT MIN(prezzo)
  	FROM fuel_price_it WHERE prodotto = 'GPL')) AS min_p_y, -- anno prezzo minimo
  (SELECT TRUNCATE(MAX(prezzo),3) FROM fuel_price_it 
   	WHERE prodotto = "GPL") AS max_p, -- prezzo massimo
  (SELECT DISTINCT anno FROM	fuel_price_it 
   	WHERE prodotto = "GPL" AND prezzo = (SELECT MAX(prezzo)
  	FROM fuel_price_it WHERE prodotto = 'GPL')) AS max_p_y, -- anno prezzo massimo
	(SELECT TRUNCATE(AVG(tax), 3) FROM fuel_price_it
   	WHERE prodotto = "GPL") AS avg_tax, -- media tasse
  (SELECT TRUNCATE(AVG(inc_tax),2) FROM fuel_price_it WHERE prodotto = "GPL") AS avg_it, -- media incidenza tasse
 	(SELECT TRUNCATE(AVG(inc_tax),2) FROM fuel_price_it WHERE prodotto = "GPL" AND ANNO = 2022) AS avg_it22, -- media incidenza tasse 2022
  (SELECT MAX(inc_tax) FROM fuel_price_it
   	WHERE prodotto = "GPL") AS max_it, -- massimo incidenza tasse
   (SELECT MIN(inc_tax) FROM fuel_price_it
   	WHERE prodotto = "GPL") AS min_it) AS tb1 -- minimo incidenza tasse
UNION 
SELECT * FROM
(SELECT 
	(SELECT DISTINCT prodotto FROM fuel_price_it WHERE prodotto = "Benzina") AS fuel, -- nome carburante
	(SELECT TRUNCATE(AVG(prezzo),3) FROM fuel_price_it 
   	WHERE (anno BETWEEN 2003 AND 2007) AND prodotto = "Benzina") AS 03_07_avg, -- media prezzo 5 anni 03/07
  (SELECT TRUNCATE(AVG(prezzo),3) FROM fuel_price_it 
   	WHERE (anno BETWEEN 2008 AND 2012) AND prodotto = "Benzina") AS 08_12_avg, -- media prezzo 5 anni 08/12
  (SELECT TRUNCATE(AVG(prezzo),3) FROM fuel_price_it 
   	WHERE (anno BETWEEN 2013 AND 2017) AND prodotto = "Benzina") AS 13_17_avg, -- media prezzo 5 anni 13/17
  (SELECT TRUNCATE(AVG(prezzo),3) FROM fuel_price_it 
   	WHERE (anno BETWEEN 2018 AND 2022) AND prodotto = "Benzina") AS 18_22_avg, -- media prezzo 5 anni 18/22
  (SELECT TRUNCATE(AVG(prezzo),3) FROM fuel_price_it 
   	WHERE prodotto = "Benzina" AND anno = 2022) AS 22_avg, -- media prezzo 2022, ultimo anno intero
  (SELECT TRUNCATE(MIN(prezzo),3) FROM fuel_price_it 
   	WHERE prodotto = "Benzina") AS min_p, -- prezzo minimo
  (SELECT DISTINCT anno FROM fuel_price_it 
   	WHERE prodotto = "Benzina" AND prezzo = (SELECT MIN(prezzo)
  	FROM fuel_price_it WHERE prodotto = 'Benzina')) AS min_p_y, -- anno prezzo minimo
  (SELECT TRUNCATE(MAX(prezzo),3) FROM fuel_price_it 
   	WHERE prodotto = "Benzina") AS max_p, -- prezzo massimo
  (SELECT DISTINCT anno FROM	fuel_price_it 
   	WHERE prodotto = "Benzina" AND prezzo = (SELECT MAX(prezzo)
  	FROM fuel_price_it WHERE prodotto = 'Benzina')) AS max_p_y, -- anno prezzo massimo
	(SELECT TRUNCATE(AVG(tax), 3) FROM fuel_price_it
   	WHERE prodotto = "Benzina") AS avg_tax, -- media tasse
  (SELECT TRUNCATE(AVG(inc_tax),2) FROM fuel_price_it WHERE prodotto = "Benzina") AS avg_it, -- media incidenza tasse
 	(SELECT TRUNCATE(AVG(inc_tax),2) FROM fuel_price_it WHERE prodotto = "Benzina" AND ANNO = 2022) AS avg_it22, -- media incidenza tasse 2022
  (SELECT MAX(inc_tax) FROM fuel_price_it
   	WHERE prodotto = "Benzina") AS max_it, -- massimo incidenza tasse
   (SELECT MIN(inc_tax) FROM fuel_price_it
   	WHERE prodotto = "Benzina") AS min_it) AS tb2 -- minimo incidenza tasse
UNION 
SELECT * FROM
(SELECT 
  (SELECT DISTINCT prodotto FROM fuel_price_it WHERE prodotto = "Diesel") AS fuel, -- nome carburante
  (SELECT TRUNCATE(AVG(prezzo),3) FROM fuel_price_it 
   	WHERE (anno BETWEEN 2003 AND 2007) AND prodotto = "Diesel") AS 03_07_avg, -- media prezzo 5 anni 03/07
  (SELECT TRUNCATE(AVG(prezzo),3) FROM fuel_price_it 
   	WHERE (anno BETWEEN 2008 AND 2012) AND prodotto = "Diesel") AS 08_12_avg, -- media prezzo 5 anni 08/12
  (SELECT TRUNCATE(AVG(prezzo),3) FROM fuel_price_it 
   	WHERE (anno BETWEEN 2013 AND 2017) AND prodotto = "Diesel") AS 13_17_avg, -- media prezzo 5 anni 13/17
  (SELECT TRUNCATE(AVG(prezzo),3) FROM fuel_price_it 
   	WHERE (anno BETWEEN 2018 AND 2022) AND prodotto = "Diesel") AS 18_22_avg, -- media prezzo 5 anni 18/22
  (SELECT TRUNCATE(AVG(prezzo),3) FROM fuel_price_it 
   	WHERE prodotto = "Diesel" AND anno = 2022) AS 22_avg, -- media prezzo 2022, ultimo anno intero
  (SELECT TRUNCATE(MIN(prezzo),3) FROM fuel_price_it 
   	WHERE prodotto = "Diesel") AS min_p, -- prezzo minimo
  (SELECT DISTINCT anno FROM fuel_price_it 
   	WHERE prodotto = "Diesel" AND prezzo = (SELECT MIN(prezzo)
  	FROM fuel_price_it WHERE prodotto = 'Diesel')) AS min_p_y, -- anno prezzo minimo
  (SELECT TRUNCATE(MAX(prezzo),3) FROM fuel_price_it 
   	WHERE prodotto = "Diesel") AS max_p, -- prezzo massimo
  (SELECT DISTINCT anno FROM	fuel_price_it 
   	WHERE prodotto = "Diesel" AND prezzo = (SELECT MAX(prezzo)
  	FROM fuel_price_it WHERE prodotto = 'Diesel')) AS max_p_y, -- anno prezzo massimo
  (SELECT TRUNCATE(AVG(tax), 3) FROM fuel_price_it
   	WHERE prodotto = "Diesel") AS avg_tax, -- media tasse
  (SELECT TRUNCATE(AVG(inc_tax),2) FROM fuel_price_it WHERE prodotto = "Diesel") AS avg_it, -- media incidenza tasse
 	(SELECT TRUNCATE(AVG(inc_tax),2) FROM fuel_price_it WHERE prodotto = "Diesel" AND ANNO = 2022) AS avg_it22, -- media inc tax22
  (SELECT MAX(inc_tax) FROM fuel_price_it
   	WHERE prodotto = "Diesel") AS max_it, -- massimo incidenza tasse
  (SELECT MIN(inc_tax) FROM fuel_price_it
   	WHERE prodotto = "Diesel") AS min_it) AS tb3 -- minimo incidenza tasse
 ); 



