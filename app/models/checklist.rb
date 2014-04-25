class Checklist < ActiveRecord::Base

  has_many :items, dependent: :destroy 
  validates :title, presence: true

end
