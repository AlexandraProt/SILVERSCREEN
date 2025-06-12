select
  movie_id,
  upper('NJ_001') as location,
  to_char(timestamp, 'YYYY-MM') as month,
  transaction_total as revenue,          
  ticket_amount
from {{ source('silverscreen', 'nj_001') }}
