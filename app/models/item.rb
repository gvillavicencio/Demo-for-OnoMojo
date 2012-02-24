class Item < ActiveRecord::Base
  belongs_to :user
  #validates [:name,:color,:user_id], :presence => true
  validates :name, :presence => true
  validates :color, :presence => true
  validates :user_id, :numericality => { :greater_than => 0}
end
