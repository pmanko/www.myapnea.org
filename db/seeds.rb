# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

to_keep = [ "users", "schema_migrations"]
tables = ["answer_types",
          "question_answer_options",
          "answer_sessions",
          "answers",
          "answer_values", "questions", "answer_edges", "units", "question_help_messages", "answer_options", "question_types", "question_edges", "question_flows"]

tables.each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
end

files = [
    ["units.yml", Unit],
    ["answer_types.yml", AnswerType],
    ["question_types.yml", QuestionType],
    ["answer_options.yml", AnswerOption],
    ["question_help_messages.yml", QuestionHelpMessage],
    ["questions.yml", Question],
    ["question_flows.yml", QuestionFlow],
]

files.each do |file_name, model_class|
  file_path = Rails.root.join('lib', 'data', Rails.env, 'questionnaires', file_name)

  puts(file_path)
  yaml_data = YAML.load_file(file_path)

  yaml_data.each do |object_attrs|
    #MY_LOG.info object_attrs
    model_class.create(object_attrs)
  end
end

qe_path = Rails.root.join('lib', 'data', Rails.env, 'questionnaires', 'question_edges.yml')
puts(qe_path)

yaml_data = YAML.load_file(qe_path)

yaml_data.each_with_index do |attrs, i|

  q1 = Question.find(attrs['parent_question_id'])
  q2 = Question.find(attrs['child_question_id'])

  qe = QuestionEdge.build_edge(q1, q2, attrs['condition'], attrs['question_flow_id'])

  puts("Creating edge #{i} of #{yaml_data.length} between #{q1.id} and #{q2.id}")
  raise StandardError, qe.errors.full_messages unless qe.save
end

QuestionFlow.all.each {|qf| qf.reset_paths }

# File.open('/home/pwm4/Desktop/qs.yml', 'w') {|f| f.write Question.all.map{|q| {
#     'id' => q.id,
#     'graph_id' => q.old_id,
#     'text_en' => q.text,
#     'time_estimate' => q.time_estimate.to_f,
#     'question_type_id' => q.question_type_id,
#     'answer_type_id' => q.answer_type_id,
#     'question_help_message_id' => q.question_help_message_id,
#     'unit_id' => q.unit_id,
#     'answer_option_ids' => q.answer_option_ids
# } }.to_yaml }

# s = [1, 37, 179, 219, 262, 273, 327, 344, 352, 406]
# e = [37, 179, 219, 262, 273, 327, 344, 352, 406, 425]
# m = []
#
# QuestionFlow.all.each_with_index do |qf, i|
#   p = s[i]
#   c = p + 1
#
#   while c < e[i] do
#     m << {
#       'question_flow_id' => qf.id,
#       'parent_question_id' => p,
#       'child_question_id' => c,
#       'condition' => ""
#     }
#     p += 1
#     c += 1
#   end
# end
#
#
# File.open('/home/pwm4/Desktop/qf.yml', 'w') {|f| f.write m.to_yaml }



=begin
QuestionFlow.each do |qf|

end
=end

User.create(email: "piotr.mankowski@gmail.com", first_name: "Piotr", last_name: "Mankowski", password: "123", year_of_birth: Date.today.year, zip_code: "02141", accepted_consent_at: Time.now, accepted_pledge_at: Time.now)