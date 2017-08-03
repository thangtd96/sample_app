module UsersHelper
  def gravatar_for user, size: Settings.size.avatar
    gravatar_id = Digest::MD5::hexdigest user.email.downcase
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag gravatar_url, alt: user.name, class: "gravatar"
  end

  def custom_erros user
    user.errors.messages.each do |msg|
      @name_error = msg[1].last if msg[0].eql? :name
      @email_error = msg[1].last if msg[0].eql? :email
      @password_error = msg[1].last if msg[0].eql? :password
      @password_confir_error = msg[1].last if msg[0].eql? :password_confirmation
    end if user.errors.any?
  end

end
