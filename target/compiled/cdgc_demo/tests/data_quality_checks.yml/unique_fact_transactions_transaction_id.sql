
    
    

select
    transaction_id as unique_field,
    count(*) as n_records

from DEV_MARTS_DB.RAW_marts.fact_transactions
where transaction_id is not null
group by transaction_id
having count(*) > 1


