require 'test_helper'

class Admin::TypeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "create new typetax" do
        @new = TypeTaxonomy.create(:type_id => 1, :taxonomy_id => 1)
  end
end
