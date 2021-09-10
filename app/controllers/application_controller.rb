class ApplicationController < ActionController::Base
  before_action :basic_auth
<<<<<<< Updated upstream

=======
  before_action :configure_permitted_parameters, if: :devise_controller?
>>>>>>> Stashed changes

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'aaaa' && password == '12345'
    end
  end
<<<<<<< Updated upstream
=======

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :myouji, :name, :myouji_kana, :name_kana, :birth_date])
  end
>>>>>>> Stashed changes
end
