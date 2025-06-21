with 

source as (

    select * from {{ source('erp', 'person_countryregion') }}

),

renamed as (

    select
        countryregioncode,
        name,
        modifieddate

    from source

)

select * from renamed
