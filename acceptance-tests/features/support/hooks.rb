World do
  puts 'We would instantiate the context here'
end

AfterConfiguration do
  puts 'Here is we would spin up the docker container'
end

at_exit do
  puts 'Here is where we would shut down'
end
