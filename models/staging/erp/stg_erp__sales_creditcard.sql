with 

source as (

    select * from {{ source('erp', 'sales_creditcard') }}

),

renamed as (

    select
        cast(creditcardid as varchar) as creditcard_id
        , cast(cardtype as varchar) as card_type
        --cardnumber
        --expmonth
        --expyear 
        --modifieddate

    from source

)

select * from renamed
