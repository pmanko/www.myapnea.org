json.array! @questions do |question|
  json.id question.id
  json.text question.text
  json.rating question.rating
end