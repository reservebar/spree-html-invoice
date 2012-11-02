module Spree
	module Admin
		class InvoiceController < Spree::BaseController

		  def lasku
		    template = params[:template]
		    eval "@#{template} = true"
		    @order = Order.find_by_number(params[:id])
		    #render  template , :layout => false
		    respond_to do |format|
          format.html {render :template => "spree/admin/invoice/#{template}", :layout => false}
          format.pdf {render :pdf => "#template}_#{@order.number}", :template => "spree/admin/invoice/#{template}.pdf.erb", :layout => false, :orientation => 'Landscape', :page_size => 'Letter', :show_as_html => params[:debug].present?}
        end
		  end

		end
	end
end
