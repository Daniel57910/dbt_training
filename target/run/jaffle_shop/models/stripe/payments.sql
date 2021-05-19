

      create or replace transient table RAW.jaffle_shop.payments  as
      (select
    id as payment_id,
    orderid,
    amount

from raw.stripe.payment
      );
    