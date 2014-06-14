# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


files = [
    ["units.yml", Unit],
    ["answer_types.yml", AnswerType],
    ["question_types.yml", QuestionType],
    ["answer_options.yml", AnswerOption],
    ["question_help_messages.yml", QuestionHelpMessage],
    ["questions.yml", Question]
#    ["question_flows.yml", QuestionFlow],
#    ["question_edges.yml", QuestionEdge],
]


files.each do |file_name, model_class|
  file_path = Rails.root.join('lib', 'data', 'questionnaires', file_name)

  print(file_path)
  yaml_data = YAML.load_file(file_path)

  yaml_data.each do |object_attrs|
    #MY_LOG.info object_attrs
    model_class.create(object_attrs)
  end
end

File.open('/home/pwm4/Desktop/qs.yml', 'w') {|f| f.write Question.all.map{|q| {
    'id' => q.id,
    'graph_id' => q.old_id,
    'text_en' => q.text,
    'time_estimate' => q.time_estimate.to_f,
    'question_type_id' => q.question_type_id,
    'answer_type_id' => q.answer_type_id,
    'question_help_message_id' => q.question_help_message_id,
    'unit_id' => q.unit_id,
    'answer_option_ids' => q.answer_option_ids
} }.to_yaml }

User.create(email: "piotr.mankowski@gmail.com", first_name: "Piotr", last_name: "Mankowski", password: "123", year_of_birth: Date.today.year, zip_code: "02141", accepted_consent_at: Time.now, accepted_pledge_at: Time.now)