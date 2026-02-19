{{config(severity = 'warn')}}

WITH order_details AS (
    SELECT
        order_id,
        COUNT(*) AS num_of_items_in_order
    FROM {{ref('stg_ecommerce__order_items')}}
    GROUP BY 1
)

SELECT
    o.order_id,
    od.num_of_items_in_order,
    o.num_of_items_ordered
FROM {{ref('stg_ecommerce__orders')}} o
FULL OUTER JOIN order_details od
    USING (order_id)
WHERE o.order_id IS NULL
OR od.order_id IS NULL
OR od.num_of_items_in_order != o.num_of_items_ordered
