# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get login page' do
    get login_url
    assert_response :success
  end

  test 'should create login session' do
    post sessions_url(session_form: { login_id: 'hoge', password: 'hoge' })

    assert session[:logged_in]
    assert_redirected_to notes_path
  end

  test 'should delete session' do
    delete logout_url

    assert_nil session[:logged_in]
    assert_redirected_to root_path
  end
end
