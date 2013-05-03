class Reward < ActiveRecord::Base
  attr_accessible :description, :name, :size, :user_id
  belongs_to :user
  validates :description, :length => { :maximum => 140 }


  def self.test_redeem
    reward_array = []
    reward_array.push(Reward.new(name: "game", description: "Whip out your iPhone and spend 5 minutes playing Angry Birds Space", size: 3))
    reward_array.push(Reward.new(name: "candy", description: "Break off a small piece of dark chocolate. Savor it.", size: 3))
    reward_array.push(Reward.new(name: "dance", description: "Silent dance party to Gangnam Style. Go", size: 3))
    random = rand(reward_array.size)-1
    return reward_array[random]
  end

end
