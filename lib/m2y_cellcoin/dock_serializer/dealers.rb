# frozen_string_literal: true

module M2yCellcoin
  module DockSerializer
    class Dealers

      def self.dock_dealers(array)
        dealers = []
        if !array.nil? && !array["providers"].nil?
          array["providers"].each do |provider|
            if !provider["name"].downcase.include?("fixo")
              dealers << {"name": provider["name"], "code": provider["providerId"]}
            end
          end
        end
        {content: {dealers: dealers}}
      end

      def self.dock_values(array)
        values = []
        if !array.nil? && !array["value"].nil?
          json_values = []
          array["value"].each do |value|
            json_values << {
              "message": value["productName"],
              "bonus": "",
              "amount": (value["minValue"] * 100).to_i,
              "amount_key": (value["minValue"] * 100).to_i,
              "bonus_in_percentage": "",
              "payment_amount": "",
              "bonus_category": "",
              "expiry_date": "",
              "bonus_expiry_date": ""
            }
          end
          values << {"code": "",
                     "description": "",
                     "amount_ranges": [],
                     "fixed_amounts": json_values
                    }
        end
        {content: {orderId: "XXXX",  options: values}}
      end


    end
  end
end
