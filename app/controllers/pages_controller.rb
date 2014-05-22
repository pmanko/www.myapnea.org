class PagesController < ApplicationController
  def faqs

    @pc = YAML.load_file(Rails.root.join('lib', 'data', 'content', "faqs.#{params[:locale]}.yml"))

  end

  def network
    @page_content = YAML.load_file(Rails.root.join('lib', 'data', 'content', "network.#{params[:locale]}.yml"))
  end

  def splash
    @page_content = YAML.load_file(Rails.root.join('lib', 'data', 'content', "splash.#{params[:locale]}.yml"))['en']['splash']
  end

  def team

    @pc = YAML.load_file(Rails.root.join('lib', 'data', 'content', "team.#{params[:locale]}.yml"))
  end

  def privacy_policy
    @pc = YAML.load_file(Rails.root.join('lib', 'data', 'content', "privacy_policy.#{params[:locale]}.yml"))
  end
end