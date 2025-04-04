 WITH raw_listings AS  (
    SELECT * FROM airbnb.raw.raw_listings
 )
SELECT
    ID as listing_id, 
    LISTING_URL as listing_url,
    NAME as listing_name, 
    ROOM_TYPE as roomType, 
    MINIMUM_NIGHTS as min_nights, 
    HOST_ID as host_id,
    PRICE as price, 
    CREATED_AT, 
    UPDATED_AT 
FROM 
    raw_listings

