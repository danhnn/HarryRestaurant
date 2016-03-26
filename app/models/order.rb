class Order < ActiveRecord::Base
  belongs_to :food_item
  validates :food_item, :name,:phone,:address,:email,:quantity,:coupon_code, presence: true

  def send_message(phone_number, alert_message)

    #@twilio_number = ENV['TWILIO_NUMBER']
    #@client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    @twilio_number = ENV['TWILIO_NUMBER']
    @phone_number = ENV['PHONE_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    message = @client.account.messages.create(
      :from => @twilio_number,
      :to =>  @phone_number,
      :body => alert_message
      )
    puts message.to
  end
end
