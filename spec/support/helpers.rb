module Helpers
  def log_in_as(email, password, remember_me = '1')
    post login_path, params: {
      session: {
        email: email,
        password: password,
        remember_me: remember_me
      }
    }
  end

  def edit_user(user, name, email, password = '', password_confirmation = '')
    patch user_path(user), params: {
      user: {
        name: name,
        email: email,
        password: password,
        password_confirmation: password_confirmation
      }
    }
  end

  def sign_up(name, email, password, password_confirmation)
    post signup_path, params: {
      user: {
        name: name,
        email: email,
        password: password,
        password_confirmation: password_confirmation
      }
    }
  end

  def logout
    delete logout_path
  end
end
