# frozen_string_literal: true

require_relative 'dhl/version'
require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/string/inflections'

require 'http'

module DHL
  require 'dhl/configuration'

  autoload :Error, 'dhl/error'

  autoload :BaseClient, 'dhl/clients/base_client'
  autoload :RetoureClient, 'dhl/clients/retoure_client'
  autoload :TrackingClient, 'dhl/clients/tracking_client'

  autoload :BaseObject, 'dhl/objects/base_object'
  autoload :RetoureLabel, 'dhl/objects/retoure_label'
  autoload :Tracking, 'dhl/objects/tracking'

end
