module LoginHelper

  def user_login(user)
    visit login_path
    fill_in 'email',   with: user.email
    fill_in 'password', with: "password"
    click_button "Login"
    visit root_url
  end

end
