class Reward < ActiveRecord::Base
  attr_accessible :description, :name, :size, :user_id
  belongs_to :user
  validates :description, :length => { :maximum => 140 }
  scope :random_of_size, -> (reward_size) { where(size: reward_size).sample }


  def self.test_redeem
    reward_array = []
    reward_array.push(Reward.new(name: "game", description: "Play three rounds of Angry Birds", size: 3))
    reward_array.push(Reward.new(name: "candy", description: "Savor a small piece of dark chocolate.", size: 3))
    reward_array.push(Reward.new(name: "dance", description: "Silent dance party to Gangnam Style. Go!", size: 3))
    reward_array.push(Reward.new(name: "watch", description: "Watch one episode of Game of Thrones.", size: 3))
    reward_array.push(Reward.new(name: "massage", description: "Get on Groupon and book a massage", size: 3))
    reward_array.push(Reward.new(name: "results", description: "Check the results on your favorite team", size: 3))
    reward_array.push(Reward.new(name: "app", description: "Buy the featured game on the App Store", size: 3))
    reward_array.push(Reward.new(name: "HN", description: "Go to HN and pick & read ONE article.", size: 3))
    reward_array.push(Reward.new(name: "TED", description: "Find and watch an interesting TED talk.", size: 3))
    reward_array.push(Reward.new(name: "amazon", description: "Get one thing off your Amazon wishlist.", size: 3))
    reward_array.push(Reward.new(name: "fruit", description: "Find, prepare and eat some fresh fruit.", size: 3))
    reward_array.push(Reward.new(name: "trailer", description: "Watch the trailer for an upcoming flick.", size: 3))
    reward_array.push(Reward.new(name: "nap", description: "Find a dark place and take a 15 min nap.", size: 3))
    reward_array.push(Reward.new(name: "takeout", description: "Order takeout from your favorite restaurant.", size: 3))
    reward_array.push(Reward.new(name: "facebook", description: "Five minutes on Facebook. Set a timer.", size: 3))
    reward_array.push(Reward.new(name: "twitter", description: "Think of something snarky/clever. Tweet it.", size: 3))
    reward_array.push(Reward.new(name: "caffeine", description: "Get yourself some fresh coffee / Red Bull", size: 3))


    random = rand(reward_array.size)-1
    return reward_array[random]
  end

    #def self.random_of_size(size)
        #return self.where(size: size).sample
    #end
end
