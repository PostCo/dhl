# frozen_string_literal: true

require_relative 'dhl_api/version'
require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/string/inflections'

require 'http'

module DHLAPI
  require 'dhl_api/configuration'

  autoload :Error, 'dhl_api/error'

  autoload :BaseClient, 'dhl_api/clients/base_client'
  autoload :RetoureClient, 'dhl_api/clients/retoure_client'
  autoload :TrackingClient, 'dhl_api/clients/tracking_client'

  autoload :BaseObject, 'dhl_api/objects/base_object'
  autoload :RetoureLabel, 'dhl_api/objects/retoure_label'
  autoload :Tracking, 'dhl_api/objects/tracking'
end
