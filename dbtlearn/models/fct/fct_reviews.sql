{{
  config(
    materialized = 'incremental',
    on_schema_change = 'fail'
    )
}}


with src_reviews as (
    SELECT * from {{ ref('src_reviews') }}
)
SELECT * FROM src_reviews WHERE review_text IS NOT NULL
{% if is_incremental() %}
  and review_date > (SELECT max(review_date) from {{this}})
{% endif %}