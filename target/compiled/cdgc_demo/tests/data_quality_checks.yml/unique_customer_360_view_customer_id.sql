
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from DEV_MARTS_DB.RAW_marts.customer_360_view
where customer_id is not null
group by customer_id
having count(*) > 1


