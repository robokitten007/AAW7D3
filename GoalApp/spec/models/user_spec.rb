require 'rails_helper'

RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

  it { should validate_uniqueness_of(:email) }
  subject(:koby) { User.create(
        email: "koby@gmail.com",
        password: "password"
    ) }

  describe "uniqueness" do
      before :each do 
          create(:user)
      end

      it { should validate_uniqueness_of(:email) }
      it { should validate_uniqueness_of(:session_token) }
  end

  describe "#is_password?" do
  # let! creates the user before each test (clears from test db after each test)
  # create(:user) is from the factory in spec/factories/users.rb
  let!(:user) { create(:user) }

  context "with valid password" do
      it "should return true" do
          expect(user.is_password?("password")).to be true
      end
  end

  context "with invalid password" do
      it "should return false" do
          expect(user.is_password?("hello_world")).to be false
      end
  end
end

describe "password encryption" do
  it "does not save password to the database" do
      create(:harry_potter)
      user = User.find_by(email: "harry@porter.com")
      expect(user.password).not_to equal("password")
      # there shouldn't be a password (not saved to db)
  end

  it "encrypts password using BCrypt" do
      expect(BCrypt::Password).to receive(:create).with("abcdef")
      # overwriting the factory's password field
      build(:user, password: "abcdef")
  end
end

end
