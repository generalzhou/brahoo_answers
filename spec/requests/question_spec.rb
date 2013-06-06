require 'spec_helper'

describe 'Question' do

  context "create" do
  
    it 'should create a new question'
  
    it 'should require a title'

    it 'should require a user author'

    it 'should accept a text field'

  end

  context "show page" do
    
    it 'should display the title'

    it 'should display the text'

    it 'should display the author'

    it 'should let an author click on the edit link to edit the question'

    it 'should let an author click on the delete link to delete the question'

  end

  context "homepage" do

    it 'should display the title on the homepage'

    it 'should let a user click the title to go to the show page'

    it 'should let a user click on the author name to go the authors page'

  end

  context "edit" do

    it 'should require the user to be the owner of the question'

    it 'should edit the question on form submit'

  end

  context "delete" do

    it 'should require the user to be the owner of the question'

    it 'should delete the question on button click'

  end
end
