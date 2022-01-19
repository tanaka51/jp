# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :logged_in?

  private

  def logged_in?
    session[:logged_in].present?
  end

  def require_login
    # hide pages
    raise ActionController::RoutingError, 'Not Found' unless logged_in?
  end
end
