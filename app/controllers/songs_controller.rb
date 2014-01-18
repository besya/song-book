class SongsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  def by_artist
    begin
      @artist = Artist.find params[:artist_id]
    rescue ActiveRecord::RecordNotFound
      respond_to do |format|
        format.html { redirect_to artists_url }
        format.json { head :no_content }
      end
    else
      @songs = @artist.songs
      respond_to do |format|
        format.html
        format.json { render json: @songs, action: 'index' }
      end
    end
  end
  
  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render action: 'show', status: :created, location: @song }
      else
        format.html { render action: 'new' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :url_alias, :text, :artist_id)
    end
    
    def song_artist
      params.permit(:artist_id)
    end
    
    def song_where
      params.permit(:id, :url_alias, :artist_id)
    end
    
    def record_not_found
      respond_to do |format|
        format.html { redirect_to songs_url }
        format.json { head :no_content }
      end
    end
    
end
