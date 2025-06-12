{{
 config(
 materialized='view'
 )
}}
select
 details AS movie_id,
EXTRACT(month from timestamp) AS month,
'NJ_003' AS location_id,
SUM(amount) AS total_tickets,
SUM(total_value) AS revenue
from {{ source('silverscreen', 'nj_003') }}
where product_type = 'ticket'
group by 1, 2