with 

source as (

    select * from {{ source('erp', 'person_address') }}

),

renamed as (

    select
          cast(addressid as varchar) as address_id
        , cast(city as varchar) as city
        , cast(stateprovinceid as varchar) as state_province_id 
        , cast(postalcode as varchar) as postal_code 
        , cast(modifieddate as date) as modified_date
        --addressline1 
        --addressline2  
        --spatiallocation
        --rowguid
    from source

)

select * from renamed
