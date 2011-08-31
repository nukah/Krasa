module TaxonomiesHelper
  include TypesHelper
  
  def get_current_menu
    @type = detect_type
    @taxonomies = @type.taxonomies
    @taxonomies.reject { |t| t.root.nil? }
  end
end