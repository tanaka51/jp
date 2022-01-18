# frozen_string_literal: true

class NotesController < ApplicationController
  def index; end

  def show
    @note = Note.published.find_by!(number: params[:number])
  end
end
