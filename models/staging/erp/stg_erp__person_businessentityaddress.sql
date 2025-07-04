with 

source as (

    select * from {{ source('erp', 'person_businessentityaddress') }}

),

renamed as (

    select
          cast(businessentityid as varchar) as business_entity_id
        , cast(addressid as varchar) as address_id 
        , cast(modifieddate as date) as modified_date 
        , cast(addresstypeid as varchar) as address_type_id
        --rowguid
        
    from source

)

select * from renamed
