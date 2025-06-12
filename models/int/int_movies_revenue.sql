WITH transactions AS (
    SELECT * FROM {{ ref('stg_nj_001') }}
    UNION ALL
    SELECT * FROM {{ ref('stg_nj_002') }}
    UNION ALL
    SELECT * FROM {{ ref('stg_nj_003') }}
)

SELECT
    movie_id,
    location,
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(MONTH FROM date) AS month,
    SUM(revenue) AS revenue,
    SUM(ticket_amount) AS tickets_sold
FROM transactions
GROUP BY 1, 2, 3, 4
