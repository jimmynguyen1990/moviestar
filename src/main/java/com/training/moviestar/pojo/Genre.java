package com.training.moviestar.pojo;

public class Genre {

	//Attributes
	private int id;
	private String genre;
	private String genreImage;
	
	//Constructor
	public Genre() {
		
	}

	//Getter, setter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getGenreImage() {
		return genreImage;
	}

	public void setGenreImage(String genreImage) {
		this.genreImage = genreImage;
	}

	//ToString method
	@Override
	public String toString() {
		return "Genre [id=" + id + ", genre=" + genre + ", genreImage=" + genreImage + "]";
	}

	
	
	
}
