class Application < Sinatra::Base
  configure do
    set :app_file, File.join(File.dirname(__FILE__), 'application.rb')
  end

  configure :production do
    
  end

  configure :development do
    
  end

  configure :test do

  end
end
