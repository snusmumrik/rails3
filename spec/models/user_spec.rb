require 'spec_helper'

describe User do
  before do
    @user = FactoryGirl.create(:user)
  end

  it "is not valid without name" do
    @user.name = nil
    @user.should_not be_valid
  end

  it "is not valid without username" do
    @user.username = nil
    @user.should_not be_valid
  end

  it "is not valid with duplicated username" do
    @user2 = FactoryGirl.build(:user, :username => @user.username)
    @user2.should_not be_valid
  end
end
