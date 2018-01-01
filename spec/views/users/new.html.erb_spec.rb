require 'rails_helper'

RSpec.describe 'users/new.html.erb', type: :view do
  it 'should have a signup form' do
    assign(:user, User.new)

    render

    expect(rendered).to have_field(type: :text)
    expect(rendered).to have_field(type: :email)
    expect(rendered).to have_field(type: :password)
    expect(rendered).to have_field(type: :file)
    expect(rendered).to have_button(value: 'Create my account')
  end
end
