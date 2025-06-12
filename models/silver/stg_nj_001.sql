{{
 config(
 materialized='view'
 )
}}
select
 movie_id,
EXTRACT (MONTH from timestamp) AS month,
'NJ-001' AS location_id,
SUM(ticket_amount) AS total_tickets,
SUM(transaction_total) AS revenue
from {{ source('silverscreen', 'nj_001') }}
group by 1, 2