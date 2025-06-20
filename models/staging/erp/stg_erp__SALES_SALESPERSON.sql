with 

source as (

    select * from {{ source('erp', 'SALES_SALESPERSON') }}

),

renamed as (

    select
        businessentityid,
        territoryid,
        salesquota,
        bonus,
        commissionpct,
        salesytd,
        saleslastyear,
        rowguid,
        modifieddate

    from source

)

select * from renamed
