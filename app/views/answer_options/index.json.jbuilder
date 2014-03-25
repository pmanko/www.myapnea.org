json.array!(@answer_options) do |answer_option|
  json.extract! answer_option, :id, :numeric_value, :text_value, :time_value
  json.url answer_option_url(answer_option, format: :json)
end
