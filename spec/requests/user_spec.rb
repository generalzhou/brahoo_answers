require 'spec_helper'

describe 'User' do
  include LoginHelpers

  context "signup" do

    it "logs user in upon successful signup" do
      visit signup_path

      expect {
        fill_in 'user_username', with: "testuser"
        fill_in 'user_email',    with: "test@gmail.com"
        fill_in 'user_password', with: "password"
        fill_in 'user_password_confirmation', with: "password"
        click_button "Sign Up"
      }.to change(User, :count).by(1)

      page.should have_content "testuser"
    end
    
    it "displays errors on unsuccessful signup" do
      visit new_user_url
      click_button "Sign Up"

      page.should have_content "Password can't be blank"
    end
  end

  context "login" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      visit login_path
    end

    it "logs in user with proper credentials" do
      fill_in 'session_email',   with: @user.email
      fill_in 'session_password', with: "password"
      click_button "Log In"

      page.should have_content @user.username
    end

    it "displays errors on unsuccessful login" do
      click_button "Log In"

      page.should have_content "Unsuccessful login attempt!"
    end
  end

  context "navbar while logged in" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      user_login(@user)
    end

    it "should log in user" do
      page.should have_content @user.username
    end

    it "should display the logout link" do
      page.should have_link "Logout"
    end

    it "should display the username" do
      page.should have_content @user.username
    end

    it "should not display the login link" do
      page.should_not have_link "Login"
    end

    it "should not display the signup link" do
      page.should_not have_link "Signup"
    end
  end

  context "navbar while logged out" do
    before(:each) do
      visit root_path
    end

    it "should not display the logout link" do
      page.should_not have_link "Logout"
    end

    it "should display the login link" do
      page.should have_link "Login"
    end

    it "should display the signup link" do
      page.should have_link "Signup"
    end
  end

  context "on user show page" do

    it "should probably test some stuff"

  end
end
