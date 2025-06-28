with 
    products as (
        select *
        from {{ ref('stg_erp__production_product') }}
    )
select * from products 