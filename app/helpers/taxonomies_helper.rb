module TaxonomiesHelper
  def get_current_menu
    @taxonomies = Type.find(active_type).taxonomies
    @taxonomies.reject { |t| t.root.nil? }
  end
end