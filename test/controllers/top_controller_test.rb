# frozen_string_literal: true

require 'test_helper'

class TopControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get root_url
    assert_response :success
  end
end
