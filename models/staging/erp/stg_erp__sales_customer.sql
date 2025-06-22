with 

source as (

    select * from {{ source('erp', 'sales_customer') }}

),

renamed as (

    select
          cast(customerid as varchar) as customer_id 
        , cast(storeid as varchar) as store_id 
        , cast(territoryid as varchar) as territory_id
        --personid
        --rowguid
        --modifieddat 

    from source

)

select * from renamed
