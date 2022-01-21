# frozen_string_literal: true

class SessionForm
  include ActiveModel::Model

  attr_accessor :login_id, :password

  def authenticate
    if login_id == ENV['LOGIN_ID'] && password == ENV['PASSWORD']
      true
    else
      errors.add :base, 'login failed'

      false
    end
  end
end
