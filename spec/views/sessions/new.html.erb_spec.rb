require 'rails_helper'

RSpec.describe "sessions/new.html.erb", type: :view do
  it 'should have a login form' do
    render

    expect(rendered).to have_selector('input', id: 'session_email')
    expect(rendered).to have_selector('input', id: 'session_password')
    expect(rendered).to have_selector('input', id: 'session_remember_me')
    expect(rendered).to have_button(value: 'Log in')
    expect(rendered).to have_link('Sign up now!', href: signup_path)
  end
end
