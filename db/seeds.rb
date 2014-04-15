# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


files = [["units.yml", Unit], ["answer_types.yml", AnswerType], ["question_types.yml", QuestionType], ["answer_options.yml", AnswerOption], ["questions.yml", Question], ["question_flows.yml", QuestionFlow], ["question_edges.yml", QuestionEdge]]

files.each do |file_name, model_class|
  file_path = Rails.root.join('lib', 'data', file_name)

  yaml_data = YAML.load_file(file_path)

  yaml_data.each do |object_attrs|
    #MY_LOG.info object_attrs
    model_class.create(object_attrs)
  end

end