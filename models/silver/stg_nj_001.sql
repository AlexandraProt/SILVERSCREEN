select
  movie_id,
  upper('NJ_001') as location,
  extract(month from timestamp) as month,
  transaction_total as revenue,
  ticket_amount as ticket_amount
from {{ source('silverscreen', 'nj_001') }}

