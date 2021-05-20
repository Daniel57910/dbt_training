select
    id as paymentid,
    orderid,
    status,
    amount,
    created
from {{ source('stripe', 'payment')}}