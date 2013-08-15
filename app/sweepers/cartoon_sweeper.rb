class CartoonSweeper < ActionController::Caching::Sweeper
	observe Cartoon

	def sweep(cartoon)
		expire_page root_path
		expire_page "/"
		FileUtils.rm_rf "public/index.html"
	end

	alias_method :after_update, :sweep
	alias_method :after_create, :sweep
	alias_method :after_destroy, :sweep
end