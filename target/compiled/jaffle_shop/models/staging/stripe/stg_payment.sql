select
    id as paymentid,
    orderid, 
    status,
    amount,
    created
from
    raw.stripe.payment