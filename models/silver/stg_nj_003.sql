select
  coalesce(details, '2024_20C_014_130') as movie_id,
  upper(coalesce(details, '2024_20C_014_130')) as location,
  date(timestamp) as date,
  to_char(timestamp, 'YYYY-MM') as month,  -- ✅ добавили месяц в нужном формате
  total_value as revenue,
  amount as ticket_amount
from {{ source('silverscreen', 'nj_003') }}
where lower(product_type) = 'ticket'
  and details is not null
  and timestamp is not null
