with 

source as (

    select * from {{ source('erp', 'sales_salesterritory') }}

),

renamed as (

    select
         cast(territoryid as varchar) as territory_id
        , cast(name as varchar) as name
        , cast(countryregioncode as varchar) as country_region_code
        , cast(salesytd as decimal(19, 2)) as sales_ytd 
        , cast(saleslastyear as decimal(19, 2)) as sales_last_year
        , cast(modifieddate as date) as modified_date 
        --group 
        --costytd
        --costlastyear
        --rowguid
        
    from source

)

select * from renamed
