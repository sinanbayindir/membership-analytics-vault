-- dbt: cancellation_status_distribution
-- description: Calculates the distribution of users by subscription cancellation
-- status for creating a pie chart.
-- tags: [data analysis, pie chart]
-- source: stgd
{{ config(materialized="table") }}

select cancelled, count(*) as count
from {{ source("stgd", "membership_subscriptions") }}
group by cancelled

