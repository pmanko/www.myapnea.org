json.array!(@question_flows) do |question_flow|
  json.extract! question_flow, :id, :answer_option_id, :condition, :child_id
  json.url question_flow_url(question_flow, format: :json)
end
