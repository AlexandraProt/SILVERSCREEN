{{
 config(
 materialized='view'
 )
}}
select
 movie_id,
EXTRACT(MONTH FROM date) AS month,
'NJ_002' AS location,
SUM(ticket_amount) AS total_tickets,
SUM(total_earned) AS revenue
from {{ source('silverscreen', 'nj_002') }}
group by 1,2