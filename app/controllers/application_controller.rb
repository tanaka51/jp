# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :logged_in?

  private

  def logged_in?
    session[:logged_in].present?
  end
end
