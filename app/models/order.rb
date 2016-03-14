class Order < ActiveRecord::Base
  belongs_to :food_item
  validates :food_item, :name,:phone,:address,:email,:quantity,:coupon_code, presence: true

  def send_message(phone_number, alert_message)

    #@twilio_number = ENV['TWILIO_NUMBER']
    #@client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    @twilio_number = '+14179554213'
    @client = Twilio::REST::Client.new 'AC49af562fd53e562b76998697a89305e5', 'c5ed08932178730dfb58933de584e045'

    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => phone_number,
      :body => alert_message
      )
    puts message.to
  end
end
