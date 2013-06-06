require 'spec_helper'

describe User do
  context "it has signed in" do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "is not valid with duplicated username" do
      other_user = FactoryGirl.build(:user, :username => @user.username, :provider => @user.provider)
      other_user.should_not be_valid
    end

    it "replace username when already taken" do
      pending "don't know how to test omniauth..."
    end
  end
end
