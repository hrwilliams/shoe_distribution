class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)

  before_save(:upcase_name)

  private

  define_method(:upcase_name) do
    self.name=(name().upcase())
  end
end
