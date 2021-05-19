

      create or replace transient table RAW.jaffle_shop.stg_payment  as
      (select
    id as paymentid,
    orderid, 
    status,
    amount,
    created
from
    raw.stripe.payment
      );
    