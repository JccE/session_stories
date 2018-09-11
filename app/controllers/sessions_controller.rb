class SessionsController < ApplicationController

  before_action :require_user
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  def index
    @sessions = current_user.sessions
  end

  def new
    @session = current_user.sessions.new
  end

  def show
  end

  def edit
  end

  def create
    @session = current_user.sessions.new(session_params)

    respond_to do |format|
      if @session.save
        flash[:success] = "Added new session"
        format.html { redirect_to @session, notice: 'Session was successfully created.' }

      else
        flash[:error] = "There was a problem adding the session."
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: 'Session was successfully destroyed.' }
    end
  end

  private

  def set_session
    @session = current_user.sessions.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:title, :description, :is_favorite)
  end
end
