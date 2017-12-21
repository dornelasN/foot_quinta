require 'rails_helper'

RSpec.describe "static_pages/home.html.erb", type: :view do
  it 'should have a custom title' do
    render template: "static_pages/home.html.erb", layout: "layouts/application.html.erb"

    expect(rendered).to have_title('Home | Foot Quinta')
  end
end
