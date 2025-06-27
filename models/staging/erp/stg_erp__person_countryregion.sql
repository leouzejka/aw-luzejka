with 

source as (

    select * from {{ source('erp', 'person_countryregion') }}

),

renamed as (

    select
        cast(countryregioncode as varchar) as country_region_code
        , cast(name as varchar) as name_country_region
        --modifieddate

    from source

)

select * from renamed
