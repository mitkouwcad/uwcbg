class UserMailer < ApplicationMailer
  def confirmation_email(user)
    @to = user.email
    @url = "http://work.bg-uwc.org/confirm_email?token=#{user.confirmation_token}"

    mail(to: @to, subject: "[UWC Bulgaria] Моля потвърдете имейл адреса си")
  end
end
