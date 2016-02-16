class Backend::FilmActorsController < Backend::ApplicationController
  before_action :find_film_actor, only: [:edit, :update, :destroy]
  def index
    @film_actors = FilmActor.page(params[:page]).order('id desc')
  end

  def new
    new_film_actor
  end

  def create
    @film_actor = FilmActor.new(film_actor_params)
    if @film_actor.save
      redirect_to backend_film_actors_path, notice: '新增成功'
    else
      new_film_actor
      render action :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @film_actor.update(film_actor_params)
      redirect_to backend_film_actors_path, notice: '修改成功'
    else
      render edit_backend_film_actor_path(@film_actor), notice: '修改失败'
    end
  end

  def destroy
    notice = '删除成功'
    if !@film_actor.destroy
      notice = '删除失败'
    end
    redirect_to backend_film_actors_path, notice: notice
  end

  private
  def find_film_actor
    @film_actor = FilmActor.find(params[:id])
  end
  def film_actor_params
    params.require(:film_actor).permit(:actor, :id)
  end
  def new_film_actor
    @film_actor = FilmActor.new
  end

end
