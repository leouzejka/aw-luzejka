with 

source as (

    select * from {{ source('erp', 'sales_salesorderdetail') }}

),

renamed as (

    select
        salesorderid
        , salesorderdetailid
        , carriertrackingnumber 
        , orderqty
        , productid
        , specialofferid
        , unitprice
        , unitpricediscount
        , rowguid
        , modifieddat

    from source

)

select * from renamed
