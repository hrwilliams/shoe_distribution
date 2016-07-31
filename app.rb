require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get("/") do
  erb(:index)
end

get("/brands") do
  @brands = Brand.all()
  erb(:brands)
end

get("/stores") do
  @stores = Store.all()
  erb(:stores)
end

post("/brands") do
  name = params.fetch("brand_name")
  @brand = Brand.create({:name => name})
  if @brand.save()
    redirect("/brands")
  else
    erb(:brand_errors)
  end
end

post("/stores") do
  name = params.fetch("store_name")
  @store = Store.create({:name => name})
  if @store.save()
    redirect("/stores")
  else
    erb(:store_errors)
  end
end

get("/brands/:id") do
  @brand = Brand.find(params.fetch("id").to_i())
  @stores = Store.all
  erb(:brand)
end

get("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i())
  @brands = Brand.all
  erb(:store)
end


patch("/brands/:id") do
  # name = params.fetch("name")
  store = Store.find(params.fetch("store_id").to_i())
  @brand = Brand.find(params.fetch("id").to_i())
  @brand.stores.push(store)
  # @brand.update({:name => name})
  # @brands = Brand.all()
  redirect back
end

patch("/stores/:id") do
  brand = Brand.find(params.fetch("brand_id").to_i())
  @store = Store.find(params.fetch("id").to_i())
  @store.brands.push(brand)
  redirect back
end

get('/stores/:id/edit') do
  @store = Store.find(params.fetch('id').to_i())
  erb(:store_edit)
end

patch("/stores/:id/edit") do
  name = params.fetch('name')
  # brand = Brand.find(params.fetch("brand_id").to_i())
  @store = Store.find(params.fetch("id").to_i())
  # @store.brands.push(brand)
  @store.update({:name => name})
  redirect back
end

delete('/stores/:id/delete') do
  @store = Store.find(params.fetch('id').to_i())
  @store.delete()
  @stores = Store.all()
  erb(:stores)
end
