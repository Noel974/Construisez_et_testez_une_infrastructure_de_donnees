select distinct
    station_id,
    station_name,
    latitude,
    longitude,
    elevation,
    city,
    country,
    hardware,
    software
from {{ ref('int_stations_all') }}
