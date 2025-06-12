select
  movie_id,
  upper('NJ_002') as location,
  to_char(date, 'YYYY-MM') as month, 
  total_earned as revenue,                
  ticket_amount                           
from {{ source('silverscreen', 'nj_002') }}
