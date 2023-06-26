require 'zeitwerk'
require_relative 'config'

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect(
  'dhl_api' => 'DHLAPI'
)
loader.push_dir('./lib')
loader.collapse('./lib/dhl_api/clients')
loader.collapse('./lib/dhl_api/objects')
loader.ignore("#{__dir__}/config.rb")
loader.enable_reloading
# loader.log!
loader.setup

$__dhl_loader__ = loader

def reload!
  $__dhl_loader__.reload
  set_config
  true
end
