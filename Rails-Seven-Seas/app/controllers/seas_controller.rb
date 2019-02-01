class SeasController < ApplicationController
  #define your controller actions here
  def welcome
    #code
    render "seas/welcome"
  end

  def index
    @seas = Sea.all
  end

  def show
    @sea = Sea.find(params[:id])
  end

  def new
    #code
    @sea = Sea.new
  end

  def create
    # byebug
    @sea = Sea.create(sea_params)
    redirect_to "/seas/#{@sea.id}"
  end

  def edit
    @sea = Sea.new
  end

  def update
    @sea = Sea.find(params[:sea][:id])
    @sea.update(sea_params)

    redirect_to "/seas/#{@sea.id}"
  end

  def destroy
    @sea = Sea.find(params[:sea_id])
    @sea.destroy

    redirect_to "/seas"
  end


  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
