-- dbt: occupation_distribution
-- description: Calculates the distribution of users by occupation for creating a pie
-- chart.
-- tags: [data analysis, pie chart]
-- source: stgd
{{ config(materialized="table") }}

select occupation, count(*) as count
from {{ source("stgd", "membership_subscriptions") }}
group by occupation
