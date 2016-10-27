class UrlsController < ApplicationController

	def new
	end

  def index
  end

  def create
  	@url=Url.new(params[:long_url],params[:short_url])
  	if @url.save
  		redirect_to :index
  	else
  		errors=@url.errors.full_messages
  		render :new
  	end
	end

end
