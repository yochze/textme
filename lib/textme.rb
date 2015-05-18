#!/usr/bin/env ruby

require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACef6890d3512cdadf59af1b57985f8c45'

auth_token = '9586a153ebb24fba1beac2ce6068e0a3'
#
# # set up a client to talk to the Twilio REST API
# @client = Twilio::REST::Client.new account_sid, auth_token
#
@client = Twilio::REST::Client.new account_sid, auth_token

# alternatively, you can preconfigure the client like so
Twilio.configure do |config|
    config.account_sid = account_sid
    config.auth_token = auth_token
end

# and then you can create a new client without parameters
@client = Twilio::REST::Client.new

msg = ARGV.join("\s").gsub("\n", "\s")
puts msg
@client.messages.create(
    from: '+18665562571',
    to: '+972506660186',
    body: 'Task completed: ' + msg
)
