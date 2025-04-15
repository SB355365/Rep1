{{
   config
   (materialized='incremental',
    incremental_strategy='merge',
    unique_key='ORDER_NO')

}}




--select * from {{ref('Stg_Orders')}}
{% if is_incremental() %}
where ORDER_DATE> (SELECT MAX(COALESCE(ORDER_DATE,CURRENT_DATE()-8))  FROM {{this}})
{% endif %}