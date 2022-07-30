package com.training.moviestar.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.training.moviestar.pojo.Movie;
import com.training.moviestar.pojo.Movie;
import com.training.moviestar.pojo.Genre;

@Controller
@RequestMapping("/moviestar")
public class HomeController {

	private final String PATH = "http://localhost:8080/api/";
	
	//Create a model to carry data to "home page" on host 8081
	@GetMapping("/home")
	public String showHomePage(Model theModel) {
		
		theModel.addAttribute("returnMovies", recieveMoviesData("movies"));
		theModel.addAttribute("returnGenres", recieveGenresData("genres"));
		
		return "home";
	}
	
	@GetMapping("/movies")
	public String searchMovieByTitle(@RequestParam("searchTitle") String theTitle,
									 Model theModel) {
		
		//Have to convert searching title with blank space to "%20" in term of getting api 
		theTitle = convertToCompatible(theTitle);
		
		Movie[]movies = recieveMoviesData("movies/" + theTitle);
		Genre[]genres = recieveGenresData("genres");
		
		theModel.addAttribute("returnMovies", movies);
		theModel.addAttribute("returnGenres", genres);
	
		System.out.println(theTitle);
		
		return "movie";
	}
	
	@GetMapping("genres")
	public String searchMovieByGenre(@RequestParam("searchGenre") String theGenre,
									 Model theModel) {
		
		theGenre = convertToCompatible(theGenre);
		
		Movie[]movies = null;
		
		if(theGenre.equalsIgnoreCase("all"))
			movies = recieveMoviesData("movies");
		else
			movies = recieveMoviesData("genres/" + theGenre);
		 
		Genre[]genres = recieveGenresData("genres");
		
		theModel.addAttribute("returnMovies", movies);
		theModel.addAttribute("returnGenres", genres);
		
		return "movie";
	}
	
	//To recieve data of Movies return from 8080 
	private Movie[] recieveMoviesData(String api) {
		
		ObjectMapper theMapper = new ObjectMapper();
		
		Movie[]movies = null;
		
		try {
			movies = theMapper.readValue(readDataFromUrl(PATH + api),
			        		              Movie[].class
			        		              );
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return movies;
	}
	
	//To recieve the data of Genres returned from 8080
	private Genre[] recieveGenresData(String api) {
		
		ObjectMapper theMapper = new ObjectMapper();
		
		Genre[]genres = null;
		
		try {
			genres = theMapper.readValue(readDataFromUrl(PATH + api),
			        		                Genre[].class
			                                );
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return genres;
	}
	
	
	//To read data from output stream returned from host 8080
	private String readDataFromUrl(String theInputURL) {
		
		StringBuilder theData = new StringBuilder();
		
		try {
			URL theURL = new URL(theInputURL);
			HttpURLConnection connetion = (HttpURLConnection) theURL.openConnection();
			connetion.setRequestMethod("GET");
			
			InputStream theInputStream = connetion.getInputStream();
			
			InputStreamReader reader = new InputStreamReader(theInputStream);
			
			BufferedReader br = new BufferedReader(reader);
			
			String line = "";
			
			while((line = br.readLine()) != null) {
				
				theData.append(line.trim());
			}
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return theData.toString();
	}
	
	//Convert to compatible string
	private String convertToCompatible(String theString) {
		theString = theString.trim().replaceAll(" +", "%20");
		
		if(theString.contains(" ")) {
			theString = theString.replace(" ", "%20");
		}
		return theString;
	}
	
}
