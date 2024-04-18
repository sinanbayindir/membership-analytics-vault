-- dbt: check_monthly_revenue
-- description: Calculates the monthly revenue based on the money spent column.
-- tags: [data validation, revenue analysis]
-- source: stgd
{{ config(materialized="table") }}

with
    monthly_revenue as (
        select
            count(distinct user_id) as total_users,
            sum(money_spent) as total_money_spent,
            avg(money_spent) as average_money_spent,
            avg(days_active) as average_days_active,
            avg(invites_sent) as average_invites_sent
        from {{ source("stgd", "membership_subscriptions") }}
        where cancelled = 'no'
    )

select *
from monthly_revenue
