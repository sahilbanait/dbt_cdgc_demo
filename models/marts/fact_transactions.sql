{{ config(materialized='table') }}

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
from {{ ref('stg_transactions') }} t
left join {{ ref('dim_customers') }} c
    on t.customer_id = c.customer_id
left join {{ ref('stg_accounts') }} a
    on t.account_id = a.account_id
left join {{ ref('int_risk_assessment') }} r
    on t.customer_id = r.customer_id