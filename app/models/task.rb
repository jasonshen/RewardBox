class Task < ActiveRecord::Base
	attr_accessible :content, :user_id, :reward_id, :reward_description
	belongs_to :user
	belongs_to :reward
	validates :content, length: { minimum: 5, :maximum => 140 }

	def recently
		@time = self.created_at
		if @time.to_date == Date.today
			return "Today"
		elsif @time.to_date == Date.yesterday
			return "Yesterday" + " (" +@time.strftime("%A") + ")"
		else
			return @time.strftime("%A")
		end
	end

	def created_at_day
		return self.created_at.wday
	end

end
