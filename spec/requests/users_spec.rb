require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title('Sign up') }
  end
end

describe User do

  before { @user = User.new(first_name: "im with", last_name: "stupid", email: "user@example.com", phone: "1234567890", password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:phone) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  describe "when email address is already taken" do
      before do
        user_with_same_email = @user.dup
        user_with_same_email.save
      end
      it { should_not be_valid }
  end
  
  describe "when password is not present" do
    before do
      @user = User.new(first_name: "im with", last_name: "stupid", email: "user2@example.com", 
            phone: "1234567890", password: " ", password_confirmation: " ")
      
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end     
  describe "return value of authenticate method" do
    @user3 = User.create(first_name: "im with", last_name: "stupid", email: "user3@example.com",  phone: "1234567890", password: "foobar", password_confirmation: "foobar")
    subject { @user3 }
    let(:found_user) { User.find_by(email: "user3@example.com") }
    #assert_equal("stupid",found_user.last_name)
    
    describe "with valid password" do
      Rails.logger.debug @user3
      Rails.logger.debug @found_user
       it { should eq found_user.authenticate("foobar") }
     end
  
    describe "with invalid password" do
        let(:user_for_invalid_password) { found_user.authenticate("invalid") }
        it { should_not eq user_for_invalid_password }
        specify { expect(user_for_invalid_password).to be_false }
      end
       
      
  
  end  
  
end