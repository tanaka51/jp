require "application_system_test_case"

class Admin::NotesTest < ApplicationSystemTestCase
  setup do
    @admin_note = admin_notes(:one)
  end

  test "visiting the index" do
    visit admin_notes_url
    assert_selector "h1", text: "Notes"
  end

  test "should create note" do
    visit admin_notes_url
    click_on "New note"

    click_on "Create Note"

    assert_text "Note was successfully created"
    click_on "Back"
  end

  test "should update Note" do
    visit admin_note_url(@admin_note)
    click_on "Edit this note", match: :first

    click_on "Update Note"

    assert_text "Note was successfully updated"
    click_on "Back"
  end

  test "should destroy Note" do
    visit admin_note_url(@admin_note)
    click_on "Destroy this note", match: :first

    assert_text "Note was successfully destroyed"
  end
end
