class UdemiesController < ApplicationController
	before_action :set_udemie, only: [:show, :edit, :update]
	def index
		@udemies = Udemy.order("created_at ASC")
		respond_to do |format|
    		format.html
    		format.csv { send_data @pudemies.to_csv }
    		format.xls # { send_data @products.to_csv(col_sep: "\t") }
 		 end
	end

	def show
	end


	def edit
	end

	def update
		if @udemie.update(udemie_params)
	      redirect_to root_path, :gflash => { :success => "You've successfully updated this udemie" }
	    else
	      render action: 'edit'
	    end
	end

	private

	def udemie_params
		 params.require(:udemie).permit(:title, :description, :count, :price, :rating, :our_rating, :contact)
	end

	def set_udemie
		@udemie = Udemy.find(params[:id])
	end



end