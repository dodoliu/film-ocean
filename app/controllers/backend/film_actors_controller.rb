class Backend::FilmActorsController < Backend::ApplicationController
  def index
    @film_actors = FilmActor.page(params[:page]).order('id desc')
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def find_film_actor
    
  end

end
