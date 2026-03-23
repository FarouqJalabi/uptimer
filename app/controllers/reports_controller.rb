class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_report

  def show
    respond_to do |format|
      format.html
      format.json { render json: @report.info }
    end
  end

  private
    def set_report
      @report = current_user.reports.find(params[:id])
    end
end
