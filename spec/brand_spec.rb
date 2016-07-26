require("spec_helper")

describe(Brand) do
  it("associaties with a store") do
    test_store = Store.create({:name => "cool store bro"})
    test_employee1 = Brand.create({:name => "cool shoes bro", :store_id => test_store.id})
    expect(test_store.brands()).to(eq([test_brand1]))
  end
end
