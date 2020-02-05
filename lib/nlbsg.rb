require "nlbsg/constants"
require "nlbsg/client"
require "nlbsg/exceptions"
require "nlbsg/version"
require "nlbsg/request"
require "nlbsg/response"

require 'savon'

module NLBSG
  def self.client(key:, env: :staging)
    @key = key
    @env = env

    return Client.new
  end

  def self.key
    @key
  end

  def self.env
    @env
  end
end
