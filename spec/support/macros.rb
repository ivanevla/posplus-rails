def set_current_user(user=nil)
  session[:user_id] = (user || Fabricate(:user)).id
end
def set_current_admin(admin=nil)
  session[:user_id] = admin || Fabricate(:admin).id
end

def sign_in(a_user=nil)
  user = a_user || Fabricate(:user)
  visit signin_path
  fill_in "Email Address", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

