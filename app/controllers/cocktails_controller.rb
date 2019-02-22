class CocktailsController < ApplicationController
  def index
    @cocktail = Cocktail.new
    params['query'].nil? ? @cocktails = Cocktail.all : @cocktails = Cocktail.where("name LIKE '%#{params['query']}%'")
    @query = params['query']
    @total = Cocktail.all.length
    @search_msg = ""
    unless @query.nil?
      @search_msg = "You searched for #{@query}. We found #{@cocktails.length} flats out of #{@total}"
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :image)
  end
end
