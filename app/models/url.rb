class Url < ActiveRecord::Base
	validates :long_url, presence:true, :format => { :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/}
	validates :short_url, presence:true

	def retrieve_short_url(long_url)
		@url= Url.find_by(long_url: long_url)
		return @url.short_url
	end

end
