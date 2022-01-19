# frozen_string_literal: true

require 'test_helper'

module Admin
  class NotesControllerTest < ActionDispatch::IntegrationTest
    setup do
      @admin_note = admin_notes(:one)
    end

    test 'should get index' do
      get admin_notes_url
      assert_response :success
    end

    test 'should get new' do
      get new_admin_note_url
      assert_response :success
    end

    test 'should create admin_note' do
      assert_difference('Admin::Note.count') do
        post admin_notes_url, params: { admin_note: {} }
      end

      assert_redirected_to admin_note_url(Admin::Note.last)
    end

    test 'should show admin_note' do
      get admin_note_url(@admin_note)
      assert_response :success
    end

    test 'should get edit' do
      get edit_admin_note_url(@admin_note)
      assert_response :success
    end

    test 'should update admin_note' do
      patch admin_note_url(@admin_note), params: { admin_note: {} }
      assert_redirected_to admin_note_url(@admin_note)
    end

    test 'should destroy admin_note' do
      assert_difference('Admin::Note.count', -1) do
        delete admin_note_url(@admin_note)
      end

      assert_redirected_to admin_notes_url
    end
  end
end
