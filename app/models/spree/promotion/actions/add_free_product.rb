# app/models/spree/promotion/actions/add_free_product.rb
module Spree
  class Promotion
    module Actions
      class AddFreeProduct < Spree::PromotionAction
        preference :y_product_id, :integer

        def perform(options = {})
          order = options[:order]
          y_product = Spree::Product.find(preferred_y_product_id)

          unless order.line_items.any? { |line_item| line_item.product == y_product }
            order.contents.add(variant: y_product.master, quantity: 1)
          end
        end
      end
    end
  end
end
