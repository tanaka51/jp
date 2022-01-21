# frozen_string_literal: true

require 'application_system_test_case'

module Admin
  class NotesTest < ApplicationSystemTestCase
    setup do
      @note = notes(:one)

      visit login_url
      fill_in 'ログインID', with: 'hoge'
      fill_in 'パスワード', with: 'hoge'
      click_on 'ログイン'
    end

    test 'visiting the index' do
      visit admin_notes_url
      assert_selector 'h1', text: 'Notes'
    end

    test 'should create note' do
      visit admin_notes_url
      click_on 'New note'

      fill_in 'Title', with: 'hoge'
      fill_in 'Content', with: 'hoge'

      click_on 'Create Note'

      assert_text 'Note was successfully created'
      click_on 'Back'
    end

    test 'should update Note' do
      visit admin_note_url(@note)
      click_on 'Edit this note', match: :first

      click_on 'Update Note'

      assert_text 'Note was successfully updated'
      click_on 'Back'
    end

    test 'should destroy Note' do
      visit admin_note_url(@note)
      click_on 'Destroy this note', match: :first

      assert_text 'Note was successfully destroyed'
    end
  end
end
