{{ config(materialized='view') }}

with source_data as (
    select
        customer_id,
        first_name,
        last_name,
        email,
        phone,
        date_of_birth,
        address,
        city,
        state,
        zip_code,
        customer_segment,
        acquisition_date,
        risk_rating,
        gdpr_consent,
        created_date,
        last_modified_date,
        current_timestamp() as dbt_updated_at
    from {{ source('customer', 'CUSTOMERS_MASTER') }}
)

select * from source_data