namespace :db do
  desc "Reset production database"
  task :prepare do



    to_keep = ["mailing_lists"]
    tables = ["users", "schema_migrations", "answer_types", "question_answer_options", "answer_sessions", "answers", "answer_values", "questions", "answer_edges", "units", "question_help_messages", "answer_options", "question_types", "question_edges", "question_flows"]

    tables.each do |table|
      ActiveRecord::Base.connection.execute("drop table #{table}")
    end

  end
end
