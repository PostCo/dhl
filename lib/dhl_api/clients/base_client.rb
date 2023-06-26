require 'http'

module DHLAPI
  class BaseClient
    attr_writer :http_client
    attr_reader :response

    def connection
      @connection ||= HTTP.headers(content_type: 'application/json', dhl_api_key: DHLAPI.config.api_key)
    end

    private

    attr_writer :response

    def url
      DHLAPI.config.testing ? self.class::TEST_URL : self.class::URL
    end

    def handle_response
      error_message = response.body

      case response.status
      when 400
        raise Error, "A bad request or a validation exception has occurred. #{error_message}"
      when 401
        raise Error, "Invalid authorization credentials. #{error_message}"
      when 403
        raise Error, "Connection doesn't have permission to access the resource. #{error_message}"
      when 404
        raise Error, "The resource you have specified cannot be found. #{error_message}"
      when 429
        raise Error, "The API rate limit for your application has been exceeded. #{error_message}"
      when 500
        raise Error,
              "An unhandled error with the . Contact the DHLAPI team if problems persist. #{error_message}"
      when 503
        raise Error,
              "API is currently unavailable – typically due to a scheduled outage – try again soon. #{error_message}"
      end

      response
    end
  end
end
