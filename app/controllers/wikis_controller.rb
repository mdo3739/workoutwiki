class WikisController < ApplicationController
  def index
    @wikis = policy_scope(Wiki)
    
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.build(wiki_params)
    @wiki.user = current_user
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Saved!"
      redirect_to wikis_path
    else
      flash[:error] = "Nope"
      render :new
    end
  end

  def edit
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
  end

  def show
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(wiki_params)
      redirect_to wiki_path(@wiki)
    else
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
    if @wiki.destroy
      redirect_to wikis_path
    else
      redirect_to wiki_path(@wiki)
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private, :user)
  end
end
