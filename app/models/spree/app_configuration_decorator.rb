Spree::AppConfiguration.class_eval do
  preference :html_invoice_logo_path, :string
  preference :print_buttons, :string
  preference :suppress_anonymous_address, :boolean, :default => true
  preference :show_price_inc_vat, :boolean, :default => false
end
Spree::Config.set(:html_invoice_logo_path => "/assets/logo.png")
Spree::Config.set(:print_buttons => "invoice,packaging_slip")
