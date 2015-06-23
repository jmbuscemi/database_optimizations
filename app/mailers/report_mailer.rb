class ReportMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_mailer.send_report.subject
  #
  def send_report(name, email)
    @name = name
    @email = email
    @assembly = Assembly.find_by_name(name)
    @hits = []
    genes = Gene.joins(sequence: [:assembly]).where('assemblies.name ="'+name+'"')
    genes.each do |g|
      g.hits.each do |h|
        @hits << h
      end
    end
    @hits.sort! {|a, b| b.percent_similarity <=> a.percent_similarity}

    mail to: "#{email}"
  end
end
