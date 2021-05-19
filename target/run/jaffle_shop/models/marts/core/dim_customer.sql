
  create or replace  view RAW.jaffle_shop.dim_customer  as (
    -- with customers as (

--     select * from RAW.jaffle_shop.stg_customers

-- ),

-- orders as (
--     select * from RAW.jaffle_shop.fact_orders
-- ),

-- customer_orders as (

--     select
--         customer_id,
--         min(order_date) as first_order_date,
--         max(order_date) as most_recent_order_date,
--         count(order_id) as number_of_orders,
--         sum(amount) as total_amount
--     from orders
--     group by 1
-- )

select * from RAW.jaffle_shop.fact_orders
  );
