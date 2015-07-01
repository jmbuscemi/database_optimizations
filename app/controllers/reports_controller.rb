class ReportsController < ApplicationController
  def welcome
    @assembly_names = Assembly.all.map {|a| a.name}
    @report = Report.new
  end

  def thank_you
    @assembly = Assembly.find_by_name(params[:name])
    @report = Report.create!(assembly_id: @assembly.id, uploaded_file: params[:uploaded_file], name: params[:name])
    ReportMailer.send_report(params[:name], params[:email]).deliver_now
  end

  private def report_params
    params.permit(:uploaded_file, :assembly_id, :name)
  end

end
