module TaxonomiesHelper
  include TypesHelper
  
  def get_current_menu
    @taxonomies = detect_type.taxonomies
    @taxonomies.reject { |t| t.root.nil? }
  end
end