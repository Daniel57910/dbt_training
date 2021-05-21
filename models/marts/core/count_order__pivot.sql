{%- set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] -%}

with orders as (
    select * from {{ ref('stg_orders') }}
),
payment as (
    select * from {{ ref('stg_payment') }}
),
order_join as (
    select
        orders.order_id,
        payment.status,
        payment.payment_method as method,
        payment.amount
    from
        orders
    join payment on payment.orderid = orders.order_id
),
pivot_count as (
    select
    {% for method in payment_methods %}
        count_if(method = '{{ method }}') as {{ method }}{%- if not loop.last -%},{%- endif -%}
    {% endfor %}
    from
        order_join
)

select * from pivot_count