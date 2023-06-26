module DHLAPI
  class Configuration
    attr_accessor :api_key, :testing
  end

  class << self
    def config
      @config ||= Configuration.new
    end

    def configure
      yield config
      after_configure
    end

    def after_configure
      config.testing ||= false

      # register special mime type for DHLAPI error responses
      HTTP::MimeType.register_adapter 'application/problem+json', HTTP::MimeType::JSON
    end
  end
end
