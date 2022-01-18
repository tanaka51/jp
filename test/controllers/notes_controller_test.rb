# frozen_string_literal: true

require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get notes_url
    assert_response :success
  end

  test 'should get show' do
    get note_url(number: 'vNe5i7tmS5nwjliJ')
    assert_response :success
  end
end
