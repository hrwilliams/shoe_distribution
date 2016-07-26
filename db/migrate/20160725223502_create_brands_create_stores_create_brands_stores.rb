class CreateBrandsCreateStoresCreateBrandsStores < ActiveRecord::Migration
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)
    end

    create_table(:brands) do |t|
      t.column(:name, :string)
    end

    create_table(:brands_stores) do |t|
      t.column(:brand_id, :integer)
      t.column(:store_id, :integer)
    end
  end
end
