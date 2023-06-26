require 'zeitwerk'
require_relative 'config'

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect(
  'dhl' => 'DHL'
)
loader.push_dir('./lib')
loader.collapse('./lib/dhl/clients')
loader.collapse('./lib/dhl/objects')
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
