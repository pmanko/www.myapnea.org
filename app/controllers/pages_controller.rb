class PagesController < ApplicationController
  def faqs

    @faq_data = YAML.load_file(Rails.root.join('lib', 'data', 'content', "faqs.#{params[:locale]}.yml"))

  end

  def network
    @page_content = YAML.load_file(Rails.root.join('lib', 'data', 'content', "network.#{params[:locale]}.yml"))
  end

  def splash

  end

  def team


  end

  def privacy_policy

  end
end