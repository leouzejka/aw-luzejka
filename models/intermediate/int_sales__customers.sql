with
    customers as (
        select 
            customer_id
            , store_id
            , territory_id
            , person_id
        from {{ ref('stg_erp__sales_customer') }}
    ),
        
    person as (
        select 
            business_entity_id
            , first_name
            , last_name
        from {{ ref('stg_erp__person_person') }}
    ), 

    person_address as (
        select 
              address_id
            , city
            , state_province_id 
        from {{ ref('stg_erp__person_address') }}
    ), 

    person_businessentity_address as (
        select 
              business_entity_id
            , address_id
        from {{ ref('stg_erp__person_businessentityaddress') }}
    ),
    
    stateprovince as (
        select
           state_province_id
         , state_province_name
         , state_province_code
         , territory_id
        from {{ ref('stg_erp__person_stateprovince') }}
    ),
      territory as (

        select 
            territory_id
            , territory_name
            , country_region_code
            , continent
        from {{ ref('stg_erp__sales_salesterritory') }}
      ),
    
    joined as (

        select 
          person.business_entity_id
        , person.first_name || ' ' || person.last_name as complete_name
        , customers.customer_id
        , customers.territory_id
        , person_address.city
        , stateprovince.state_province_name
        , territory.territory_name
      
        
        
        from customers
        inner join person on customers.person_id = person.business_entity_id
        inner join person_businessentity_address on person.business_entity_id = person_businessentity_address.business_entity_id
        inner join person_address on person_businessentity_address.address_id = person_address.address_id
        inner join stateprovince on person_address.state_province_id = stateprovince.state_province_id
        inner join territory on stateprovince.territory_id = territory.territory_id
    )

    select * from joined
