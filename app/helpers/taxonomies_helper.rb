module TaxonomiesHelper
  def get_current_menu
    @taxonomies = active_type.taxonomies
    @taxonomies.reject { |t| t.root.nil? }
  end
end