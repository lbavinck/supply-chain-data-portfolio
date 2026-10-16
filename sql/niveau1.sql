-- ============================================================
-- Olist - Niveau 1 & 2 : SELECT / WHERE / GROUP BY
-- ============================================================

-- Exercice 1 : 10 premières commandes (id, statut, date d'achat)
SELECT order_id, order_status, order_purchase_timestamp
FROM 'data/olist/olist_orders_dataset.csv'
ORDER BY order_purchase_timestamp
LIMIT 10;

-- Exercice 2 : nombre de commandes annulées (attendu : 625)
SELECT COUNT(*) AS nb_commandes_annulees
FROM 'data/olist/olist_orders_dataset.csv'
WHERE order_status = 'canceled';

-- Exercice 3 : commandes livrées en 2018 (aperçu des 10 premières)
SELECT order_id, order_purchase_timestamp
FROM 'data/olist/olist_orders_dataset.csv'
WHERE order_status = 'delivered'
  AND year(order_purchase_timestamp) = 2018
ORDER BY order_purchase_timestamp
LIMIT 10;

-- Exercice 3 (contrôle) : nombre de commandes livrées en 2018 (attendu : 52783)
SELECT COUNT(*) AS nb_commandes
FROM 'data/olist/olist_orders_dataset.csv'
WHERE order_status = 'delivered'
  AND year(order_purchase_timestamp) = 2018;

-- Exercice 4 : nombre de commandes par statut, du plus fréquent au moins fréquent
SELECT
    order_status,
    COUNT(*) AS nb_commandes
FROM 'data/olist/olist_orders_dataset.csv'
GROUP BY order_status
ORDER BY nb_commandes DESC;