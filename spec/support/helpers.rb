module Helpers
  # POST login_path
  def log_in_as(email, password, remember_me = '1')
    post login_path, params: {
      session: {
        email: email,
        password: password,
        remember_me: remember_me
      }
    }
  end

  # PATCH user_path(user)
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

  # POST signup_path
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

  # DELETE user_path (delete user from db)
  def delete_user(user)
    delete user_path(user)
  end

  # DELETE logout_path
  def logout
    delete logout_path
  end

  # POST send reset password email
  def send_reset_password_email(email)
    post password_resets_path, params: {
      password_reset: { email: email }
    }
  end

  # PATCH user reset password
  def reset_user_password(user, password)
    patch password_reset_path(user.reset_token), {
      params: {
        email: user.email,
        user: {
          password: password,
          password_confirmation: password
        }
      }
    }
  end

  # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end

  def create_post(title = 'Some Title', content = 'Some Content')
    post posts_path, params: {
      post: {
        title: title,
        content: content
      }
    }
  end

  def delete_post(post)
    delete post_path(post)
  end

  def create_player(team, attributes)
    if attributes == 'invalid_attributes'
      team.players.create(name: '', position: '', date_of_birth: '',
                         phone_number: '')
    elsif attributes == 'valid_attributes'
      team.players.create(name: 'Player1', position: 'Forward',
                          date_of_birth: '2008-10-09', phone_number: '8051234567')
    else
      post players_path, params: {
        player: {
          name: 'Player1',
          phone_number: '8051234567',
          position: 'Forward',
          date_of_birth: '2008-10-09',
          team_id: team.id
        }
      }
    end
  end

  def delete_player(player)
    delete player_path(player)
  end
end
