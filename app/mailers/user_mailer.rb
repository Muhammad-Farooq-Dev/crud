class UserMailer < ApplicationMailer
  default from: 'muhammad.farooq@devsinc.com'


  def welcome_mail
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
