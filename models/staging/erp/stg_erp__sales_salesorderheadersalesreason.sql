with 

source as (

    select * from {{ source('erp', 'sales_salesorderheadersalesreason') }}

),

renamed as (

    select
          cast(salesorderid as varchar) as sales_order_id
        , cast(salesreasonid as varchar) as sales_reason_id
        --modifieddate

    from source

)

select * from renamed
