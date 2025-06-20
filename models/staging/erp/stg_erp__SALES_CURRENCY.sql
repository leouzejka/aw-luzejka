with 

source as (

    select * from {{ source('erp', 'SALES_CURRENCY') }}

),

renamed as (

    select
        currencycode,
        name,
        modifieddate

    from source

)

select * from renamed
