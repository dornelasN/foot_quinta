require 'rails_helper'

RSpec.describe "static_pages/contact.html.erb", type: :view do
  it "should have a custom title" do
    render template: "static_pages/contact.html.erb", layout: "layouts/application.html.erb"

    expect(rendered).to have_title(full_title('Contact'))
  end
end
