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
  has_many :tasks

  def full_name
    first_name + " " + last_name
  end

  def redeem
    num = rand(12)
    case num
    when 0
      return self.random_reward(3) rescue self.random_reward(2) rescue self.random_reward(1)
    when 1..3
      return  self.random_reward(2) rescue self.random_reward(1)
    when 4..11
      return self.random_reward(1)
    end
  end


  # returns arrays with random reward of that specific size (1 = small, 2 = medium 3 = big)
  # Note that `self.rewards` is equivalent to `Reward.where(user_id: self.id)`.
  # So calling `self.rewards.random_of_size(reward_size)` is ultimately 
  # equivalent to `Reward.where(user_id: self.id).where(size: reward_size)`
  def random_reward(reward_size)
    return self.rewards.random_of_size(reward_size)
  end

  # returns array with 1 or zeros for each of the different sizes
  def size_check
    @size_check = [0,0,0]
    self.rewards.each do |reward|
      @size_check[reward.size] = 1
    end
    return @size_check
  end


  # the idea is that this returns an hash with all the tasks done this week, with :monday => an array of tasks that were done this current monday
  def current_week_tasks
    @current_week_tasks = {monday:[], tuesday:[], wednesday:[], thursday: [], friday: [], saturday:[], sunday:[]}
  end

end
