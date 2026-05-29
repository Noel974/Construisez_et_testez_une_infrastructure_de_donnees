with raw as (
    select
        jsonb_array_elements(stations) as station
    from {{ source('raw', 'meteologie') }}
)

select
    station->>'id' as id,
    station->>'name' as name,
    (station->>'latitude')::float as latitude,
    (station->>'longitude')::float as longitude,
    (station->>'elevation')::int as elevation,
    station->>'type' as station_type,
    station->'license'->>'license' as license_type,
    station->'license'->>'url' as license_url,
    station->'license'->>'source' as license_source,
    station->'license'->>'metadonnees' as license_metadata
from raw
 