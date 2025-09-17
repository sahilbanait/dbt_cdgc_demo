{{ config(materialized='table') }}

select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.city,
    c.state,
    c.customer_segment,
    c.acquisition_date,
    c.risk_rating as original_risk_rating,
    r.composite_risk_score as calculated_risk_score,
    m.total_transactions,
    m.total_transaction_amount,
    m.total_accounts,
    m.total_balance,
    c.gdpr_consent,
    current_timestamp() as dbt_updated_at
from {{ ref('stg_customers') }} c
left join {{ ref('int_customer_metrics') }} m
    on c.customer_id = m.customer_id
left join {{ ref('int_risk_assessment') }} r
    on c.customer_id = r.customer_id