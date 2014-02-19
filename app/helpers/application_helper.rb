module ApplicationHelper

  def display_errors(object)
    #MY_LOG.info "ERRORS: #{object.errors.to_yaml} #{object.study_original_results.map{|x| x.errors}.to_yaml}"
    return "" if object.errors.empty?

    messages = object.errors.full_messages
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => object.class.model_name.human.downcase)

    render :partial => "layouts/errors", :locals => {name: object.class.name, sentence: sentence, messages: messages} if object.errors.any?
  end

end
