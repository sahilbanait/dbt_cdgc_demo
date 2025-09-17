
  
    

create or replace transient table DEV_PRESENTATION_DB.RAW_intermediate.int_risk_assessment
    
    
    
    as (

with risk_factors as (
    select
        customer_id,
        case
            when total_transaction_amount > 100000 then 'High Volume'
            when total_transaction_amount > 50000 then 'Medium Volume'
            else 'Low Volume'
        end as transaction_volume_risk,
        case
            when avg_transaction_amount > 5000 then 'High Value'
            when avg_transaction_amount > 1000 then 'Medium Value'
            else 'Low Value'
        end as transaction_value_risk,
        case
            when total_balance > 50000 then 'High Balance'
            when total_balance > 10000 then 'Medium Balance'
            else 'Low Balance'
        end as balance_risk
    from DEV_PRESENTATION_DB.RAW_intermediate.int_customer_metrics
)

select
    *,
    case
        when transaction_volume_risk = 'High Volume'
             and transaction_value_risk = 'High Value'
             and balance_risk = 'High Balance' then 'Critical'
        when transaction_volume_risk in ('High Volume', 'Medium Volume')
             or transaction_value_risk in ('High Value', 'Medium Value') then 'Elevated'
        else 'Standard'
    end as composite_risk_score,
    current_timestamp() as dbt_updated_at
from risk_factors
    )
;


  