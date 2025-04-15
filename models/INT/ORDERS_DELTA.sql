{{
   config
   (materialized='incremental',
    incremental_strategy='merge',
    unique_key='ORDER_NO')

}}





{% if is_incremental() %}
where ORDER_DATE> (SELECT MAX(COALESCE(ORDER_DATE,CURRENT_DATE()-8))  FROM {{this}})
{% endif %}