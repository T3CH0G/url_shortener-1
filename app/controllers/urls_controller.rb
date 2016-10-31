class UrlsController < ApplicationController

	def new
	end

  def index
  end

  def create
  	@url=Url.new(valid_params)
    @url.short_url = SecureRandom.base64[0..8]
  	if @url.save
      redirect_to urls_path
    else
      @errors = @url.errors.full_messages
      render :new
    end   
	end

  private

  def valid_params
    params.require(:url).permit(:long_url)
  end



end
