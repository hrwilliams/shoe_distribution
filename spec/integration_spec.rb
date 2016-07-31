require('spec_helper')

describe('brand functionality through application', {:type => :feature}) do
  it('allows a user to add a new brand') do
    visit('/')
    click_link('View Brand')
    fill_in('brand_name', :with => "Shoez")
    click_button('Add Brand')
    expect(page).to have_content('SHOEZ')
  end

  it('allows a user to view details for a single brand') do
    visit('/brands')
    fill_in('brand_name', :with => "feet hatz")
    click_button('Add Brand')
    click_link("FEET HATZ")
    expect(page).to have_content('Brand: FEET HATZ')
  end

  it('allows a user to associate a store with a brand') do
    visit('/stores')
    fill_in('store_name', :with => "Cool Shoes Bro")
    click_button('Add Store')
    click_link('View Brands')
    fill_in('brand_name', :with => "Vision Street Where?")
    click_button('Add Brand')
    click_link("VISION STREET WHERE?")
    select("Cool Shoes Bro", :from => "store_id")
    click_button("Submit")
    expect(page).to have_content('Cool Shoes Bro')
  end
end
