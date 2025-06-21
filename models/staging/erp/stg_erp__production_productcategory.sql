with 

source as (

    select * from {{ source('erp', 'production_productcategory') }}

),

renamed as (

    select
        productcategoryid,
        name,
        rowguid,
        modifieddate

    from source

)

select * from renamed
