class ReportsController < ApplicationController
  def welcome
    @assembly_names = Assembly.all.map {|a| a.name}
  end

  def thank_you
    ReportMailer.send_report(params[:name], params[:email]).deliver_now
  end

  def all_data

  end


end
