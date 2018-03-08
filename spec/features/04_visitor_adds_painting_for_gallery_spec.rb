require 'rails_helper'

feature "visitors can add paintings for galleries" do
  scenario "adds a painting for a gallery successfully" do
    barnes = Gallery.create(name: "The Barnes Foundation", city: "Philadelphia", state: "PA", zip: "19130")

    visit new_gallery_painting_path(barnes)

    expect(page).to have_content "Painting Form for The Barnes Foundation"

    fill_in "Title", with: "Snow at Argenteuil"
    fill_in "Year", with: "1874"
    fill_in "Artist", with: "Claude Monet"
    click_button "Add Painting"

    expect(page.current_path).to eq(gallery_path(barnes))
    expect(page).to have_content barnes.city
    expect(page).to have_content "Painting added successfully"
    expect(page).to have_content "Snow at Argenteuil"
    expect(page).to have_content "Claude Monet"
    expect(page).to have_content "1874"
  end

  scenario "adds a painting for a gallery unsuccessfully" do
    barnes = Gallery.create(name: "The Barnes Foundation", city: "Philadelphia", state: "PA", zip: "19130")

    visit gallery_path(barnes)
    click_link "Add a Painting"

    expect(page).to have_content "Painting Form for The Barnes Foundation"

    fill_in "Title", with: "Dopest Painting"
    click_button "Add Painting"

    expect(page.current_path).to eq(new_gallery_painting_path(barnes))
    expect(page.current_path).to_not eq(gallery_path(barnes))
    expect(page).to have_content barnes.name
    expect(page).to have_content "Artist can't be blank"
    expect(page).to have_content "Year can't be blank"
  end
end
