class User < ActiveRecord::Base
  has_many :items, dependent: :destroy
  validates :name, :presence => true
  validates :last_name, :presence => true
end
