Deface::Override.new(:virtual_path => "products/index",
                      :name => "search_results_override",
                      :replace => 'code[erb-loud]:contains("t(:no_products_found)")',
                      :text => '<span id="search_results_not_found"><%= t(:no_products_found) %></span>')
Deface::Override.new(:virtual_path => "checkout/registration",
                     :name => "auth_header",
                     :replace => "h2:first-child",
                     :text => "<h1><%= t(:registration) %></h1>")
Deface::Override.new(:virtual_path => "checkout/registration",
                     :name => "registration_auth_form",
                     :replace => "div#registration",
                     :partial => "checkout/registration")