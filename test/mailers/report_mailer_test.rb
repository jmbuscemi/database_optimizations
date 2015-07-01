require 'test_helper'

class ReportMailerTest < ActionMailer::TestCase
  test "send_report" do
    @assembly = assemblies(:one)
    @report = Report.find_by_assembly_id(@assembly.id)

    mail = ReportMailer.send_report(@assembly.name, "to@example.org")
    assert_equal "Send report", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Gene", mail.body.encoded
  end

end
