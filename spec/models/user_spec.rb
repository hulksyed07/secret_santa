require "spec_helper"

RSpec.describe User, :type => :model do
  
  before :each do
    @user_1 = User.create(:name_email_combi => "Luke Skywalker <luke@theforce.net>")
    @user_2 = User.create(:name_email_combi => "Leia Skywalker <leia@therebellion.org>")
    @user_3 = User.create(:name_email_combi => "Toula Portokalos <toula@manhunter.org>")
    @user_4 = User.create(:name_email_combi => "Gus Portokalos <gus@weareallfruit.net>")
    @user_5 = User.create(:name_email_combi => "Bruce Wayne <bruce@imbatman.com>")
    @user_6 = User.create(:name_email_combi => "Virgil Brigman <virgil@rigworkersunion.org>")
    @user_7 = User.create(:name_email_combi => "Lindsey Brigman <lindsey@iseealiens.net>")
  end

  it "fetches the first_name of the user" do
    first_name = @user_1.first_name
    expect(first_name).to eq('Luke')
  end

  it "fetches the family_name of the user" do
    family_name = @user_1.family_name
    expect(family_name).to eq('Skywalker')
  end

  it "fetches the email of the user" do
    email = @user_1.email
    expect(email).to eq('luke@theforce.net')
  end

  it "should find the secret santa for the given user among other users" do
    secret_santa_user = @user_1.secret_santa_user
    arr = [@user_1,@user_2,@user_3,@user_4,@user_5,@user_6,@user_7]
    expect(arr).to include(secret_santa_user)
  end

  it "should verify that secret santa user is not same as the given user" do
    secret_santa_user = @user_1.secret_santa_user
    expect(secret_santa_user).not_to equal(@user_1)
  end

  it "should verify that secret santa user's family_name is not same as that of given user" do
    secret_santa_user = @user_1.secret_santa_user
    expect(secret_santa_user.family_name).not_to eql(@user_1.family_name)
  end

end