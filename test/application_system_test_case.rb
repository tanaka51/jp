# frozen_string_literal: true

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400] do |driver_option|
    driver_option.add_argument('--headless')
    driver_option.add_argument('--no-sandbox')
  end
end
