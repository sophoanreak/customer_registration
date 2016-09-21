json.extract! customer_history, :id, :date_create, :problem, :solution, :remark, :created_at, :updated_at
json.url customer_history_url(customer_history, format: :json)