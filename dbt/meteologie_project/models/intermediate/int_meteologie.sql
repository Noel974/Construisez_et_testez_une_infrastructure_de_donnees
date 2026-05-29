select
    id,
    name,
    latitude,
    longitude,
    elevation,
    station_type,
    license_type,
    license_url,
    license_source,
    license_metadata
from {{ ref('stg_meteologie') }}
