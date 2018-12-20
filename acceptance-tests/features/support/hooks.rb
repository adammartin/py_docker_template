AfterConfiguration do
  system('echo Starting $IMAGE_ID')
  CONTAINER_ID = %x{docker run -p 80:80 -d $IMAGE_ID}
  raise 'Failed to start container for Image $IMAGE_ID' unless alive? 'http://localhost/', 'Waiting for image to load application.'
end

at_exit do
  system("echo Stopping && docker stop #{CONTAINER_ID}")
  puts "Stopped #{CONTAINER_ID}"
end

def alive? url, message
  5.times do
    begin
      response = Faraday.get url
      return true if response && response.status == 200
    rescue
      puts message
    end
    sleep 1
  end
  false
end
