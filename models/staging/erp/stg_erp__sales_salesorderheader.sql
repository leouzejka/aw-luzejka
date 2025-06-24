with 

source as (

    select * from {{ source('erp', 'sales_salesorderheader') }}

),

renamed as (

    select
        cast(salesorderid as varchar) as order_id
        , cast(customerid as varchar) as customer_id        
        , cast(salespersonid as varchar) as sales_person_id
        , cast(territoryid as varchar) as territory_id
        , cast(creditcardid as varchar) as creditcard_id
        , cast(subtotal as decimal(19, 2)) as subtotal
        , cast(taxamt as decimal(19, 2)) as tax_amt
        , cast(freight as decimal(19, 2)) as freight
        , cast(totaldue as decimal(19, 2)) as total_due
        , cast(orderdate as date) as order_date
        , cast(duedate as date) as due_date
        , cast(shipdate as date) as ship_date
        , cast(status as varchar) as status
        , cast(onlineorderflag as varchar) as online_order_flag
        , cast(billtoaddressid as varchar) as bill_to_address_id
        , cast(shiptoaddressid as varchar) as ship_to_address_id
        , cast(shipmethodid as varchar) as ship_method_id
        , cast(modifieddate as date) as modified_date
        --creditcardapprovalcode,
        --currencyrateid
        --purchaseordernumber,
        --accountnumber,
        --revisionnumber,
        --comment,
        --rowguid,

    from source

)

select * from renamed
