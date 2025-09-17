
  create or replace   view DEV_STAGING_DB.RAW_staging.stg_transactions
  
  
  
  
  as (
    

with source_data as (select transaction_id,
                            customer_id,
                            account_id,
                            transaction_date,
                            transaction_type,
                            amount,
                            currency,
                            channel,
                            status,
                            merchant_name,
                            category,
                            created_timestamp,
                            current_timestamp() as dbt_updated_at
                     from DEV_RAW_DB.FINANCE.FINANCIAL_TRANSACTIONS
                     where status = 'Completed')

select *
from source_data
  );

