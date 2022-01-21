# frozen_string_literal: true

module Admin
  class NotesController < ApplicationController
    before_action :require_login
    before_action :set_note, only: %i[show edit update destroy]

    def index
      @notes = Note.all
    end

    def show; end

    def new
      @note = Note.new
    end

    def edit; end

    def create
      @note = Note.new(note_params)

      # TODO: Implement later!!!
      @note.published_at = Time.zone.now

      if @note.save
        redirect_to admin_note_url(@note), notice: 'Note was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @note.update(note_params)
        redirect_to admin_note_url(@note), notice: 'Note was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @note.destroy!

      redirect_to admin_notes_url, notice: 'Note was successfully destroyed.'
    end

    private

    def set_note
      @note = Note.find_by!(number: params[:id])
    end

    def note_params
      params.require(:note).permit(:note, :title, :content)
    end
  end
end
