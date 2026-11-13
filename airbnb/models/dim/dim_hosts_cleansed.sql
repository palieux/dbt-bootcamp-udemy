{{
  config(
    materialized='view'
  )
}}

WITH src_hosts AS (
    select * from {{ ref('src_hosts') }}
)

select 
    HOST_ID,
    COALESCE(host_name, 'Anonymous') AS host_name, -- course materials suggested the NVL function. This is more Oracle style. COALESCE works for more databases and accepts more fallback options.
    is_superhost,
    created_at,
    updated_at
from src_hosts