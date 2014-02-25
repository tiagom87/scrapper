class ChartsController < ApplicationController
	def index
		@udemies = Udemy.all
	end

	def show
	end
end