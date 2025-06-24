with 

source as (

    select * from {{ source('erp', 'person_stateprovince') }}

),

renamed as (

    select
        cast(stateprovinceid as varchar) as state_province_id
        , cast(territoryid as varchar) as territory_id
        , cast(stateprovincecode as varchar) as state_province_code
        , cast(countryregioncode as varchar) as country_region_code
        , cast(name as varchar) as state_province_name
        --modifieddate
        --rowguid
        --isonlystateprovinceflag
    from source

)

select * from renamed
