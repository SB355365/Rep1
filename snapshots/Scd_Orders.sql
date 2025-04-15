{% snapshot snap %}
{{
    config(
     unique_key='ORDER_NO'  ,
     strategy='timestamp',
     updated_at='ORDER_DATE',
     target_schema='SNAPSHOTS',
     invalidate_hard_deletes=true,
      snapshot_meta_column_names=
     {
      "DBT_VALID_FROM" : "EFF_DATE",
      "DBT_VALID_TO" : "EXPIRY_DATE",
      "DBT_UPDATED_AT" : "MODIFIED_DATE"
     }
    )
    

    
   
}}
SELECT * FROM {{ref('ORDERS_DELTA')}}
{% endsnapshot %}  


