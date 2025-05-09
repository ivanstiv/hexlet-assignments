require 'forwardable'
require 'uri'

class Url
	extend Forwardable
    include Comparable

  def initialize(url_string)
    @uri = URI.parse(url_string)
    @query_params = parse_query_params(@uri.query)
  end

  def_delegators :@uri, :scheme, :host, :port

  def query_params
    @query_params.dup.freeze
  end

  def query_param(key, default_value = nil)
    @query_params.fetch(key, default_value)
  end

 def <=>(other)
    return nil unless other.is_a?(Url)

    comparison = [
      scheme <=> other.scheme,
      host <=> other.host,
      port <=> other.port,
      query_params <=> other.query_params
    ]

    comparison.all?(&:zero?) ? 0 : nil
  end

  private

  def parse_query_params(query_string)
    return {} if query_string.nil? || query_string.empty?

    query_string.split('&').each_with_object({}) do |pair, hash|
      key, value = pair.split('=', 2)
      hash[key] = value
    end
  end
end

