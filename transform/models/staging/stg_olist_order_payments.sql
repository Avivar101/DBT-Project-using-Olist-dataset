with source as (
        select * from {{ source('olist_raw_dataset', 'order_payments') }}
  ),
  renamed as (
      select
          cast(order_id as string) as order_id,
          cast(payment_sequential as integer) as payment_sequential,
          cast(payment_type as string) as payment_type,
          cast(payment_value as float64) as payment_value,
          cast(payment_installments as integer) as payment_installments
      from source
  )
  select * from renamed
