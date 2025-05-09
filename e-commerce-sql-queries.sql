WITH product_revenue AS (
    -- Calculate total revenue for each product
    SELECT product_id,
           SUM(price - freight_value) AS total_product_revenue
    FROM order_items
    GROUP BY product_id
),
revenue_with_percentile AS (
    -- Assign percentile rank based on total product revenue
    SELECT product_id,
           total_product_revenue,
           NTILE(100) OVER (ORDER BY total_product_revenue DESC) AS revenue_percentile
    FROM product_revenue
),
product_categories AS (
    -- Map product IDs to cleaned English category names
    SELECT p.product_id,
           REPLACE(pc.product_category_name_english, '_', ' ') AS product_category
    FROM products p
    JOIN product_category_name_translation pc
      ON p.product_category_name = pc.product_category_name
),
product_orders AS (
    -- Retrieve order timestamp and product-level revenue for each order
    SELECT o.order_id,
           oi.product_id,
           o.order_purchase_timestamp,
           oi.price - oi.freight_value AS product_revenue
    FROM orders o
    JOIN order_items oi
      ON o.order_id = oi.order_id
),
product_reviews AS (
    -- Compute average review score per product
    SELECT oi.product_id,
           AVG(orev.review_score) AS avg_review_score
    FROM order_items oi
    JOIN orders o
      ON oi.order_id = o.order_id
    JOIN order_reviews orev
      ON o.order_id = orev.order_id
    GROUP BY oi.product_id
)

-- Final combined staging table
SELECT po.product_id,
       po.order_id,
       po.order_purchase_timestamp,
       po.product_revenue,
       rwp.total_product_revenue,
       rwp.revenue_percentile,
       pc.product_category,
       pr.avg_review_score
FROM product_orders po
JOIN revenue_with_percentile rwp
  ON po.product_id = rwp.product_id
JOIN product_categories pc
  ON po.product_id = pc.product_id
JOIN product_reviews pr
  ON po.product_id = pr.product_id;