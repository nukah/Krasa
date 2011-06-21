require 'test_helper'

class TypesControllerTest < ActionController::TestCase
  test "new association" do
    @new_type = TypeTaxonomy.create(:type_id => 1, :taxonomy_id => 1)
  end
end
