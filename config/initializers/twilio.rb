require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new do |r|
  r.say(message: 'hello there', voice: 'alice')
  r.dial(caller_id: '+819079150313') do |d|
    d.client 'jenny'
  end
end

# print the result
puts response.to_s