class QuestionnaireModifications < ActiveRecord::Migration
  def change
    # Questions

    add_column :questions, :graph_id, :integer
    rename_column :questions, :text, :text_en
    add_column :questions, :text_es, :text

    # Units
    rename_column :units, :name, :name_en
    add_column :units, :name_es, :string

    # Question Help Messages
    rename_column :question_help_messages, :message, :message_en
    add_column :question_help_messages, :message_es, :text

    # Question Flows
    rename_column :question_flows, :name, :name_en
    add_column :question_flows, :name_es, :string
    rename_column :question_flows, :description, :description_en
    add_column :question_flows, :description_es, :text

    # Answer Options
    rename_column :answer_options, :text_value, :text_value_en
    add_column :answer_options, :text_value_es, :string

    # Question Types
    add_column :question_types, :store_raw_value, :boolean
    add_column :question_types, :allow_multiple, :boolean

    # Answer Sessions
    add_column :answer_sessions, :last_answer_id, :integer

  end

end
