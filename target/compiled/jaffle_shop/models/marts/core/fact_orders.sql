with orders as (

    select * from RAW.jaffle_shop.stg_orders

),
payments as (
    -- ask about specifics of parametirizing schema
    select * from RAW.jaffle_shop.stg_payment
),
final as (
    select 
        ord.order_id,
        ord.customer_id,
        ord.order_date,
        ord.status,
        zeroifnull(pay.amount / 100) as amount
    from
        orders as ord
    join payments as pay on pay.orderid = ord.order_id and pay.status = 'success'
)

select * from final