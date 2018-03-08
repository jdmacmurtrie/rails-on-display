require 'rails_helper'


feature "visitor sees list of paintings in the gallery on the gallery show page" do
  scenario "sees reviews for specific gallery" do
    barnes = Gallery.create(name: "The Barnes Foundation", city: "Philadelphia", state: "PA", zip: "19130")
    postman = ArtPiece.create(title: "The Postman", year: "1889", artist: "Vincent can Gogh", gallery: barnes)

    visit gallery_path(barnes)

    expect(page).to have_content barnes.name
    expect(page).to have_content postman.title
    expect(page).to have_content postman.year
    expect(page).to have_content postman.artist
    expect(page).to have_content postman.created_at.strftime("%B %d %Y")
  end

  scenario "does not see other paintings for other galleries" do
    barnes = Gallery.create(name: "The Barnes Foundation", city: "Philadelphia", state: "PA", zip: "19130")
    rodin = Gallery.create(name: "The Rodin Museum", city: "Philadelphia", state: "PA", zip: "19130")
    postman = ArtPiece.create(title: "The Postman", year: "1889", artist: "Vincent can Gogh", gallery: barnes)
    adam = ArtPiece.create(title: "Adam", year: "1880", artist: "August Rodin", gallery: rodin)

    visit gallery_path(barnes)

    expect(page).to have_content barnes.name
    expect(page).to have_content postman.artist

    expect(page).not_to have_content rodin.name
    expect(page).not_to have_content adam.title
  end
end
