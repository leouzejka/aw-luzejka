with 
    order_details as (
       select *
       from  {{ ref('stg_erp__sales_salesorderdetail') }}
    ),
    
    orders as (
        select *
        from {{ ref('stg_erp__sales_salesorderheader') }}
    ),
    
    reason as (
        select *
        from {{ ref('stg_erp__sales_salesorderheadersalesreason') }}
    ),
    
    joined as (
        select 
              order_details.order_id
            , order_details.product_id
            , orders.customer_id
            , orders.person_id
            , reason.sales_reason_id
            , orders.creditcard_id
            , order_details.order_quantity
            , order_details.unit_price
            , order_details.discount
            , orders.order_date
	        , orders.due_date
	        , orders.ship_date
	        , orders.subtotal
	        , orders.tax_amt
	        , orders.freight
	        , orders.total_due

        from order_details
        left join orders on order_details.order_id = orders.order_id
        left join reason on reason.sales_order_id = orders.order_id

    )
--tem que fazer as métricas ainda

    select * from joined

