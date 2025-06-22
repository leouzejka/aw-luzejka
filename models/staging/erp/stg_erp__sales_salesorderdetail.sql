with 

source as (

    select * from {{ source('erp', 'sales_salesorderdetail') }}

),

renamed as (

    select
          cast(salesorderid as varchar) as order_id 
        , cast(orderqty as int) as order_quantity
        , cast(productid as varchar) as product_id 
        , cast(unitprice as decimal(19, 2)) as unit_price 
        , cast(unitpricediscount as decimal(4, 2)) as discount 
        , cast(modifieddate as date) as modified_date
        --specialofferid
        --rowguid
        --salesorderdetailid 
        --carriertrackingnumber

    from source

)

select * from renamed
