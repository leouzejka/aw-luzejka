with 

source as (

    select * from {{ source('erp', 'SALES_PERSONCREDITCARD') }}

),

renamed as (

    select
        businessentityid,
        creditcardid,
        modifieddate

    from source

)

select * from renamed
