class UsersController < ApplicationController
	
	def show

	end

	def downgrade
		if current_user.update_attribute(:role, 'standard')
			current_user.wikis.where(private: true).each do |wiki|
				wiki.update_attributes(private: false)
			end
			flash[:notice] = "nice!"
			redirect_to wikis_path
		end
  end
end
