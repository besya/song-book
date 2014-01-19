class BookController < ApplicationController
  def index
  end
  def fill
    Artist.destroy_all
    Song.destroy_all
    5.times do |c|
      ar = Artist.new do |a|
        a.title = "Artist #{c}"
        a.url_alias = "artist-#{c}"
      end
      ar.save
      5.times do |n|
        sg = Song.new do |s|
          s.artist_id = ar.id
          s.title = "Song #{c} #{n}"
          s.url_alias = "song-#{c}-#{n}"
          s.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        end
        sg.save
      end
    end
    respond_to do |format|
        format.html { redirect_to artists_url, notice: 'Book was successfully filled.' }
        format.json { head :no_content }
    end
  end
  def clean
    #ActiveRecord::Base.connection.execute("DELETE FROM artists")
    #ActiveRecord::Base.connection.execute("DELETE FROM songs")
    Artist.destroy_all
    Song.destroy_all
    respond_to do |format|
        format.html { redirect_to artists_url, notice: 'Book was successfully cleaned.' }
        format.json { head :no_content }
    end
  end
end
