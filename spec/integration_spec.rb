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
    select("COOL SHOES BRO", :from => "store_id")
    click_button("Submit")
    expect(page).to have_content('COOL SHOES BRO')
  end
end

describe('store functionality through application', {:type => :feature}) do
  it('allows a user to add a new store') do
    visit('/')
    click_link('View Store')
    fill_in('store_name', :with => "Cool Shoes Bro")
    click_button('Add Store')
    expect(page).to have_content('COOL SHOES BRO')
  end

  it('allows a user to view details for a single store') do
    visit('/stores')
    fill_in('store_name', :with => "Cool Shoes Bro")
    click_button('Add Store')
    click_link("COOL SHOES BRO")
    expect(page).to have_content("COOL SHOES BRO")
  end

  it('allows a user to associate a brand with a store') do
    visit('/brands')
    fill_in('brand_name', :with => "Shoez")
    click_button('Add Brand')
    click_link('View Stores')
    fill_in('store_name', :with => "Cool Shoes Bro")
    click_button('Add Store')
    click_link("COOL SHOES BRO")
    select("SHOEZ", :from => "brand_id")
    click_button("Submit")
    expect(page).to have_content("SHOEZ")
  end

  it('allows the user to delete a store') do
    Store.create({:name => "Cool Shoes Bro"})
    visit('/stores')
    click_link ('here')
    click_button ('Delete Store')
    expect(page).to have_no_content('COOL SHOES BRO')
  end

  it('allows the user to edit a shoe stores name') do
    Store.create({:name => "Cool Shoes Bro"})
    visit('/stores')
    click_link ('here')
    fill_in('name', :with => "Shoe Store")
    click_button ('Update')
    expect(page).to have_content('SHOE STORE')
 end
end
