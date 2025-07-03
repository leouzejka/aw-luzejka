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

    products as (
        select * 
        from {{ ref('stg_erp__production_product') }}

    ),
   
    joined as (
        select 
        --IDs
              order_details.order_id
            , order_details.product_id
            , orders.customer_id
            , orders.person_id
            , reason.sales_reason_id
            , orders.creditcard_id
        --quantiti and price
            , order_details.order_quantity
            , order_details.unit_price
            , order_details.discount
        --Dates
            , orders.order_date
	        , orders.due_date
	        , orders.ship_date
	    --financial
            , orders.subtotal
	        , orders.tax_amt
	        , orders.freight
	        , orders.total_due
        -- aditional metrics
, cast((order_details.order_quantity * order_details.unit_price) as decimal(19, 2)) as line_gross_revenue  -- Receita bruta por linha
, cast((order_details.order_quantity * order_details.unit_price * order_details.discount) as decimal(19, 2)) as line_discount_amount -- Valor do desconto por linha
, cast((order_details.order_quantity * order_details.unit_price * (1 - order_details.discount) as decimal(19, 2))) as line_net_revenue     -- Receita líquida por linha
, cast((order_details.order_quantity * order_details.unit_price * (1 - order_details.discount)) - (products.standard_cost * order_details.order_quantity) as decimal(19, 2)) as line_gross_profit    -- Lucro bruto por linha
        
        from order_details
        left join orders on order_details.order_id = orders.order_id
        left join reason on reason.sales_order_id = orders.order_id
        left join products on order_details.product_id = products.product_id
    )

    select * from joined

