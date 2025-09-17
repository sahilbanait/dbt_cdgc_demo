{% macro test_email_format(model, column_name) %}
  select *
  from {{ model }}
  where {{ column_name }} not like '%@%.%'
{% endmacro %}

{% macro calculate_data_freshness(model, date_column, max_days_old=7) %}
  select *
  from {{ model }}
  where datediff(day, {{ date_column }}, current_timestamp()) > {{ max_days_old }}
{% endmacro %}