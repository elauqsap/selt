require 'debugger'              # optional, may be helpful
require 'open-uri'              # allows open('http://...') to return body
require 'cgi'                   # for escaping URIs
require 'nokogiri'              # XML parser
require 'active_model'          # for validations

class OracleOfBacon

  class InvalidError < RuntimeError ; end
  class NetworkError < RuntimeError ; end
  class InvalidKeyError < RuntimeError ; end

  attr_accessor :from, :to
  attr_reader :api_key, :response, :uri
  
  include ActiveModel::Validations
  validates_presence_of :from
  validates_presence_of :to
  validates_presence_of :api_key
  validate :from_does_not_equal_to

  def from_does_not_equal_to
 #   if @from == @to
 #     self.errors.add(:from, 'cannot be the same as To')
 #  end
  end

  def initialize(api_key='')
    # YOUR CODE HERE
  end

  def find_connections
    raise InvalidError unless self.valid?
    make_uri_from_arguments
    begin
      xml = URI.parse(@uri).read
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
      Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError,
      Net::ProtocolError => e
      # convert all of these into a generic OracleOfBacon::NetworkError,
      #  but keep the original error message
      raise NetworkError, e.message
    end
    @response = Response.new(xml)
  end

  def make_uri_from_arguments
    # YOUR CODE HERE: SET @uri ATTRIBUTE TO PROPERLY-ESCAPED URI
    # CONSTRUCTED FROM THE @from, @to, @api_key ARGUMENTS
  end
      
  class Response
    attr_reader :type, :data
  
    def initialize(xml)
      @doc = Nokogiri::XML(xml)
      parse_response
    end

    private

    def parse_response
      if ! @doc.xpath('/error').empty?
        parse_error_response
      elsif ! @doc.xpath('/spellcheck').empty?
        parse_spellcheck_response
      # YOUR CODE HERE: 'elsif' AND?OR 'else' CLAUSES TO HANDLE OTHER RESPONSES.
      # FOR RESPONSES NOT MATCHING THE 3 BASIC TYPES, THE RESPONSE OBJECT
      # SHOULD HAVE TYPE :unknown AND DATA 'unknown response' 
      end        
    end

    def parse_error_response
      @type = :error
      @data = 'Unauthorized access'
    end
    def parse_spellcheck_response
      @type = :spellcheck
      @data = @doc.xpath('//match').map(&:text)
      #Note: map(&:text) is same as map{|n| n.text}
    end
  end
end

