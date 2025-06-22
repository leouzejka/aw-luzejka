with 

source as (

    select * from {{ source('erp', 'sales_creditcard') }}

),

renamed as (

    select
        cast(creditcardid as varchar) as creditcard_id
        , cast(cardtype as varchar) as card_type
        , cast(cardnumber as varchar) as card_number
        , cast(expmonth as varchar) as exp_month
        , cast(expyear as varchar) as exp_year 
        --modifieddate

    from source

)

select * from renamed
