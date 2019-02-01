class SeasController < ApplicationController
  #define your controller actions here
  def index
    @seas = Sea.all
  end

  def new
    @sea = Sea.new
  end

  def create
    @seas = Sea.create(name: params[:name], temperature: params[:temperature], bio: params[:bio], image_url: params[:image_url], mood: params[:mood], favorite_color: params[:favorite_color], scariest_creature: params[:scariest_creature], has_mermaids: params[:has_mermaids])

    redirect_to "/seas/#{@seas.id}"
  end

  def show
    @sea = Sea.find(params[:id])
  end

  def edit
    @sea = Sea.find(params[:id])
  end

  def update
    @sea = Sea.find(params[:id])
    @sea.update(sea_params)

    redirect_to "/seas/#{@sea.id}"
  end

  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

  def destroy
    @sea = Sea.find(params[:id])
    @sea.delete

    redirect_to '/seas'
  end


end
