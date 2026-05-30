with source as (

    select
        -- Identifiant fixe de la station (ELT : créé dans dbt, pas dans Excel)
        'IICHTE19' as weather_station_id,

        -- Métadonnées fixes de la station
        'WeerstationBS' as station_name,
        51.092 as latitude,
        2.999 as longitude,
        15 as elevation_meters,
        'Ichtegem' as city,
        'Belgique' as country,
        'other' as hardware,
        'EasyWeatherV1.6.6' as software,

        -- Données issues du fichier Excel
"Time" as time,
"Temperature" as temperature,
"Dew_Point" as dew_point,
"Humidity" as humidity,
"Wind" as wind,
"Speed" as speed,
"Gust" as gust,
"Pressure" as pressure,
"Precip__Rate_" as precip_rate,
"Precip__Accum_" as precip_accum,
"UV" as uv,
"Solar" as solar

from {{ source('raw', 'belgique') }}

),

cleaned as (

    select
        weather_station_id,
        station_name,
        latitude,
        longitude,
        elevation_meters,
        city,
        country,
        hardware,
        software,

        -- Conversion du temps en timestamp
        to_timestamp(time, 'HH24:MI:SS') as measurement_time,

        -- Conversion des unités
        (regexp_replace(temperature, ' °F', '', 'g')::float - 32) * 5/9 as temperature_c,
        (regexp_replace(dew_point, ' °F', '', 'g')::float - 32) * 5/9 as dew_point_c,
        regexp_replace(humidity, ' %', '', 'g')::float as humidity_pct,
        regexp_replace(pressure, ' in', '', 'g')::float * 33.8639 as pressure_hpa,
        regexp_replace(speed, ' mph', '', 'g')::float * 1.60934 as wind_speed_kmh,
        regexp_replace(gust, ' mph', '', 'g')::float * 1.60934 as wind_gust_kmh,
        regexp_replace(precip_rate, ' in', '', 'g')::float * 25.4 as precip_rate_mm,
        regexp_replace(precip_accum, ' in', '', 'g')::float * 25.4 as precip_accum_mm,

        wind,
        uv,
        solar

    from source
)

select *
from cleaned
