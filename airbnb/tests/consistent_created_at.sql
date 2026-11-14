SELECT
    re.review_date,
    li.created_at
FROM {{ ref('fct_reviews') }} AS re
LEFT JOIN {{ ref('dim_listings_cleansed') }} AS li
    ON re.listing_id = li.listing_id
WHERE re.review_date < li.created_at
