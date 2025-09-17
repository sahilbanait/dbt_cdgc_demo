{{ config(materialized='table') }}

select
    c.customer_id,
    c.first_name || ' ' || c.last_name as full_name,
    c.email,
    c.city,
    c.state,
    c.customer_segment,
    c.original_risk_rating,
    c.calculated_risk_score,
    c.total_transactions,
    c.total_transaction_amount,
    c.total_accounts,
    c.total_balance,
    c.gdpr_consent,
    -- Transaction patterns
    t_summary.recent_transaction_date,
    t_summary.preferred_channel,
    t_summary.top_category,
    -- Account summary
    a_summary.primary_account_type,
    a_summary.account_opening_date,
    current_timestamp() as dbt_updated_at
from {{ ref('dim_customers') }} c
left join (
    select
        customer_id,
        max(transaction_date) as recent_transaction_date,
        mode(channel) as preferred_channel,
        mode(category) as top_category
    from {{ ref('fact_transactions') }}
    group by 1
) t_summary on c.customer_id = t_summary.customer_id
left join (
    select
        customer_id,
        mode(account_type) as primary_account_type,
        min(opening_date) as account_opening_date
    from {{ ref('stg_accounts') }}
    group by 1
) a_summary on c.customer_id = a_summary.customer_id