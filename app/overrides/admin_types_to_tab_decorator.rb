Deface::Override.new(:virtual_path => "layouts/admin",
                     :name => "types_to_tab",
                     :insert_bottom => "[data-hook='admin_product_sub_tabs']",
                     :text => "<%= tab(:types) %>",
                     :disabled => false)