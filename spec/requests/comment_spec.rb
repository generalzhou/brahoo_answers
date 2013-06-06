describe 'Comment' do

  context "create" do
  
    it 'should create a new comment'
  
    it 'should require a user author'

    it 'should require a text field'

  end

  context "show page" do
    
    it 'should display the text'

    it 'should display the author'

    it 'should let an author click on the edit link to edit the comment'

    it 'should let an author click on the delete link to delete the comment'

  end

  context "edit" do

    it 'should require the user to be the owner of the comment'

    it 'should edit the comment on form submit'

  end

  context "delete" do

    it 'should require the user to be the owner of the comment'

    it 'should delete the comment on button click'

  end
end
