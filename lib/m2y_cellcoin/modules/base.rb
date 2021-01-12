module M2yCellcoin

  require "httparty"

  class Base

    def self.baseUrl
      homologation?(M2yCellcoin.configuration.cellcoin_env) ? HMG_BASE_URL : PROD_BASE_URL
    end


    def self.parse_response(req, url, body, name)
      {status: req.code, content: req.parsed_response, url: url, body: body, name: name, has_error: req.code > 220}
    end

    def self.homologation?(env)
      env == HOMOLOGATION
    end

    def self.generateToken
      if tokenExpired?
        url = "#{baseUrl}#{TOKEN_PATH}"
        body = {
          grant_type: 'client_credentials',
          client_id: M2yCellcoin.configuration.client_id,
          client_secret: M2yCellcoin.configuration.client_secret
        }
        puts url
        req = HTTParty.post(url, headers: TOKEN_HEADERS, body: URI.encode_www_form(body))
        saveToken(req.parsed_response["access_token"])
      end
      token
    end

    def self.tokenExpired?
      finish_date = ENV["CELLCOIN_TOKEN_EXPIRY"]
      token.nil? || finish_date.nil? || (Time.parse(finish_date.to_s) - 500) < Time.now
    end

    def self.token
      ENV["CELLCOIN_TOKEN"]
    end

    def self.saveToken(cellcoin_token)
      if !cellcoin_token.nil?
        ENV["CELLCOIN_TOKEN"] = cellcoin_token
        # ENV["CELLCOIN_TOKEN_EXPIRY"] = Time.now.to_i + 2400
      end
    end

    def self.mainHeaders
      headers = BASE_HEADERS
      headers["Authorization"] = "Bearer #{generateToken}"
      headers
    end

  end
end
