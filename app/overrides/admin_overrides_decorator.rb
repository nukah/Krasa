Deface::Override.new(:virtual_path => "layouts/admin",
                     :name => "types_to_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :partial => "shared/admin_type",
                     )
Deface::Override.new(:virtual_path => "admin/products/_form",
                     :name => "remove_precision_from_price",
                     :replace => "code[erb-loud]:contains('f.text_field :price, :value => number_with_precision(@product.price, :precision => 2)')",
                     :text => '<%= f.text_field :price, :value => number_with_precision(@product.price, :precision => 0) %>'
                    )
Deface::Override.new(:virtual_path => "admin/products/_form",
                     :name => "set_default_available_on_to_now",
                     :replace => 'code[erb-loud]:contains("f.text_field :available_on, :class => \'datepicker\'")',
                     :text => "<%= f.text_field :available_on, :class => 'datepicker', :value => Time.now %>"
                    )
Deface::Override.new(:virtual_path => "products/index",
                      :name => "search_results_override",
                      :replace => 'code[erb-loud]:contains("t(:no_products_found)")',
                      :text => '<span id="search_results_not_found"><%= t(:no_products_found) %></span>'
                      )