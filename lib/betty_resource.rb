require "active_support/dependencies/autoload"
require "httparty"
require "crack/json"

module BettyResource
  extend ActiveSupport::Autoload

  autoload :Base
  autoload :Configuration
  autoload :MetaData
  autoload :Model

  def self.const_missing(name)
    puts "missing: #{name}"
    meta_data.model(name) || super
  end

  def self.config
    @configuration ||= Configuration.new
  end
  
  def self.meta_data
    @meta_data ||= MetaData.new
  end

  def self.configure
    yield config
  end
end
