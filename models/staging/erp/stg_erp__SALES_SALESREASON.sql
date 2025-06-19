with 

source as (

    select * from {{ source('erp', 'SALES_SALESREASON') }}

),

renamed as (

    select
        salesreasonid,
        name,
        reasontype,
        modifieddate

    from source

)

select * from renamed
