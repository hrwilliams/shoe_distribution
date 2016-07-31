require("spec_helper")

describe(Brand) do
  it("associaties with a store") do
    test_store = Store.create({:name => "cool store bro"})
    test_brand1 = Brand.create({:name => "cool shoes bro"})
    test_brand1.stores.push(test_store)
    expect(test_brand1.stores()).to(eq([test_store]))
  end

  it("converts the name to uppercase") do
    brand = Brand.create({:name => "test brand"})
    expect(brand.name()).to(eq("TEST BRAND"))
  end
end
