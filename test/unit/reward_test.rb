require 'test_helper'

class RewardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	should_belong_to :user

end
