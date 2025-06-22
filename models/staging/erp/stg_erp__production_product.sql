with 

source as (

    select * from {{ source('erp', 'production_product') }}

),

renamed as (

    select
          cast(productid as varchar) as product_id
        , cast(name as varchar) as name
        , cast(productnumber as varchar) as product_number
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
        --productsubcategoryid
        --productmodelid
        --sellstartdate
        --sellenddate
        --discontinueddate
        --rowguid
        --modifieddate
,
    from source

)

select * from renamed
