class RedesignHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_product_sub_tabs do
	"<%= tab :types, :match_path => '/types', :css_class => 'last' %>"
  end
end
