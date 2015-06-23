class ReportsController < ApplicationController
  def welcome
    @assembly_names = Assembly.all.map {|a| a.name}
  end

  def thank_you
    @email = params[:email]
    @name = params[:name]

    ReportMailer.send_report.deliver_now
  end

  def all_data

  end


end
