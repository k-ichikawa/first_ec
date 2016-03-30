class InquiryMailer < ActionMailer::Base
  default from: "chottokeinkana@gmail.com"   # 送信元アドレス
  default to: "chottokeinkana@gmail.com"     # 送信先アドレス
 
  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'お問い合わせを承りました')
  end
 
end