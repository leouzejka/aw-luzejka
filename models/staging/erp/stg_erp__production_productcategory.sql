with 

source as (

    select * from {{ source('erp', 'production_productcategory') }}

),

renamed as (

    select
          cast(productcategoryid as int) as product_category_id
        , cast(name as varchar) as name
        --rowguid
        --modifieddate

    from source

)

select * from renamed
