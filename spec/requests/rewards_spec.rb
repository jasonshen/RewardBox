require 'spec_helper'

describe "Rewards" do

	it "should have content 'RewardBox' " do
		visit "/rewards/new"
		page.should have_content('RewardBox')
	end



end
