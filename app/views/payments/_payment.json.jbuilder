json.extract! payment, :id, :name_on_card, :card_number, :expiration, :security_code, :user_id, :mechanic_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
