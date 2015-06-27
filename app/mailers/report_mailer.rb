class ReportMailer < ApplicationMailer

  def send_report(name, email)
    @assembly = Assembly.find_by_name(name)
    @hits = @assembly.hits
    mail to: "#{email}"
  end
end
