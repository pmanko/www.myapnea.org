class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)

    patient_profile_path(user)

  end

  def send_message(service, form_data = {}, method = "get", limit = 1, service_url = '')
#    return { result: '', error: 'No URL provided' } if false #if .blank? or TT_EMAIL.blank? or TT_PASSWORD.blank?
#    error = ''
#    data = ''
#    response = ''
#    return { result: data, error: 'HTTP redirect too deep' } if limit < 0

#    t_msg_start = Time.now

#    service_url = "#{}/#{service}" if service_url.blank?


=begin

    begin
      url = URI.parse("https://sleepepi.partners.org/edge/pi")
      use_secure = (url.scheme == 'https')

      https = Net::HTTP.new(url.host, url.port)
      https.open_timeout = 1000 # in seconds
      https.read_timeout = 3000 # in seconds
      https.use_ssl = true if use_secure
      https.verify_mode = OpenSSL::SSL::VERIFY_NONE if use_secure

      headers = { 'Content-Type' => 'text/html', 'WWW-Authenticate' => 'Basic realm="Application"', 'Authorization' => "Basic #{Base64.strict_encode64("pi.dev.sleepepi@gmail.com:sleepepi")}" }

      url = URI.parse(service_url)
      req = if method == "post"
              Net::HTTP::Post.new(url.path, headers)
            else # elsif method == "get"
              Net::HTTP::Get.new(url.path, headers)
            end
      req.set_form_data(form_data.stringify_keys, ';') unless form_data.blank?

      https.start do |http|
        response = http.request(req)
      end
      data = response.body

      if response.kind_of?(Net::HTTPSuccess)
        # Do nothing, success!
      elsif response.kind_of?(Net::HTTPRedirection)
        return send_message(service, form_data, method, limit - 1, response['location'])
      else
        error = "Error: #{response.class.name} #{data}"
        data = ''
      end
    rescue => e
      error = e.to_s
      Rails.logger.debug "Error: #{error} #{data}"
      data = ''
    end

    { result: data, error: error }
=end
  end

end
