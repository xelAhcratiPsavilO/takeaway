# frozen_string_literal: true

require 'twilio-ruby'

TIME_FORMAT = '%H:%M'

class Sms
  def initialize(config, client)
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
    @config = config
  end

  def send_msg
    client.messages.create(args)
  end

  private

  def args
    {
      from: config[:from],
      to: config[:to],
      body: config[:body] % delivery_time
    }
  end

  def delivery_time
    in_one_hour
  end

  def in_one_hour
    (Time.now + 60 * 60).strftime(TIME_FORMAT)
  end

  attr_reader :client, :config
end
