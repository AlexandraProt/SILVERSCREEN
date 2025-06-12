select
  movie_id,
  upper('NJ_002') as location,
  extract(month from date) as month,
  total_earned as revenue,              
  ticket_amount as ticket_amount        
from {{ source('silverscreen', 'nj_002') }}
