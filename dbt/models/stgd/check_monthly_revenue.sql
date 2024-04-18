-- dbt: check_monthly_revenue
-- description: Calculates the monthly revenue based on the money spent column.
-- tags: [data validation, revenue analysis]
-- source: stgd
{{ config(materialized="table") }}

with
    monthly_revenue as (
        select report_date, sum(money_spent) as monthly_spending
        from {{ source("stgd", "membership_subscriptions") }}
        where contract_length = 'monthly'
        group by report_date
    )

select report_date, monthly_spending
from monthly_revenue

