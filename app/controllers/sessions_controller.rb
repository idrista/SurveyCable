class SessionsController < ApplicationController
  before_action :set_session, only: %i[ show edit update destroy ]

  def root
    @session = Session.new
  end

  # GET /sessions or /sessions.json
  def index
    @sessions = Session.where(owner: registered_user)
  end

  # GET /sessions/1 or /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
    @session = Session.new
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions or /sessions.json
  def create
    @session = Session.new(session_params)
    @session.owner = registered_user

    respond_to do |format|
      if @session.save
        format.html { redirect_to session_url(@session), notice: "Session was successfully created." }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessions/1 or /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to session_url(@session), notice: "Session was successfully updated." }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1 or /sessions/1.json
  def destroy
    @session.destroy!

    respond_to do |format|
      format.html { redirect_to sessions_url, notice: "Session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def go
    @session = Session.find_by(slug: params[:slug])
    render json: @session, status: :ok
  end

  private
    def set_session
      @session = Session.find(params[:id])
      redirect_to :sessions if @session.owner != registered_user
    end

    # Only allow a list of trusted parameters through.
    def session_params
      params.require(:session).permit(:name)
    end
end
