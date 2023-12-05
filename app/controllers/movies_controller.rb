class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
    @movies = Movie.all
  end
  def search
    if params[:title_search].present?
      @movies = Movie.filter_by_title(params[:title_search])
      @movies_count =@movies.count
    else
      @movies = [] # 만약 title_search속 string와 일치하는 항목이 조회 안될 경우 빈 array를 담는다.
      @movies_count='' # 조회 안될땐 아예 0도 표시 안하는 용도
    end
    
    respond_to do |format|
      format.turbo_stream do
        #render turbo_stream: turbo_stream.update("search_results", @movies.count)
        render turbo_stream: turbo_stream.update("search_results", 
                                                  partial: "movies/search_results", locals: {movies: @movies, counts: @movies_count})
        #render turbo_stream: turbo_stream.update("search_results", params[:title_search],Time.zone.now)
        # 터보스트림을통해 id="search_results" 요소로 params[:title_search] 즉 , submit한 요소를 보낸다.
      end
    end
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title)
    end
end
