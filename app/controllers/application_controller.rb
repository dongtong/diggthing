#require 'ul_link_renderer'

class ApplicationController < ActionController::Base
  include ScrapWorm
  protect_from_forgery

  private

  def after_sign_in_path_for(resource_or_scope)
  	#session[:msg] = I18n.t('devise.sessions.signed_in')
  	root_path
  end

  def after_sign_out_path_for(resource_or_scope)
  	#session[:msg] =  I18n.t('devise.sessions.signed_out')
  	root_path
  end

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
