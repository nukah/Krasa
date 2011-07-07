Admin::TaxonsController.class_eval do
  def available
	@product = load_product
	@taxons = params[:q].blank? ? Taxon.where(:parent_id => nil).all : Taxon.where('lower(name) LIKE ?', "%#{params[:q].mb_chars.downcase}%")
	@taxons.delete_if { |taxon| @product.taxons.include?(taxon) }
	respond_with(:admin, @taxons)
  end
end