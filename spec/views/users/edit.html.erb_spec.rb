require 'rails_helper'

RSpec.describe 'users/edit.html.erb', type: :view do
  it 'should have a signup form' do
    assign(:user, User.new)

    render

    expect(rendered).to have_selector('input', id: 'user_name')
    expect(rendered).to have_selector('input', id: 'user_email')
    expect(rendered).to have_selector('input', id: 'user_password')
    expect(rendered).to have_selector('input', id: 'user_password_confirmation')
    expect(rendered).to have_field(type: :file)
    expect(rendered).to have_button(value: 'Save changes')
  end
end
