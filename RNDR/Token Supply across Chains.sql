WITH 

eth AS 
(SELECT sum(amount) AS eth_supply, 
COUNT (wallet) AS eth_holders
FROM
(SELECT DISTINCT "from" AS wallet,
- SUM (CAST(value As uint256)/1e18) AS amount
FROM erc20_ethereum.evt_Transfer
WHERE contract_address = 0x6De037ef9aD2725EB40118Bb1702EBb27e4Aeb24
AND "from" != 0x0000000000000000000000000000000000000000
GROUP BY 1

UNION ALL

SELECT DISTINCT "to" AS wallet,
SUM (CAST(value As uint256)/1e18) AS amount
FROM erc20_ethereum.evt_Transfer
WHERE contract_address = 0x6De037ef9aD2725EB40118Bb1702EBb27e4Aeb24
AND "to" != 0x0000000000000000000000000000000000000000
GROUP BY 1)), 


poly AS 
(SELECT sum(amount) AS poly_supply,
COUNT (wallet) AS poly_holders
FROM
(SELECT DISTINCT "from" AS wallet,
- SUM (CAST(value As uint256)/1e18) AS amount
FROM erc20_polygon.evt_Transfer
WHERE contract_address = 0x61299774020dA444Af134c82fa83E3810b309991
AND "from" <> 0x0000000000000000000000000000000000000000
GROUP BY 1

UNION 

SELECT DISTINCT "to" AS wallet,
SUM (CAST(value As uint256)/1e18) AS amount
FROM erc20_polygon.evt_Transfer
WHERE contract_address = 0x61299774020dA444Af134c82fa83E3810b309991
AND "to" <> 0x0000000000000000000000000000000000000000
GROUP BY 1))


SELECT *
FROM eth,poly