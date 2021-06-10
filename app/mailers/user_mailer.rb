class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def  welcome_email (user) 
    @user = user
   # @url  = 

    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def user_order(order)
    @order = order
    mail(to: @order.user.email, subject: 'Commande bien passée !')
  end

end
