require 'rails_helper'


feature "visitor sees a list of galleries" do
  scenario "sees a list of galleries as links with no details, and a link to a new gallery form" do
    Gallery.create(name: "The Barnes Foundation", city: "Philadelphia", state: "PA", zip: "19130")
    Gallery.create(name: "The Rodin Museum", city: "Philadelphia", state: "PA", zip: "19130")

    visit galleries_path

    expect(page).to have_content "The Barnes Foundation"
    expect(page).to have_link "The Rodin Museum"
    expect(page).to_not have_content "Philadelphia"
    expect(page).to have_link "Add New Gallery"
  end

  scenario "clicks link and is taken to show page for given gallery" do
    Gallery.create(name: "The Barnes Foundation", city: "Philadelphia", state: "PA", zip: "19130", description: "Home to one of the greatest collections of impressionist paintings")

    visit root_path

    click_link "The Barnes Foundation"

    expect(page).to have_content "The Barnes Foundation"
    expect(page).to have_content "Philadelphia"
    expect(page).to have_content "PA"
    expect(page).to have_content "19130"
    expect(page).to have_content "Home to one of the greatest collections of impressionist paintings"
  end
end
