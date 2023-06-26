require 'dotenv/load'

def set_config
  DHL.configure do |config|
    config.api_key = ENV['API_KEY']
  end
end
