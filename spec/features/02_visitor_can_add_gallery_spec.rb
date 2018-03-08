require "rails_helper"


feature "visitors can add galleries" do
  scenario "visitor adds new gallery successfully" do
    visit galleries_path

    click_link "Add New Gallery"

    expect(page).to have_content "New Gallery Form"

    fill_in 'Name', with: "The Barnes Foundation"
    fill_in 'City', with: "Philadelphia"
    fill_in 'State', with: "PA"
    fill_in 'Zip', with: "19130"
    fill_in 'Description', with: "Home to one of the greatest collections of impressionist paintings"

    click_button "Add Gallery"

    expect(page).to have_content "Gallery added successfully"
    expect(page).to have_content "The Barnes Foundation"
    expect(page).to have_content "Home to one of the greatest collections of impressionist paintings"
  end

  scenario "visitor does not provide proper information for an gallery" do
    visit new_gallery_path
    click_button "Add Gallery"

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "State can't be blank"
    expect(page).to have_content "Zip is the wrong length (should be 5 characters)"
  end
end
