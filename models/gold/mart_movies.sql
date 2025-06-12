select
    i.month,
    i.location_id,
    i.movie_id,
    m.movie_title,
    m.studio,
    m.genre,
    sum(i.total_invoice_sum) as rental_costs

from {{ source("silverscreen", "invoices") }} as i
join {{ ref('stg_movie_catalogue') }} as m
    on i.movie_id = m.movie_id

group by
    i.month,
    i.location_id,
    i.movie_id,
    m.movie_title,
    m.studio,
    m.genre

order by i.month desc
