module AnswerSessionsHelper
  def previous_question_path(answer)
    if answer.answer_session.first_answer.nil? or answer.answer_session.first_answer == answer
      start_answer_session_path(question_flow_id: answer.answer_session.question_flow.id)
    elsif answer.previous_answer.present?
      ask_question_path(question_id: answer.previous_answer.question.id, answer_session_id: answer.answer_session.id)
    else
      ask_question_path(question_id: answer.answer_session.last_answer.question.id, answer_session_id: answer.answer_session.id)
    end
  end

  def have_checked?(answer, val)
    if answer.value.present?
      if answer.value.kind_of?(Array)
        answer.value.include? val
      else
        answer.value == val
      end
    else
      false
    end

  end

  def start_or_resume(question_flow, answer_session)
    if answer_session.present? and answer_session.started?
      ask_question_path(answer_session_id: answer_session.id, question_id: answer_session.last_answer.next_question.id)
    else
      start_answer_session_path(question_flow_id: question_flow.id)
    end
  end
end
