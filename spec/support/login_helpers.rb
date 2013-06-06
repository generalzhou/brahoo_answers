module LoginHelpers

  def user_login(user)
    visit login_path
    fill_in 'session_email',    with: user.email
    fill_in 'session_password', with: "password"
    click_button "Log In"
    visit root_url
  end

end
