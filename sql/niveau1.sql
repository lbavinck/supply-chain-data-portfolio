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

-- Exercice 5 : nombre de commandes par mois
SELECT
    date_trunc('month', order_purchase_timestamp)::DATE AS mois,
    COUNT(*) AS nb_orders
FROM 'data/olist/olist_orders_dataset.csv'
GROUP BY mois
ORDER BY mois;

-- Exercice 7 : chiffre d'affaires par catégorie de produit (top 10)
SELECT
    p.product_category_name,
    ROUND(SUM(oi.price), 2) AS chiffre_affaires
FROM 'data/olist/olist_order_items_dataset.csv' AS oi
INNER JOIN 'data/olist/olist_products_dataset.csv' AS p
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY chiffre_affaires DESC
LIMIT 10;

-- Verification articles without categories

SELECT COUNT(*) AS nb_articles_sans_categorie
FROM 'data/olist/olist_order_items_dataset.csv' AS oi
INNER JOIN 'data/olist/olist_products_dataset.csv' AS p
    ON oi.product_id = p.product_id
WHERE p.product_category_name IS NULL;