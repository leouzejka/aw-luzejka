with 

source as (

    select * from {{ source('erp', 'sales_salesreason') }}

),

renamed as (

    select
        cast(salesreasonid as varchar) as sales_person_id
        , cast(name as varchar) as name
        --reasontype
        --modifieddate

    from source

)

select * from renamed
