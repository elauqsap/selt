class Movie < ActiveRecord::Base

  def self.all_ratings
    %w(G PG PG-13 R)
  end

  def self.api_key
  	'f4702b08c0ac6ea5b51425788bb26562'
  end

  def self.find_in_tmdb(movie)
  	Tmdb::Api.key(self.api_key)
  	matching_movies = Tmdb::Movie.find("#{movie}")
    movie_arr = Array.new
    if !matching_movies.empty?
      matching_movies.each do |movie|
        movie_hash = {:tmdb_id => movie.id, :title => movie.title, :rating => self.all_ratings[Random.new.rand(0..3)], :release_date => movie.release_date}
        movie_arr.push(movie_hash)
      end
    end
    return movie_arr
  end

  def self.create_from_tmdb(tmdb_ids)
    tmdb_ids.each_key do |id|
      movie = Tmdb::Movie.detail("#{id}")
      Movie.create!(:title => movie.title, :rating => self.all_ratings[Random.new.rand(0..3)], :release_date => movie.release_date, :description => movie.overview)
    end
  end

end