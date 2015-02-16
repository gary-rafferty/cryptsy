require "cryptsy/version"
require "httparty"

module Cryptsy

  @api_base = 'https://api.cryptsy.com/api/v2'

  @api_key = nil

  def self.api_key=(api_key)
    @api_key = api_key
  end

  def self.api_key
    @api_key
  end

  def self.api_base
    @api_base
  end

  def self.get(path)
  end

  def self.post(path, data)
  end

  def self.put(path, data)
  end

  def delete(path)
  end
end
