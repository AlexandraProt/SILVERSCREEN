select
  movie_id,
  lower(trim(movie_title)) as movie_title,
  studio,
  genre
from {{ source('silverscreen', 'movie_catalogue') }}
