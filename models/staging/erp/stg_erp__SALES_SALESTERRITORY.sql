with 

source as (

    select * from {{ source('erp', 'SALES_SALESTERRITORY') }}

),

renamed as (

    select
        territoryid,
        name,
        countryregioncode,
        group,
        salesytd,
        saleslastyear,
        costytd,
        costlastyear,
        rowguid,
        modifieddate

    from source

)

select * from renamed
