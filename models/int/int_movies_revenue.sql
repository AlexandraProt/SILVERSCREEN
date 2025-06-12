WITH transactions AS (
  SELECT
    movie_id,
    location,
    month,
    revenue,
    ticket_amount
  FROM {{ ref('stg_nj_001') }}

  UNION ALL

  SELECT
    movie_id,
    location,
    month,
    revenue,
    ticket_amount
  FROM {{ ref('stg_nj_002') }}

  UNION ALL

  SELECT
    movie_id,
    location,
    month,
    revenue,
    ticket_amount
  FROM {{ ref('stg_nj_003') }}
)

SELECT
  movie_id,
  location,
  month,
  SUM(revenue) AS revenue,
  SUM(ticket_amount) AS tickets_sold
FROM transactions
GROUP BY 1, 2, 3
