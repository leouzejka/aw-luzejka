with 

source as (

    select * from {{ source('erp', 'person_businessentityaddress') }}

),

renamed as (

    select
        businessentityid,
        addressid,
        addresstypeid,
        rowguid,
        modifieddate

    from source

)

select * from renamed
