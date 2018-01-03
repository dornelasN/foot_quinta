require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :view do
  it 'should display the user name and profile picture' do
    params = { name: 'Test User',
               email: 'test@email.com',
               password: 'password',
               password_confirmation: 'password',
               picture: fixture_file_upload('app/assets/images/fallback/default_profile_picture.png',
                                            'image/png') }
    assign(:user, User.new(params))

    render

    expect(rendered).to have_text('Test User')
    expect(rendered).to have_css("img[src*='png']")
  end
end
