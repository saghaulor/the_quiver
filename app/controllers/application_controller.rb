class ApplicationController < ActionController::API
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  include ActionController::Serialization

  before_action :authenticate

  attr_reader :current_user

  private

  def authenticate
    @current_user = TokenAuthenticator.call(request.headers).result

    render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_user
  end
end
