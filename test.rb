require 'm2y_cellcoin'

M2yCellcoin.configure do |config|
  config.cellcoin_env  = "hml"
  config.signer_code = "1234"
  config.client_id = "41b44ab9a56440.teste.celcoinapi.v5"
  config.client_secret = "e9d15cde33024c1494de7480e69b7a18c09d7cd25a8446839b3be82a56a044a3"
end


p M2yCellcoin::Recharge.confirmDealers

body = {
  ddd: "11",
  phoneNumber: "987420456",
  dealerCode: "2087"
}

p M2yCellcoin::Recharge.newRechargeOrder(body[:ddd], body[:phoneNumber], body[:dealerCode])


parsedParams = {
  ddd: "11",
  phoneNumber: "987420456",
  dealerCode: "2087",
  amount: 5000,
  amountKey: 5000,
  accountId: 5000
}

orderId = Time.now.to_i
cpf = "42101654091"

order = M2yCellcoin::Recharge.newRechargeSolicitation(orderId, parsedParams, cpf)
p order

p M2yCellcoin::Recharge.confirmRecharge(order[:content][:orderId])

