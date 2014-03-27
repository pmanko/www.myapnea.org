json.array!(@plans) do |plan|
  json.extract! plan, :id, :name, :question_flow_id
  json.url plan_url(plan, format: :json)
end
