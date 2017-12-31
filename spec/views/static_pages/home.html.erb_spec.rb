require 'rails_helper'

RSpec.describe 'static_pages/home.html.erb', type: :view do
  it 'should have a custom title' do
    render template: 'static_pages/home.html.erb',
           layout: 'layouts/application.html.erb'

    expect(rendered).to have_title(full_title('Home'))
    # turns out assert_select "title", full_title("Home") works as well
  end

  it 'should have links to other static_pages' do
    render template: 'static_pages/home.html.erb',
           layout: 'layouts/application.html.erb'

    expect(rendered).to have_link('Home', href: root_path)
    expect(rendered).to have_link('sb cuervos', href: root_path)
    expect(rendered).to have_link('Help', href: help_path)
    expect(rendered).to have_link('About', href: about_path)
    expect(rendered).to have_link('Contact', href: contact_path)
  end
end
