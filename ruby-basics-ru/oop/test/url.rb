# frozen_string_literal: true

# BEGIN
require 'uri'

class Url
  attr_reader :scheme, :host, :port, :query_params

  def initialize(url)
    uri = URI.parse(url)
    @scheme = uri.scheme
    @host = uri.host
    @port = uri.port
    
    @query_params = {}
    if uri.query
      uri.query.split('&').each do |pair|
        key, value = pair.split('=')
        @query_params[key.to_sym] = value
      end
    end
  end

  def query_param(key, default_value = nil)
    @query_params.fetch(key, default_value)
  end

  def ==(other)
    return false unless scheme == other.scheme && host == other.host && port == other.port
    query_params == other.query_params
  end
end

  
   


# END
