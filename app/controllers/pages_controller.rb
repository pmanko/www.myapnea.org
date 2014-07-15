class PagesController < ApplicationController

  layout 'myapnea'

  def faqs

    @pc = YAML.load_file(Rails.root.join('lib', 'data', 'content', "faqs.#{I18n.locale}.yml"))

  end

  def network
    @page_content = YAML.load_file(Rails.root.join('lib', 'data', 'content', "network.#{I18n.locale}.yml"))
  end

  def splash
    @page_content = YAML.load_file(Rails.root.join('lib', 'data', 'content', "splash.#{I18n.locale}.yml"))['en']['splash']
  end

  def team

    @pc = YAML.load_file(Rails.root.join('lib', 'data', 'content', "team.#{I18n.locale}.yml"))
  end

  def privacy_policy
    @pc = YAML.load_file(Rails.root.join('lib', 'data', 'content', "privacy_policy.#{I18n.locale}.yml"))
  end

  def thank_you
    @pc = YAML.load_file(Rails.root.join('lib', 'data', 'content', "thank_you.#{I18n.locale}.yml"))

  end

  def version

  end
end
