module DHLAPI
  class TrackingClient < BaseClient
    URL = 'https://api-eu.dhl.com/track/shipments'
    TEST_URL = 'https://api-test.dhl.com/track/shipments'

    def track(attributes = {})
      attributes = attributes.deep_transform_keys { |key| key.to_s.camelize(:lower) }
      self.response = connection.get(url, params: attributes)
      Tracking.new handle_response.parse
    end
  end
end
