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
		if @udemy.update(udemy_params)
	      redirect_to root_path
	    else
	      render action: 'edit'
	    end
	end

	private

		def set_udemie
		@udemy = Udemy.find(params[:id])
	end

	def udemy_params
		 params.require(:udemy).permit(:title, :description, :count, :price, :rating, :our_rating, :contact, :done)
	end





end