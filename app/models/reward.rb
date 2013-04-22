class Reward < ActiveRecord::Base
  attr_accessible :description, :name, :size, :user_id
  belongs_to :user
  validates :description, :length => { :maximum => 140 }

  def self.redeem
  	offset = rand(Reward.count)
  	return Reward.first(:offset => offset)
  end

end
