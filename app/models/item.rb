class Item < ActiveRecord::Base
  belongs_to :checklists, dependent: :destroy
end
