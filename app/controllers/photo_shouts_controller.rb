class PhotoShoutsController < ApplicationController
	def create
		content = build_content
		shout = current_user.shouts.build(content: content)

		unless shout.save
			flash.alert = 'Cannot shout!'
		end
		redirect_to dashboard_path
	end

	private
		def build_content
			temp = PhotoShout.new(photo_shout_params)
		end

		def photo_shout_params
			params.require(:photo_shout).permit(:image)
		end

end