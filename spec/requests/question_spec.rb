require 'spec_helper'
include LoginHelpers

describe 'Question' do


  before do
    @user = FactoryGirl.create(:user)
    user_login(@user)
    @question = FactoryGirl.create(:question, :user => @user)
  end

  context "Login" do
    it "should log in user" do
      current_path.should eq user_path(@user)
    end
  end

  context "create" do
    before do
      @question = FactoryGirl.build(:question, :user => @user)
      visit new_question_path
    end

    it 'should create a new question' do
      expect {
        fill_in 'question_title',   with: @question.title
        fill_in 'question_text',   with: @question.text
        click_button 'Ask'
      }.to change(Question, :count).by(1)
    end

  end

  context "show page" do

    before do
      visit question_path(@question)
    end

    it 'should display the title, text, and author and link to the author' do
      page.should have_content @question.title
      page.should have_content @question.text
      page.should have_link @question.user.username , href: user_path(@user)
    end

    it 'should display edit and delete links to the author' do
      page.should have_link 'edit' , href: edit_question_path(@question)
      page.should have_link 'delete' , href: question_path(@question)
    end

    it 'should not display edit and delete links to other users' do
      click_link 'Logout'
      visit question_path(@question)
      page.should_not have_link 'edit' , href: edit_question_path(@question)
      page.should_not have_link 'delete' , href: question_path(@question)
    end

  end

  context "homepage" do

    before do
      visit root_path
    end

    it 'should display the title and author links' do
      page.should have_link @question.title, href: question_path(@question)
      page.should have_link @question.user.username, href: user_path(@question.user)
    end

    it 'should let a user click the title to go to the show page' do
      click_link @question.title
      page.current_path.should eq question_path(@question)
    end

    it 'should let a user click on the author name to go the authors page' do
      click_link @user.username
      page.current_path.should eq user_path(@user)
    end
  end

  context "edit" do

    before do
      visit question_path(@question)
    end

    it 'should edit the question on form submit' do
      click_link 'edit'

      fill_in 'question_title',   with: 'new title'
      fill_in 'question_text',   with: 'new text'
      click_button 'Edit!'

      current_path.should eq question_path(@question)
      page.should have_content 'new title'
      page.should have_content 'new text'
    end

    it 'should require the user to be the author to edit the question' do
      click_link 'Logout'
      visit edit_question_path(@question)
      current_path.should eq login_path
    end
  end

  context "delete" do

    before do
      visit question_path(@question)
    end

    it 'should delete the question on button click' do
      pending
      # need to click ok on js confirmation
      title = @question.title
      text = @question.text
      click_link 'delete'

      current_path.should eq root_path
      page.should_not have_content title
      page.should_not have_content text
    end
  end
end
