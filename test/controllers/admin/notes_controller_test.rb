# frozen_string_literal: true

require 'test_helper'

module Admin
  class NotesControllerTest < ActionDispatch::IntegrationTest
    setup do
      @note = notes(:one)

      post sessions_url(session_form: { login_id: 'hoge', password: 'hoge' })
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
      assert_difference('Note.count') do
        post admin_notes_url, params: { note: { title: 'hoge', content: 'hoge' } }
      end

      assert_redirected_to admin_note_url(Note.last)
    end

    test 'should show admin_note' do
      get admin_note_url(@note)
      assert_response :success
    end

    test 'should get edit' do
      get edit_admin_note_url(@note)
      assert_response :success
    end

    test 'should update admin_note' do
      patch admin_note_url(@note), params: { note: { title: 'hoge', content: 'hoge' } }
      assert_redirected_to admin_note_url(@note)
    end

    test 'should destroy admin_note' do
      assert_difference('Note.count', -1) do
        delete admin_note_url(@note)
      end

      assert_redirected_to admin_notes_url
    end
  end
end
