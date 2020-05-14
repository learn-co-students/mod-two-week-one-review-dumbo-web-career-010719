class SeasController < ApplicationController
  #define your controller actions here
  def index
    @seas = Sea.all
    render :index
  end

  def new
    render :new
  end

  def show
    @sea = Sea.find(params[:id])
    render :show
  end

  def create
    @sea = Sea.new(sea_params)

    @sea.save
    redirect_to "/seas/#{@sea.id}"
  end

  def edit
    @sea = Sea.find(params[:id])
    # @sea = Sea.all
    render :edit
  end

  def update

    @sea = Sea.find(params[:id])
    params[:sea][:has_mermaids] ||= false
    @sea.update(sea_params)
    redirect_to "/seas/#{@sea.id}"
  end

  def destroy
    @sea = Sea.find(params[:id])
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
