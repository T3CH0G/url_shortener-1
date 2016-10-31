class Url < ActiveRecord::Base
	validates :long_url, presence: true
	validates :short_url, presence: true
	validates_format_of :long_url, :with => /https?:\/\/[\S]+/

	def self.retrieve_short_url(long_url)
		@url = Url.find_by_long_url(long_url)
		if @url
			return @url.short_url
		end
	end

end
