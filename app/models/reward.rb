class Reward < ActiveRecord::Base
  attr_accessible :description, :name, :size, :user_id
  belongs_to :user

  def self.redeem
  	offset = rand(Reward.count)
  	return Reward.first(:offset => offset)
  end

end
