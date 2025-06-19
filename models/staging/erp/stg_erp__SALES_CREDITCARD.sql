with 

source as (

    select * from {{ source('erp', 'SALES_CREDITCARD') }}

),

renamed as (

    select
        creditcardid,
        cardtype,
        cardnumber,
        expmonth,
        expyear,
        modifieddate

    from source

)

select * from renamed
