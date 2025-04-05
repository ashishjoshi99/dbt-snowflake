with L as (
    SELECT * FROM {{ ref('dim_listings') }}
),
H as (
    SELECT * from {{ ref('dim_hosts') }}
)

SELECT
    L.LISTING_ID,  
    L.LISTING_NAME, 
    L.ROOM_TYPE, 
    L.MINIMUM_NIGHTS, 
    L.HOST_ID, 
    L.PRICE, 
    H.HOST_NAME, 
    H.IS_SUPERHOST as host_is_superhost, 
    L.CREATED_AT, 
    GREATEST(H.UPDATED_AT,L.UPDATED_AT) as UPDATED_AT
FROM L 
LEFT JOIN H on (H.HOST_ID = L.HOST_ID)