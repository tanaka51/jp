# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @session_form = SessionForm.new
  end

  def create
    @session_form = SessionForm.new(session_form_params)
    if @session_form.authenticate
      session[:logged_in] = true

      redirect_to notes_path, notice: 'ログインした'
    else
      render :new
    end
  end

  def destroy
    session[:logged_in] = nil

    redirect_to root_path
  end

  private

  def session_form_params
    params.require(:session_form).permit(:login_id, :password)
  end
end
