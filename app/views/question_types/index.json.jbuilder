json.array!(@question_types) do |question_type|
  json.extract! question_type, :id, :name
  json.url question_type_url(question_type, format: :json)
end
