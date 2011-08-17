module TaxonomiesHelper
  def get_current_menu
    if @type
      @taxonomies ||= Type.find(@type).taxonomies
    else
      @taxonomies ||= Type.where(:first => true).first.taxonomies
    end
    @taxonomies.reject { |t| t.root.nil? }
  end
end