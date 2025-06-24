with 

source as (

    select * from {{ source('erp', 'sales_salesterritory') }}

),

renamed as (

    select
        cast(territoryid as varchar) as territory_id
        , cast(name as varchar) as territory_name
        , cast(countryregioncode as varchar) as country_region_code
        , cast("group" as varchar) as continent
        , cast(salesytd as varchar) as sales_ytd
        , cast(saleslastyear as varchar) as sales_last_year
        , cast(costytd as varchar) as cost_ytd
        , cast(costlastyear as varchar) as cost_last_year
        --rowguid
        --modifieddate 

    from source

)

select * from renamed
