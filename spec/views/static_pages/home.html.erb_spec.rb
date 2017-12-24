require 'rails_helper'

RSpec.describe "static_pages/home.html.erb", type: :view do
  it 'should have a custom title' do
    render template: "static_pages/home.html.erb", layout: "layouts/application.html.erb"

    expect(rendered).to have_title(full_title('Home'))
    # turns out assert_select "title", full_title("Home") works as well
  end

  it 'should have links to other static_pages' do
    render template: "static_pages/home.html.erb", layout: "layouts/application.html.erb"

    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
end
