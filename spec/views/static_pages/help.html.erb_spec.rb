require 'rails_helper'

RSpec.describe "static_pages/help.html.erb", type: :view do
  it "should have a custom title" do
    render template: "static_pages/help.html.erb", layout: "layouts/application.html.erb"

    expect(rendered).to have_title("Help | Foot Quinta")
  end
end
