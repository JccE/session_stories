require 'rails_helper'
require 'shoulda/matchers'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.describe User, type: :model do
  let(:valid_attributes) {
    {
      first_name: "Jimmy",
      last_name: "Jams",
      email: "j@j.com",
      password: "123qweasd",
      password_confirmation: "123qweasd"
    }
  }

  context "validations" do

    before do
      User.create(valid_attributes)
    end

    # initialize a valid user
    let(:user) { User.new(valid_attributes) }
    it "requires an email" do
      expect(user).to validate_presence_of(:email)
    end

    # what if we want it to be unique among users
    it "requires a unique email" do
      expect(user).to validate_uniqueness_of :email
    end

    it "requires a unique email (case insensitive)" do
      user.email = "J@J.CoM"
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires the email address to look like an email" do
      user.email = "jimmy"
      expect(user).to_not be_valid
    end
  end

  describe "#downcase_email" do
    it "makes the email attribute lower case" do

      user = User.new(valid_attributes.merge(email: "J@J.CoM"))

      expect{ user.downcase_email}.
      to change{ user.email }.
      from("J@J.CoM").
      to("j@j.com")
    end



    it "downcases an email before saving" do
      user = User.new(valid_attributes)
      user.email = "J@J.CoM"
      expect(user.save).to be true
      expect(user.email).to eq("j@j.com")
    end

  end

end

