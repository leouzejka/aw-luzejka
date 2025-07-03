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
    
    state_province as (
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

    region_code as (
        select 
              country_region_code
            , name_country_region
        from {{ ref('stg_erp__person_countryregion') }}
    ), 
    
    joined as (

        select 
          person.business_entity_id
        , customers.person_id
        , customers.customer_id
        , customers.territory_id
        , person.first_name || ' ' || person.last_name as complete_name    
        , territory.territory_name
        , person_address.city
        , state_province.state_province_name
        , region_code.name_country_region as country
        
      
        
        
        from customers
        left join person on customers.person_id = person.business_entity_id
        left join person_businessentity_address on person.business_entity_id = person_businessentity_address.business_entity_id
        join person_address on person_businessentity_address.address_id = person_address.address_id
        join state_province on person_address.state_province_id = state_province.state_province_id
        join territory on state_province.territory_id = territory.territory_id
        join region_code on territory.country_region_code = region_code.country_region_code
    )

    select * from joined
