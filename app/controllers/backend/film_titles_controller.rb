module Backend
	class FilmTitlesController < Backend::ApplicationController
		before_action :find_film_title, only: [:edit, :update, :destroy]

		def index
			#http://www.ibm.com/developerworks/cn/xml/x-introajaxrails/
			p 1
			p name = params[:name]
			p params[:page]
			if !name
				@film_titles = FilmTitle.page(params[:page]).order('id desc')
			else
				@film_titles = FilmTitle.page(params[:page]).where(" chinese_name like '%#{name}%' or english_name like '%#{name}%' ").order('id desc')
				render layuout: false
			end

			# respond_to do |format|
			# 	format.html
			# 	format.js
			# end
		end

		def new
			new_film_title
		end

		def create
			@film_title = FilmTitle.new(film_title_params)
			if @film_title.save
				redirect_to backend_film_titles_path, notice: '新增成功!'
			else
				new_film_title
				render action: :new
			end
		end

		def show
			p 222
		end

		def edit
		end

		def update
			if @film_title.update(film_title_params)
				redirect_to backend_film_titles_path, notice: '修改成功!'
			else
				render edit_backend_film_title_path(@film_title), notice: '修改失败!'
			end
		end
		def destroy
			notice = '删除成功!'
			if !@film_title.destroy
				notice = '删除失败!'
			end
			# redirect_to backend_film_titles_path, notice: notice

			respond_to do |format|
				format.json { render json: { IsSuccess: true } }
				# format.js
				# format.html { render 'aaaa'  }
				# format.json { head :no_content }
				# format.json { render JSON.parse('{ "abc" : 1}') }
				# format.js {render :layout => false}
				# format.js {render 'aaaa' }
			end
			# render JSON.parse('{ "abc" : 1}')

			 #render json: @film_title
		end

		def abbbbb
			respond_to do |format|
				format.json { render JSON.parse('{ "abc" : 1 }') }
			end
		end


		private
		def find_film_title
			@film_title = FilmTitle.find(params[:id])
		end

		def film_title_params
			params.require(:film_title).permit(:chinese_name, :english_name, :id)
		end

		def new_film_title
			@film_title = FilmTitle.new
		end
	end
end