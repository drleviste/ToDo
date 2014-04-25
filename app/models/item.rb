class Item < ActiveRecord::Base
  belongs_to :checklists
  validates :content, presence: true
end
