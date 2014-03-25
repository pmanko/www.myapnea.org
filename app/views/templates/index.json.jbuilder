json.array!(@templates) do |template|
  json.extract! template, :id, :name, :question_flow_id
  json.url template_url(template, format: :json)
end
