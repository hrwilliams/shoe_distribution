require("spec_helper")

describe(Store) do
  it("associaties with a brand") do
    test_brand = Brand.create({:name => "shoe brand"})
    test_store1 = Store.create({:name => "cool shoes bro"})
    test_store1.brands.push(test_brand)
    expect(test_store1.brands()).to(eq([test_brand]))
  end
end
