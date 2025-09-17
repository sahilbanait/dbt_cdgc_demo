

with source_data as (
    select
        account_id,
        customer_id,
        account_type,
        account_status,
        opening_date,
        current_balance,
        credit_limit,
        interest_rate,
        last_activity_date,
        current_timestamp() as dbt_updated_at
    from DEV_RAW_DB.FINANCE.ACCOUNT_INFORMATION
    where account_status = 'Active'
)

select * from source_data