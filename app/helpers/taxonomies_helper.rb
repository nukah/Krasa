module TaxonomiesHelper
  def get_current_menu
    if current_page?(:root)
      @taxonomies = Type.where(:first => true).taxonomies
  end
end