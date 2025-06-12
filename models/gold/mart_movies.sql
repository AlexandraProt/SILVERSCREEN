with costs as (
  select
    i.movie_id,
    i.month,
    upper(i.location_id) as location,         -- 🔥 ВАЖНО: привели к нужному формату
    m.movie_title,
    m.studio,
    m.genre,
    sum(i.total_invoice_sum) as rental_costs
  from {{ source("silverscreen", "invoices") }} as i
  join {{ ref('stg_movie_catalogue') }} as m
    on i.movie_id = m.movie_id
  group by 1, 2, 3, 4, 5, 6
),

revenue as (
  select
    movie_id,
    to_char(date, 'YYYY-MM') as month,
    upper(location) as location,
    sum(revenue) as revenue,
    sum(ticket_amount) as tickets_sold
  from (
    select * from {{ ref('stg_nj_001') }}
    union all
    select * from {{ ref('stg_nj_002') }}
    union all
    select * from {{ ref('stg_nj_003') }}
  )
  group by 1, 2, 3
)

select
  c.movie_id,
  c.movie_title,
  c.genre,
  c.studio,
  c.month,
  c.location,
  c.rental_costs,
  r.tickets_sold,
  r.revenue
from costs c
left join revenue r
  on c.movie_id = r.movie_id
  and c.month = r.month
  and c.location = r.location
