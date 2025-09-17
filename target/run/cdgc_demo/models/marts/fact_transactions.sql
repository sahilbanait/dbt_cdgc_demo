
  
    

create or replace transient table DEV_MARTS_DB.RAW_marts.fact_transactions
    
    
    
    as (

select
    t.transaction_id,
    t.customer_id,
    t.account_id,
    t.transaction_date,
    t.transaction_type,
    t.amount,
    t.currency,
    t.channel,
    t.merchant_name,
    t.category,
    c.customer_segment,
    a.account_type,
    r.composite_risk_score,
    current_timestamp() as dbt_updated_at
from DEV_STAGING_DB.RAW_staging.stg_transactions t
left join DEV_MARTS_DB.RAW_marts.dim_customers c
    on t.customer_id = c.customer_id
left join DEV_STAGING_DB.RAW_staging.stg_accounts a
    on t.account_id = a.account_id
left join DEV_PRESENTATION_DB.RAW_intermediate.int_risk_assessment r
    on t.customer_id = r.customer_id
    )
;


  