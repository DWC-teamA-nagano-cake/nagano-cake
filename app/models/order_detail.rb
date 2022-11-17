class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product
  enum making_status: {can_not_start: 0, waiting_for_production: 1, production: 2, completed: 3}
end
# 0: 着手不可, 1:製作待ち, 2: 製作中, 3: 製作完了

