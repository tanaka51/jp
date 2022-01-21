# frozen_string_literal: true

require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test 'set number before validation' do
    note = Note.new.tap(&:valid?)
    assert_not_nil note.number
  end
end
