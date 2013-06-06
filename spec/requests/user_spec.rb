require 'spec_helper'

describe 'User' do
  include LoginHelpers

  context "signup" do

    it "logs user in and redirects to home upon successful signup" do
      visit new_user_url

      expect {
        fill_in 'email',    with: "test@gmail.com"
        fill_in 'password', with: "password"
        click_button "Signup"
      }.to change(User, :count).by(1)

      # page.should have_content "You have signed up successfully"
      # page.should have_content ""
    end
    
    it "displays errors on unsuccessful signup" do
      visit new_user_url
      click_button "Signup"

      # page.should have_content "Error: unsuccessful signup"
    end
  end

  context "login" do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "redirects to admin_root after successful login" do
      visit login_path
      
      fill_in 'email',   with: @user.email
      fill_in 'password', with: "password"
      click_button "Login"

      # page.should have_content "You have signed in successfully"
      # page.should have_content "" 
    end

    it "displays errors on unsuccessful login" do
      visit login_path
      click_button "Login"

      # page.should have_content "Error: unsuccessful login"
    end
  end

  context "logged in on homepage" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      user_login(@user)
    end

    it "can see the logout link" do
      page.should have_link "Logout"
    end

    it "can see the username" do
      page.should have_content @user.username
    end

    it "can not see the login link" do
      page.should_not have_link "Login"
    end

    it "can not see the signup link" do
      page.should_not have_link "Signup"
    end
  end

  context "logged out on homepage" do

    before(:each) do
      visit root_path
    end

    it "can not see the logout link" do
      page.should_not have_link "Logout"
    end

    it "can see the login link" do
      page.should have_link "Login"
    end

    it "can see the signup link" do
      page.should have_link "Signup"
    end
  end

  context "on user show page" do

    it "should probably test some stuff"

  end
end
