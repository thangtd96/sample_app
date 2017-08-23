class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("mailler.activated_2")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t(".reset.password_reset")
  end
end
