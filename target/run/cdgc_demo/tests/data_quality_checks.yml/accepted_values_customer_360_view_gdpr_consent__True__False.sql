
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        gdpr_consent as value_field,
        count(*) as n_records

    from DEV_MARTS_DB.RAW_marts.customer_360_view
    group by gdpr_consent

)

select *
from all_values
where value_field not in (
    'True','False'
)



  
  
      
    ) dbt_internal_test