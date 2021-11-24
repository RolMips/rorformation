class ContactMailer < ApplicationMailer

  def contact(post)
    @post = post
    mail(to: 'rolmips@free.fr', subject: 'Test mailer RoR')
  end

end
