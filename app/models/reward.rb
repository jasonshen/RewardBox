class Reward < ActiveRecord::Base
  attr_accessible :description, :name, :size

  def self.redeem
  	return Reward.find_by_id(rand(Reward.count)+1)
  end

end
