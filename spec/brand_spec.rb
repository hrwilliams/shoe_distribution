require('spec_helper')

describe(Brand) do
  it("has many stores") do
    brand = Brand.create({:name => "brand"})
      store1 = Store.create({:name => "store1", :brand_id => brand.id})
      store2 = Store.create({:name => "store2", :brand_id => brand.id})
      expect(brand.stores()).to(eq([store1, store2]))
    end
  end
