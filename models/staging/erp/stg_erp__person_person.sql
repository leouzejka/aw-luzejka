with 

source as (

    select * from {{ source('erp', 'person_person') }}

),

renamed as (

    select
          cast(businessentityid as varchar) as business_entity_id
        , cast(firstname as varchar) as first_name
        , cast(middlename as varchar) as middle_name
        , cast(lastname as varchar) as last_name
        , cast(modifieddate as date) as modified_date
        --persontype
        --namestyle
        --title
        --suffix
        --emailpromotion
        --additionalcontactinfo
        --demographics
        --rowguid
        

    from source

)

select * from renamed
