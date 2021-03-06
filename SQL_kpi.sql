CREATE TABLE alternance.temp1
SELECT CODE_AGENCE, count( COMPTE_RENDU) as 'sales'
FROM  alternance.ventes
WHERE CODE_AGENCE IN (110, 130, 135, 150, 160, 161, 178, 192, 194) AND
   (COMPTE_RENDU = "Vendu installation terminee" OR 
     (COMPTE_RENDU = "Vendu installation a faire" AND DATE_PREVUE_INSTALLATION BETWEEN '2021-11-08' AND '2021-12-06')
   )
GROUP BY CODE_AGENCE;



CREATE TABLE alternance.temp2 
SELECT SERVICE , count(*) as 'etp'
FROM  alternance.abc
WHERE SERVICE IN (110, 130, 135, 150, 160, 161, 178, 192, 194) AND
      DIVISION IN (1, 8, 9, 10 ,11)                   AND
	  ( Fonction LIKE '%Expert%' OR Fonction LIKE '%équipe%' )          
GROUP BY SERVICE ;



CREATE TABLE alternance.verisure
SELECT * , a.sales/b.etp as 'sales_by_person'
FROM alternance.temp1 as a
INNER JOIN alternance.temp2 as b
ON a.CODE_AGENCE = b.SERVICE; 

