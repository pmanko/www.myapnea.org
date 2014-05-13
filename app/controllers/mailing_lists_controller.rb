class MailingListsController < ApplicationController
  def show

  end

  def create

    ml = MailingList.new
    ml.email = params[:email]
    ml.ip_address = request.remote_ip

    if geocoder_result = request.location
      ml.zip_code = geocoder_result.postal_code
      ml.country = geocoder_result.country_code
      ml.state = geocoder_result.state_code
    end

    ml.save

    redirect_to thank_you_path
  end

  def thank_you

  end
end
