class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("mailler.activated_2")
  end

  def password_reset
    @greeting = t "mailler.p"
    mail to: "to@example.org"
  end
end
