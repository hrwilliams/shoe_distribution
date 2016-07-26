require("spec_helper")

describe(Store) do
  it("has many brands") do
    test_store = Store.create({:name => "Cool Store Bro"})
    test_brand1 = Brand.create({:name => "Shoezies", :store_id => test_store.id})
    test_brand2 = Brand.create({:name => "BK Knights", :store_id => test_store.id})
    expect(test_store.brands()).to(eq([test_brand1,test_brand2]))
  end
end
