-- decimal datatype https://stackoverflow.com/questions/1796334/mysql-preferred-column-type-for-product-prices

SELECT ROUND(MIN(service_price), 2) AS 'faturamento_minimo',
 MAX(service_price) AS 'faturamento_maximo',
 ROUND(AVG(service_price), 2) AS 'faturamento_medio',
 ROUND(SUM(service_price), 2) AS 'faturamento_total'
 FROM SpotifyClone.services AS Services
 INNER JOIN SpotifyClone.users AS Users ON Users.service_id = Services.service_id;
