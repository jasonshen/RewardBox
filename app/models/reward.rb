class Reward < ActiveRecord::Base
  attr_accessible :description, :name, :size, :user_id
  belongs_to :user
  validates :description, :length => { :maximum => 140 }

end
