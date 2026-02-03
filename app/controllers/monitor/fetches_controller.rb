class Monitor::FetchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_monitor_fetch, only: %i[ show edit update destroy ]

  # GET /monitor/fetches
  def index
    @monitor_fetches = Monitor::Fetch.all
  end

  # GET /monitor/fetches/1
  def show
  end

  # GET /monitor/fetches/new
  def new
    @monitor_fetch = Monitor::Fetch.new
  end

  # GET /monitor/fetches/1/edit
  def edit
  end

  # POST /monitor/fetches
  def create
    @monitor_fetch = current_user.monitor_fetches.new(monitor_fetch_params)

    if @monitor_fetch.save
      redirect_to @monitor_fetch, notice: "Fetch was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /monitor/fetches/1
  def update
    if @monitor_fetch.update(monitor_fetch_params)
      redirect_to @monitor_fetch, notice: "Fetch was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /monitor/fetches/1
  def destroy
    @monitor_fetch.destroy!
    redirect_to monitor_fetches_path, notice: "Fetch was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monitor_fetch
      @monitor_fetch = Monitor::Fetch.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def monitor_fetch_params
      params.require(:monitor_fetch).permit(:name, :url, :poll_interval)
    end
end
