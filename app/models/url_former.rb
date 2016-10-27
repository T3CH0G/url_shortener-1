class Url
	attr_reader :long_url, :short_url

	def intialize(long_url,short_url)
		validate_long_url(long_url)
		@long_url = long_url
		
		if short_url =! nil
			validate_short_url(short_url)
			@short_url = short_url
			@long_url = long_url
			Url.save!(@long_url,@short_url)
		end
	end

	def retrieve_short_url(long_url)
		@url= Url.find_by(long_url: long_url)
		return @url.short_url
	end


private

  def validate_long_url(long_url)
    unless long_url.match /^((http[s]?|ftp):\/)?\/?([^:\/\s]+)((\/\w+)*\/)([\w\-\.]+[^#?\s]+)(.*)?(#[\w\-]+)?$/
      raise InvalidLongUrlError
    end
  end

  def validate_short_url(short_url)
  	unless short_url.match /^\d{0,8}$/
  		raise InvalidShortUrlError
  	end
  end


end

class InvalidLongUrlError < StandardError; end
class InvalidShortUrlError < StandardError; end