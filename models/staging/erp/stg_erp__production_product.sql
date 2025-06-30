with 

source as (

    select * from {{ source('erp', 'production_product') }}

),

renamed as (

    select
          cast(productid as varchar) as product_id
        , cast(name as varchar) as product_name
        , cast(productnumber as varchar) as product_number
        , cast(productsubcategoryid as varchar) as product_sub_category
        , cast(productmodelid as varchar) as product_model_id
        , cast(discontinueddate as date) as discontinued_date
        --safetystocklevel
        --reorderpoint
        --makeflag
        --finishedgoodsflag
        --color
        --standardcost
        --listprice
        --size
        --sizeunitmeasurecode
        --weightunitmeasurecode
        --weight
        --daystomanufacture
        --productline
        --class
        --style
        --sellstartdate
        --sellenddate
        --rowguid
        --modifieddate

    from source

)

select * from renamed
