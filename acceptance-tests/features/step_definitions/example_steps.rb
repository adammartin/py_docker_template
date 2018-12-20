require 'rspec/expectations'
require 'faraday'

APP_URL = 'http://localhost'

def get_resource url
  connection = Faraday.new APP_URL
  begin
    return connection.get url
  rescue StandardError => e
    File.open('cucumber_error.log', 'w') { |f| f.write(e.message) }
    e.backtrace.each do |line| puts line end
    return { 'error_recieved' => e.backtrace.first }
  end
end

Given(/^the application is running$/) do
  puts 'We already know application is running this is just an example of a Given'
end

When(/^I open the application page$/) do
  @response = get_resource '/'
end

Then(/^I should get a (\d+) response$/) do |expected_status|
  expect(@response.status).to eq expected_status.to_i
end
