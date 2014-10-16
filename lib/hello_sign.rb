require 'hello_sign/version'
require 'hello_sign/configuration'
require 'hello_sign/client'

module HelloSign
  extend Configuration

  #
  # # If HelloSign module don't respond_to? method, then delegate it to HelloSign::Client
  # @param  method [Symbol] method name
  # @param  *args [Array] arguments passed into the method
  # @param  &block [Block] a block passed into the method
  #
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  #
  # If HelloSign module don't respond_to? method, ask HelloSign::Client whether it respond or not
  # @param  method [Symbol] method name
  #
  def self.respond_to?(method, include_all=false)
    return super || client.respond_to?(method)
  end

  private

  def self.client
    HelloSign::Client.new
  end
end
