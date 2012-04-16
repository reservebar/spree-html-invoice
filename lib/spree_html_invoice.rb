module HtmlInvoice
  class Engine < Rails::Engine
    

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
      Deface::Override.new(:virtual_path => "spree/admin/shared/_order_tabs",
                           :name => "Add buttons to sidebar on order show",
                           :insert_after => ".sidebar",
                           :partial => "spree/admin/orders/html_buttons",
                           :disabled => false)

    end

    config.to_prepare &method(:activate).to_proc
  end
end
