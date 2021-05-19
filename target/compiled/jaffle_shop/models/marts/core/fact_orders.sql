with orders as (

    select * from RAW.jaffle_shop.stg_orders

),
payments as (
    -- ask about specifics of parametirizing schema
    select * from raw.stripe.payment

),
fact_orders as (
    select 
        ord.order_id,
        ord.customer_id,
        ord.order_date,
        ord.status,
        zeroifnull(pay.amount) as amount
    from
        orders as ord
    left join payments as pay on pay.orderid = ord.order_id
)

select * from fact_orders