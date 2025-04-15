{% macro test_is_valid_vin(model,column_name) %}
with  vin_test as
(select {{column_name}} from  {{model}} where {{column_name}} like '%TATA%' )
select count(*) from vin_test
{%  endmacro  %}