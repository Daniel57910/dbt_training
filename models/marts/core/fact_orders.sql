with orders as (
    select * from {{ ref('stg_orders') }}
),
payments as (
    select * from {{ ref('stg_payment') }}
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