with 

source as (

    select * from {{ source('erp', 'sales_salesterritory') }}

),

renamed as (

    select
        territoryid,
        name,
        countryregioncode,
        --group,
        salesytd,
        saleslastyear,
        costytd,
        costlastyear,
        rowguid,
        modifieddate

    from source

)

select * from renamed
