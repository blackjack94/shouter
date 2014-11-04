class TextShoutsController < ApplicationController
	def create
		content = build_content
		shout = current_user.shouts.build(content: content)

		unless shout.save
			flash.alert = 'Could not shout!'
		end
		redirect_to dashboard_path
	end

	private
		def build_content
			temp = TextShout.new(text_shout_params)
		end

		def text_shout_params
			params.require(:text_shout).permit(:body)
		end
end