
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    transaction_id as unique_field,
    count(*) as n_records

from DEV_MARTS_DB.RAW_marts.fact_transactions
where transaction_id is not null
group by transaction_id
having count(*) > 1



  
  
      
    ) dbt_internal_test