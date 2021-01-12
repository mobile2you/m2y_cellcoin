# frozen_string_literal: true

module M2yCellcoin
  module DockSerializer
    class Recharges

      def self.dock_recharge_start(response)
        values = []
        id = nil
        message = nil
        if !response.nil? && !response["errorCode"].nil?
          if response["errorCode"].to_i == 0
            message = "Successfully processed order. Pending recharge confirmation!!"
            id = response["transactionId"]
          end
        end
        {content: {message: message, orderId: id}}
      end


    end
  end
end
