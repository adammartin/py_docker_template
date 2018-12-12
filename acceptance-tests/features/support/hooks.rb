World do
  puts 'We would instantiate the context here'
end

AfterConfiguration do
  system('echo Starting $IMAGE_ID')
  CONTAINER_ID = %x{docker run -d $IMAGE_ID}
end

at_exit do
  system("echo Stopping && docker stop #{CONTAINER_ID}")
  puts "Stopped #{CONTAINER_ID}"
end
