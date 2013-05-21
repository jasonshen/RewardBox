class Task < ActiveRecord::Base
	attr_accessible :content, :user_id, :reward_id, :reward_description
	belongs_to :user, :reward
end
