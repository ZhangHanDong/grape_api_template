class HttpBase
  attr_accessor :host

  def initialize(host="", connection_adapter = :net_http, headers={})
    @host = host
    @connection_adapter = connection_adapter
    @headers = headers
  end

  def post(url, body={});  conn.post url, body end
  def get(url, params={}); conn.get url, params end


  def conn(default_params={})
    Faraday::Utils.default_params_encoder = Faraday::FlatParamsEncoder
    Faraday.new(:url => @host, :headers => @headers, params: default_params) do |faraday|
      faraday.request :multipart
      faraday.response :logger
      faraday.adapter  @connection_adapter
    end
  end

end
