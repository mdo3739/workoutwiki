class CollaboratorsController < ApplicationController
  def new
  	@collab = Collaborator.new
  	@wiki = Wiki.friendly.find(params[:wiki_id])
  end

  def create
  	@wiki = Wiki.friendly.find(params[:wiki_id])
  	@collab = @wiki.collaborators.build(collab_params)
  	if @collab.user = User.find_by(email: @collab.email)
  	else
  		flash[:alert] = "Invalid User"
  	end

  	if @collab.save
  		flash[:notice] = "Nice add!"
  		redirect_to new_wiki_collaborator_path
  	else
  		flash[:error] = 'Please try again'
  		redirect_to new_wiki_collaborator_path
  	end
  end

  def destroy
  	@collab = Collaborator.find(params[:id])
  	if @collab.destroy
  		flash[:notice] = "Collaborator removed"
  		redirect_to new_wiki_collaborator_path
  	else
  		flash[:error] = "There was a problem deleting. Please try again."
  		redirect_to new_wiki_collaborator_path
  	end
  end

  private

  def collab_params
  	params.require(:collaborator).permit(:user_id, :wiki_id, :email)
  end
end
