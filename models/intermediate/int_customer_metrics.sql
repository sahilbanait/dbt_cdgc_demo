{{ config(materialized='table') }}

with customer_transactions as (
    select
        c.customer_id,
        c.customer_segment,
        c.risk_rating,
        count(t.transaction_id) as total_transactions,
        sum(t.amount) as total_transaction_amount,
        avg(t.amount) as avg_transaction_amount,
        min(t.transaction_date) as first_transaction_date,
        max(t.transaction_date) as last_transaction_date
    from {{ ref('stg_customers') }} c
    left join {{ ref('stg_transactions') }} t
        on c.customer_id = t.customer_id
    group by 1, 2, 3
),

customer_accounts as (
    select
        customer_id,
        count(account_id) as total_accounts,
        sum(current_balance) as total_balance,
        avg(current_balance) as avg_balance
    from {{ ref('stg_accounts') }}
    group by 1
)

select
    ct.*,
    ca.total_accounts,
    ca.total_balance,
    ca.avg_balance,
    current_timestamp() as dbt_updated_at
from customer_transactions ct
left join customer_accounts ca
    on ct.customer_id = ca.customer_id