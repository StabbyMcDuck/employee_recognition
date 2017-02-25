class AwardMailer < ApplicationMailer
  def award_email(award)
    @award = award

    attachments['award.pdf'] = File.read("#{Rails.root}/test.pdf")

    mail(to: @award.employee_email, subject: 'Congrats! You got an award!')
  end
end