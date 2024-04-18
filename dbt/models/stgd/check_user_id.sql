-- dbt: check_user_id
-- description: Ensures the validity of user IDs by performing null checks.
-- tags: [data validation, user management]
-- source: stgd
{{ config(materialized="table") }}


with
    valid_user_ids as (
        select user_id, cancelled
        from {{ source("stgd", "membership_subscriptions") }}
        where user_id is not null
    )

select * from valid_user_ids where cancelled = 'no'