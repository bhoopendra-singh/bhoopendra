class Offer < ApplicationRecord
  attr_accessor :food_items_ids
  enum status: [:active, :inactive]
  has_and_belongs_to_many :food_items, dependent: :destroy
  validates :start_time, :end_time, :title, :status, presence: true
  after_save :add_food_items

  def add_food_items
    self.food_items_ids.each do |id|
      unless self.food_items.pluck(:id).include?(id.to_i) 
        self.food_items << FoodItem.find(id)
      end
    end   
  end  
end
