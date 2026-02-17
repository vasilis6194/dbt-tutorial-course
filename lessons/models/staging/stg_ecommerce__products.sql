WITH source AS (
        SELECT *

        FROM {{ source('thelook_ecommerce', 'products') }}
)

SELECT
        id AS product_id,
        cost,
        brand,
        retail_price,
        department


FROM source