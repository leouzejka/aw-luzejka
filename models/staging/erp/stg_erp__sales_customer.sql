with 

source as (

    select * from {{ source('erp', 'sales_customer') }}

),

renamed as (

    select
          cast(customerid as varchar) as customer_id 
        , cast(storeid as varchar) as store_id 
        , cast(territoryid as varchar) as territory_id
        , cast(personid as varchar) as person_id
        --rowguid
        --modifieddat 

    from source

)

select * from renamed
