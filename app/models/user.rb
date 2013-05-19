class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  				  :first_name, :last_name, :profile_name
  # attr_accessible :title, :body
  has_many :rewards

  def full_name
    first_name + " " + last_name
  end

  def redeem
    num = rand(12)
    case num
    when 0
      return self.random_reward(3).description rescue self.random_reward(2).description rescue self.random_reward(1).description
    when 1..3
      return  self.random_reward(2).description rescue self.random_reward(1).description
    when 4..11
      return self.random_reward(1).description
    end
  end


  # returns arrays with random reward of that specific size (1 = small, 2 = medium 3 = big)
  def random_reward(reward_size)
    @specific_size = []
    self.rewards.all.each do |reward|
      if reward.size == reward_size
        @specific_size << reward
      end
    end
    return @specific_size.sample
  end

  # returns array with 1 or zeros for each of the different sizes
  def size_check
    @size_check = [0,0,0]
    self.rewards.each do |reward|
      case reward.size
      when 1
        @size_check[0] = 1
      when 2
        @size_check[1] = 1
      when 3
        @size_check[2] = 1
      end
    end
    return @size_check
  end


end
