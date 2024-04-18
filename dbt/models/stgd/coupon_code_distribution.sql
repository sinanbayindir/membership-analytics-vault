-- dbt: coupon_code_distribution
-- description: Calculates the distribution of users by used coupon codes for creating
-- a pie chart.
-- tags: [data analysis, pie chart]
-- source: stgd
{{ config(materialized="table") }}
select used_coupon_code, count(*) as count
from {{ source("stgd", "membership_subscriptions") }}
group by used_coupon_code
