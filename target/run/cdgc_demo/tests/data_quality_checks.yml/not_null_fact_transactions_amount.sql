
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select amount
from DEV_MARTS_DB.RAW_marts.fact_transactions
where amount is null



  
  
      
    ) dbt_internal_test