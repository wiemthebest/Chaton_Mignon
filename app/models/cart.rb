class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy
    
    def add_item(item)
        item = cart_items.find_by(item: item)
    end

    def add_product(product)
        item = line_items.find_by(item: item)
      
        if item
          item.quantity += 1
        else
          item = line_items.new(item: item)
        end
      
        item
      end

      def total
        line_items.to_a.sum(&:total)
      end
end
