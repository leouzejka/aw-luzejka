with 

source as (

    select * from {{ source('erp', 'sales_salesreason') }}

),

renamed as (

    select
        cast(salesreasonid as varchar) as sales_reason_id
        , cast(name as varchar) as name
        , cast(reasontype as varchar) as reason_type
        --modifieddate

    from source
    

)

select * from renamed
