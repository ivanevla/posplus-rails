require 'spec_helper'

feature "Visitor interacts with people page and" do
  background do
    @researcher = Fabricate(:researcher)
  end
  scenario "sees researchers" do
    visit people_path
    expect(page).to have_css 'h1', text: "People"
    expect(page).to have_css 'h5', text: @researcher.name 
  end
end