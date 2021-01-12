require 'm2y_cellcoin/configuration/configuration'
require 'm2y_cellcoin/constants/constants'
require 'm2y_cellcoin/modules/base'
require 'm2y_cellcoin/modules/recharge'
require 'm2y_cellcoin/dock_serializer/dealers'
require 'm2y_cellcoin/dock_serializer/recharges'

module M2yCellcoin

  # Gives access to the current Configuration.
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    config = configuration
    yield(config)
  end

  def self.with_configuration(config)
    original_config = {}

    config.each do |key, value|
      original_config[key] = configuration.send(key)
      configuration.send("#{key}=", value)
    end

    yield if block_given?
  ensure
    original_config.each { |key, value| configuration.send("#{key}=", value) }
  end

end
