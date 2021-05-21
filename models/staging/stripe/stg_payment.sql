select
    id as paymentid,
    paymentmethod as payment_method,
    orderid,
    status,
    amount,
    created
from {{ source('stripe', 'payment')}}