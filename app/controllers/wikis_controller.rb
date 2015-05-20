class WikisController < ApplicationController
  def index
    @wikis = Wiki.all.where(private: false)
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = current_user.wikis.build(wiki_params)
    if @wiki.save
      flash[:notice] = "Saved!"
      redirect_to wikis_path
    else
      flash[:error] = "Nope"
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(wiki_params)
      redirect_to wiki_path(@wiki)
    else
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
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
