select
  to_char(i.month, 'YYYY-MM') as month,      
  upper(i.location_id) as location, 
  m.movie_id,
  movie_title,
  m.studio,
  genre,
  sum(i.total_invoice_sum) as rental_costs
from {{ source("silverscreen", "invoices") }} as i
join {{ ref('stg_movie_catalogue') }} as m
  on i.movie_id = m.movie_id
group by 1, 2, 3, 4, 5, 6
order by 1 desc
