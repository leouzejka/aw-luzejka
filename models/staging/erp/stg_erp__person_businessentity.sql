with 

source as (

    select * from {{ source('erp', 'person_businessentity') }}

),

renamed as (

    select
         cast(businessentityid as varchar) as business_entity_id
        --rowguid
        --modifieddate

    from source

)

select * from renamed
