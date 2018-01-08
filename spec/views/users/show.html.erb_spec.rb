require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :view do
  it 'should display the user name and profile picture' do
    assign(:user, create(:user))
    # user = create(:user)
    render

    expect(rendered).to have_text('Test User')
    expect(rendered).to have_css("img[src*='png']")
  end
end
