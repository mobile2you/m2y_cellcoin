module M2yCellcoin

  class Recharge < Base


    def self.confirmDealers
      headers = mainHeaders
      url = "#{baseUrl}#{DEALERS_PATH}"
      puts url
      req = HTTParty.get(url, headers: headers)
      DockSerializer::Dealers.dock_dealers(req.parsed_response)
    end

    def self.newRechargeOrder(ddd, phone, dealer)
      headers = mainHeaders
      url = "#{baseUrl}#{DEALER_VALUES_PATH}?stateCode=#{ddd}&providerId=#{dealer}"
      puts url
      req = HTTParty.get(url, headers: headers)
      DockSerializer::Dealers.dock_values(req.parsed_response)
    end


    def self.newRechargeSolicitation(order, body, cpf)
      headers = mainHeaders
      url = "#{baseUrl}#{START_RECHARGE_PATH}"
      puts url
      parsed_body = {
        externalTerminal: order,
        externalNsu: order,
        cpfCnpj: cpf,
        phone: {
          stateCode: body[:ddd],
          number: body[:phoneNumber],
          countryCode: 55,
        },
        topupData: {
          value: (body[:amountKey].to_f/100.0).to_i
        },
        providerId: body[:dealerCode],
        signerCode: M2yCellcoin.configuration.signer_code,
        amountKey: 5000,
        accountId: 5000
      }
      req = HTTParty.post(url, headers: headers, body: parsed_body.to_json)
      DockSerializer::Recharges.dock_recharge_start(req.parsed_response)
    end

    def self.confirmRecharge(id)
      headers = mainHeaders
      url = "#{baseUrl}#{START_RECHARGE_PATH}/#{id}#{CAPTURE_RECHARGE_PATH}"
      puts url
      body = {
        "externalNSU": id,
        "externalTerminal": "backend"
      }
      req = HTTParty.put(url, headers: headers, body: body.to_json)
      req.parsed_response
    end


  end
end
