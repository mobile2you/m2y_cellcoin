module M2yCellcoin
  PROD_BASE_URL = "https://apicorp.celcoin.com.br"
  HMG_BASE_URL = "https://sandbox-apicorp.celcoin.com.br"
  HOMOLOGATION = "hml"



  TOKEN_PATH = "/v5/token"
  TOKEN_HEADERS = {"Content-Type": "application/x-www-form-urlencoded"}
  BASE_HEADERS = {"Content-Type": "application/json"}

  DEALERS_PATH = "/v5/transactions/topups/providers?stateCode=11&category=1"
  FIND_DEALER_PATH = "/v5/transactions/topups/find-providers"
  DEALER_VALUES_PATH = "/v5/transactions/topups/provider-values"
  START_RECHARGE_PATH = "/v5/transactions/topups"
  CAPTURE_RECHARGE_PATH = "/capture"
end
