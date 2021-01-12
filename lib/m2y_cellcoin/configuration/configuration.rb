# frozen_string_literal: true

module M2yCellcoin
  class Configuration

    attr_writer :client_id, :client_secret, :cellcoin_env, :signer_code

    def initialize #:nodoc:
      @client_id = nil
      @cellcoin_env = nil
      @client_secret = nil
    end

    def client_id
      @client_id
    end

    def client_secret
      @client_secret
    end

    def cellcoin_env
      @cellcoin_env
    end

    def signer_code
      @signer_code
    end

  end
end
