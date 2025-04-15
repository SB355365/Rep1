
select * exclude ORDER_STATUS,upper(ORDER_STATUS)as ORDER_STATUS from {{source('s1','orders') }}


