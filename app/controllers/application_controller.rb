class ApplicationController < ActionController::Base
  include ScrapWorm
  protect_from_forgery

  #around_filter :retry_on_timeout
 #  rescue_from Exception, :with => :retry_on_timeout

 #  def retry_on_timeout
 #  	puts "*********"
 #    retryable(:tries =>  10, :on => Timeout::Error) do
 #      yield
 #    end
 #  end

 #  def retryable(options = {})
	#   opts = { :tries => 1, :on => Exception }.merge(options)

	#   retry_exception, retries = opts[:on], opts[:tries]

	#   begin
	#     return yield
	#   rescue retry_exception
	#     if (retries -= 1) > 0
	#       sleep 3
	#       retry 
	#     else
	#       raise
	#     end
	#   end
	# end
end