require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/brands/:id/edit') do
  @brand = Brand.find(params.fetch("id").to_i())
  erb(:brand_edit)
end

patch("/brands:id") do
  description = params.fetch("name")
  @brand= Brand.find(params.fetch("id").to_i())
  @brand.update({:name => name})
  @brands = Brand.all()
  erb(:index)
end
