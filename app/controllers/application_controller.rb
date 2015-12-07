class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_action :set_csrf_cookie_for_ng
  helper_method :resource_name, :resource, :devise_mapping

  def set_csrf_cookie_for_ng

    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?

  end

  def resource_name

    :user

  end

  def resource

    @resource ||= User.new

  end

  def devise_mapping

    @devise_mapping ||= Devise.mappings[:user]

  end

  protected

  def verified_request?

    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])

  end

end