require 'rails_helper'

RSpec.describe "sessions/new.html.erb", type: :view do
  it 'should have a login form' do
    render

    expect(rendered).to have_field(type: :email)
    expect(rendered).to have_field(type: :password)
    expect(rendered).to have_button(value: 'Log in')
  end
end
