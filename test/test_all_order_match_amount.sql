select
    sum(amount) as final_amount
from {{ ref('fact_orders') }}
having
    final_amount != 1672
