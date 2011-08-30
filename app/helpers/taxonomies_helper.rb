module TaxonomiesHelper
  def get_current_menu
    if params[:type] and Type.exists?(:permalink => params[:type])
      type = Type.find_by_permalink!(params[:type])
    else
      type = Type.where(:first => true).first
    end
    @taxonomies = type.taxonomies
    @taxonomies.reject { |t| t.root.nil? }
  end
end