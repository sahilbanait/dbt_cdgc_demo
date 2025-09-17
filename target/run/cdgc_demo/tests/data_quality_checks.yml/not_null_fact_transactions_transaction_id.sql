
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select transaction_id
from DEV_MARTS_DB.RAW_marts.fact_transactions
where transaction_id is null



  
  
      
    ) dbt_internal_test