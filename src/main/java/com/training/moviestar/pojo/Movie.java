package com.training.moviestar.pojo;

import java.sql.Time;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Movie {

	//Attributes
	private long movieId;
	private String title;
	private String descriptions;
	private int releasedYear;
	private String smImage;
	private String lgImage;
	private String genre;
	private float rating;
	private Time duration;
	
	//Constructor
	public Movie() {
		
	}

	//Getter, setter
		public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public long getMovieId() {
		return movieId;
	}

	public void setMovieId(long movieId) {
		this.movieId = movieId;
	}

	public int getReleasedYear() {
		return releasedYear;
	}

	public void setReleasedYear(int releasedYear) {
		this.releasedYear = releasedYear;
	}

	public String getSmImage() {
		return smImage;
	}

	public void setSmImage(String smImage) {
		this.smImage = smImage;
	}

	public String getLgImage() {
		return lgImage;
	}

	public void setLgImage(String lgImage) {
		this.lgImage = lgImage;
	}

	public Time getDuration() {
		return duration;
	}

	public void setDuration(Time duration) {
		this.duration = duration;
	}

	//ToString method
	@Override
	public String toString() {
		return "Movie [movieId=" + movieId + ", title=" + title + ", descriptions=" + descriptions + ", releasedYear="
				+ releasedYear + ", smImage=" + smImage + ", lgImage=" + lgImage + ", genre=" + genre + ", rating="
				+ rating + ", duration=" + duration + "]";
	}

	
	
	

	
}
