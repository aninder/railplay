class FirstMailer < ApplicationMailer

  def notification(user)
    @user=user
    attachments.inline['22.jpg']=File.read( Rails.root.join("app/assets/images", "22.jpg"))
    mail(:to => "test@test.com",
         :subject => "Test")
  end


end
