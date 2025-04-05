{{
  config(
    materialized = 'view',
    )
}}

WITH src_listings as (
    SELECT * FROM {{ ref('src_listings') }}
)
SELECT
    LISTING_ID, 
    LISTING_URL, 
    LISTING_NAME, 
    ROOMTYPE as ROOM_TYPE, 
    CASE
        WHEN MIN_NIGHTS = 0 THEN 1
        ELSE MIN_NIGHTS
    END as MINIMUM_NIGHTS,
    HOST_ID, 
    REPLACE(PRICE, '$') :: NUMBER(10,2) as PRICE,
    CREATED_AT, 
    UPDATED_AT
FROM
    src_listings