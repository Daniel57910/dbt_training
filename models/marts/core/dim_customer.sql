with customers as (

    select * from {{ ref('stg_customers')}}

),

orders as (
    select * from {{ ref('fact_orders') }}
),

customer_orders as (
    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(amount) as total_amount
    from orders
    group by 1
),

final as (
    select * from customer_orders
    left join customers on customer_orders.customer_id = customers.customer_id
)

select * from final