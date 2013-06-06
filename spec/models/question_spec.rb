require 'spec_helper'

describe 'Question' do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  it 'should create a new question' do
    expect { FactoryGirl.create(:question, :user => @user) }.to change(Question, :count).by(1)
  end

  it 'should require a title' do
    FactoryGirl.build(:question, :title => '', :user => @user).should_not be_valid
  end

  it 'should require a user author' do
    FactoryGirl.build(:question, :user => nil).should_not be_valid
  end


end
