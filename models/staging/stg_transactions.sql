{{ config(materialized='view') }}

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
                     from {{ source('finance', 'FINANCIAL_TRANSACTIONS') }}
                     where status = 'Completed')

select *
from source_data