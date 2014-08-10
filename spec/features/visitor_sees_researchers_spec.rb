require 'spec_helper'

feature "Visitor interacts with people page and" do
  background do
    @researcher = Fabricate(:researcher)
  end
  scenario "sees researchers" do
    visit people_path
    expect(page).to have_css 'h1', text: "People"
    expect(page).to have_css 'h5', text: @researcher.name 
    expect(page).to have_css 'p', text: @researcher.title
    page.should have_xpath("//img[@src=\"/uploads/researcher/image/#{@researcher.id}/#{File.basename(@researcher.image.url(:thumb))}\"]")
  end

  scenario "does not see hidden researcher" do
    @researcher.visible = false
    @researcher.save
    visit people_path
    expect(page).not_to have_css 'h5', text:@researcher.name
  end


  scenario "visitor clicks researcher and sees researcher details" do
    course = Fabricate(:course)
    @researcher.courses << course
    project = Fabricate(:research_project)
    @researcher.research_projects << project
    @researcher.save

    visit people_path
    find("a[href='/people/#{@researcher.id}']").click

    expect(page).to have_css 'h1', text: @researcher.name
    page.should have_xpath("//img[@src=\"/uploads/researcher/image/#{@researcher.id}/#{File.basename(@researcher.image.url)}\"]")
    expect(page).to have_css 'li', text: course.title
    expect(page).to have_css 'a', text: project.title
  end

  scenario "visitor clicks research project link on researcher details page and goes to research project page" do
    project = Fabricate(:research_project)
    @researcher.research_projects << project
    @researcher.save

    visit people_path

    find("a[href='/people/#{@researcher.id}']").click
    find("a[href='/research_projects/#{project.id}']").click
    expect(current_path).to eq("/research_projects/#{project.id}")
  end
end
