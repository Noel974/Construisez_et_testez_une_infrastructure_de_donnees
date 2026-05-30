with airbyte as (

    select
        id as station_id,
        name as station_name,
        latitude,
        longitude,
        elevation,

        -- Colonnes manquantes dans Airbyte → on met des valeurs par défaut
        null as city,
        'France' as country,  -- Toutes les stations Infoclimat sont en France
        null as hardware,
        null as software

    from {{ ref('int_meteologie') }}

),

belgique as (

    select
        weather_station_id as station_id,
        station_name,
        latitude,
        longitude,
        elevation_meters as elevation,
        city,
        country,
        hardware,
        software
    from {{ ref('stg_stations_belgique') }}

),

france as (

    select
        weather_station_id as station_id,
        station_name,
        latitude,
        longitude,
        elevation_meters as elevation,
        city,
        country,
        hardware,
        software
    from {{ ref('stg_stations_france') }}

)

select * from airbyte
union all
select * from belgique
union all
select * from france
