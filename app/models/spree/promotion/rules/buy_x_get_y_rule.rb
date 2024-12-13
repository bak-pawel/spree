# app/models/spree/promotion/rules/buy_x_get_y_rule.rb
module Spree
  class Promotion
    module Rules
      class BuyXGetYRule < Spree::PromotionRule
        preference :x_product_id, :integer
        preference :y_product_id, :integer

        def eligible?(order, options = {})
          x_product = Spree::Product.find(preferred_x_product_id)
          order.line_items.any? { |line_item| line_item.product == x_product }
        end
      end
    end
  end
end
