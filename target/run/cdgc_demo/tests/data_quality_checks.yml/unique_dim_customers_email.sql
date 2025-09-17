
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    email as unique_field,
    count(*) as n_records

from DEV_MARTS_DB.RAW_marts.dim_customers
where email is not null
group by email
having count(*) > 1



  
  
      
    ) dbt_internal_test