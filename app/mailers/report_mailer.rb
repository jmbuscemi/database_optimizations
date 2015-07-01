class ReportMailer < ApplicationMailer

  def send_report(name, email)
    @assembly = Assembly.find_by_name(name)
    @hits = @assembly.hits
    @report = Report.find_by_assembly_id(@assembly.id)
    mail to: "#{email}", subject: "Report for Assembly #{name}"
  end

end
