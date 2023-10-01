WITH 

current AS (
  SELECT price AS current_price
  FROM prices.usd
  WHERE symbol = 'RNDR'
  ORDER BY minute DESC
  LIMIT 1), 
  
  dates AS (
  SELECT AVG(price) AS average,
    MAX(price) AS peak,
    MIN(price) AS bottom
  FROM prices.usd
  WHERE symbol = 'RNDR')

SELECT current_price,
  average,
  peak,
  bottom,
  (SELECT DATE_FORMAT(minute, '%d %M, %Y') FROM prices.usd WHERE price = peak AND symbol = 'RNDR' ORDER BY minute DESC LIMIT 1) AS peak_date,
  (SELECT DATE_FORMAT(minute, '%d %M, %Y') FROM prices.usd WHERE price = bottom AND symbol = 'RNDR' ORDER BY minute ASC LIMIT 1) AS bottom_date
FROM current, dates

