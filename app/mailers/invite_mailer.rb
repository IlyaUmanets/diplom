class InviteMailer < ActionMailer::Base
  default from: 'support_diplom@gmail.com'

  def invite(user, password)
    @user = user
    @password = password
    mail(to: @user.email, subject: 'Invite to test system')
  end
end
