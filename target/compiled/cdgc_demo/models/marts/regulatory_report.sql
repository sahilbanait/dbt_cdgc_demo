

-- GDPR Compliance Report
select
    'GDPR_CUSTOMER_COUNT' as metric_name,
    count(*) as metric_value,
    'Total customers with GDPR consent' as description,
    current_date() as report_date
from DEV_MARTS_DB.RAW_marts.dim_customers
where gdpr_consent = true

union all

select
    'HIGH_RISK_CUSTOMERS' as metric_name,
    count(*) as metric_value,
    'Customers with high risk rating' as description,
    current_date() as report_date
from DEV_MARTS_DB.RAW_marts.dim_customers
where calculated_risk_score = 'Critical'

union all

select
    'HIGH_VALUE_TRANSACTIONS' as metric_name,
    count(*) as metric_value,
    'Transactions above $10,000' as description,
    current_date() as report_date
from DEV_MARTS_DB.RAW_marts.fact_transactions
where amount > 10000

union all

select
    'TOTAL_TRANSACTION_VOLUME' as metric_name,
    sum(amount) as metric_value,
    'Total transaction volume for regulatory reporting' as description,
    current_date() as report_date
from DEV_MARTS_DB.RAW_marts.fact_transactions
where transaction_date >= dateadd(month, -1, current_date())