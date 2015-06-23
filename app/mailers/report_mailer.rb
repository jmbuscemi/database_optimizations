class ReportMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_mailer.send_report.subject
  #
  def send_report
    @assembly = Assembly.find_by_name(params[:name])
    @hits = []
    genes = Gene.joins(sequence: [:assembly]).where('assemblies.name ="'+params[:name]+'"')
    genes.each do |g|
      g.hits.each do |h|
        @hits << h
      end
    end
    @hits.sort! {|a, b| b.percent_similarity <=> a.percent_similarity}


    mail to: "to@example.org"
  end
end
