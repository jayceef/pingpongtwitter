require 'sinatra/base'

class Application < Sinatra::Application
  # The client makes a "preflight" request (via the OPTIONS HTTP method)
  # to let us know it wants to send a "real" request next.
  #
  # It may include these headers:
  #
  #   Access-Control-Request-Headers: accept, authorization
  #   Access-Control-Request-Method: GET
  #
  # At this point we can decide whether the next request is acceptable or not.
  #
  # For every kind of response we must set the allow-origin header
  # to enable cross-site requests (CORS), otherwise it will fail
  # due to same-origin policy.
  #
  #   Access-Control-Allow-Origin: <the requester's origin>
  #
  # To finish the preflight response, we set the allow-headers
  # to let the client know we accept some headers, some methods, etc.
  # The client will then determine whether to carry on with the request
  # or not.
  #
  #   Access-Control-Allow-Headers: <headers we accept>
  #   Access-Control-Allow-Methods: <HTTP methods we support>
  #   Access-Control-Max-Age:       <do not make any preflights for N seconds>
  #
  # https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS
  AC_ALLOW_HEADERS = 'Accept, Authorization'
  AC_ALLOW_METHODS = 'GET, POST, PUT, PATCH, DELETE OPTIONS, LINK, UNLINK'
  AC_ALLOW_MAX_AGE = 10 * 60 # 10 minutes in seconds

  helpers do
    # The real request will contain the Authorization header as it
    # said in the preflight request.
    def authenticate!
      auth = request.env['HTTP_AUTHORIZATION'].to_s
      halt 403 if auth.nil? || auth.empty? # Do some custom logic here
    end
  end

  before do
    # Accept any cross-site requests from the client.
    response['Access-Control-Allow-Origin'] = request.env['HTTP_ORIGIN']

    # Do not require authentication for preflight requests.
    return if request.options?

    authenticate! # Custom helper
  end

  # Catch all preflight requests.
  options '*' do
    headers 'Access-Control-Allow-Headers' => AC_ALLOW_HEADERS,
            'Access-Control-Allow-Methods' => AC_ALLOW_METHODS,
            'Access-Control-Max-Age'       => AC_ALLOW_MAX_AGE
  end

  get '/hello' do
    # Dummy JSON
    '{ "hello": "world" }'
  end
end


