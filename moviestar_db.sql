drop schema if exists moviestar;

CREATE SCHEMA IF NOT EXISTS moviestar;

USE moviestar;

CREATE TABLE nations(
	id int AUTO_INCREMENT,
    nation varchar(255) NOT NULL,
	
    CONSTRAINT NATION_ID_PK PRIMARY KEY(id)
)ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

CREATE TABLE movies(
	id bigint AUTO_INCREMENT,
    nation_id int,
    title varchar(255) NOT NULL,
    sm_image text,
    lg_image text,
    released_year numeric(4,0),
    descriptions text,
    rating numeric(2,1),
    duration time,
    
    CONSTRAINT MOVIE_ID_PK PRIMARY KEY(id),
    CONSTRAINT MOVIE_NATION_ID_FK FOREIGN KEY(nation_id) REFERENCES nations(id) ON DELETE NO ACTION ON UPDATE NO ACTION
    
)ENGINE=InnoDB  AUTO_INCREMENT=1000 default charset=latin1;

CREATE TABLE details(
	id bigint AUTO_INCREMENT,
    movie_id bigint,
    episode varchar(20),
	movie_link text,
    
    CONSTRAINT DETAILS_ID_PK PRIMARY KEY(id),
    CONSTRAINT DEATAILS_MOVIE_ID_FK FOREIGN KEY(movie_id) REFERENCES movies(id) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=InnoDB AUTO_INCREMENT=5000 DEFAULT CHARSET=latin1;

CREATE TABLE genres(
	id int AUTO_INCREMENT,
    genre varchar(255) NOT NULL,
	genre_image text,
    
    CONSTRAINT GENRES_ID_PK PRIMARY KEY(id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE movie_genre(
    movie_id bigint,
	genre_id int,
    
    CONSTRAINT MOGEN_ID_PK PRIMARY KEY(movie_id, genre_id),
    
    CONSTRAINT MOGEN_MOVIE_ID_FK FOREIGN KEY(movie_id) REFERENCES movies(id) ON DELETE NO ACTION ON UPDATE NO ACTION,

    CONSTRAINT MOGEN_GENRE_ID_FK FOREIGN KEY(genre_id) REFERENCES genres(id) ON DELETE NO ACTION ON UPDATE NO ACTION
    
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


insert into nations(nation) values ('America');
insert into nations(nation) values ('United Kingdom');
insert into nations(nation) values ('Korea');
insert into nations(nation) values ('Australia/New Zealand');
insert into nations(nation) values ('France');
insert into nations(nation) values ('Italy');
insert into nations(nation) values ('Netherlands');

insert into genres(genre, genre_image) values ('Crime','crime.jpg');
insert into genres(genre, genre_image) values ('Drama', 'drama.jpg');
insert into genres(genre, genre_image) values ('Musical', 'musical.jpg');
insert into genres(genre, genre_image) values ('Animation','animation.jpg'); 
insert into genres(genre, genre_image) values ('Comedy', 'comedy.jpg');
insert into genres(genre, genre_image) values ('Action', 'action.jpg');
insert into genres(genre, genre_image) values ('Thriller', 'thriller.jpg');
insert into genres(genre, genre_image) values ('Adventure','adventure.jpg');
insert into genres(genre, genre_image) values ('Romance', 'romance.jpg');
insert into genres(genre, genre_image) values ('Horror', 'horror.jpg');
insert into genres(genre, genre_image) values ('Family', 'family.jpg');
insert into genres(genre, genre_image) values ('Biography', 'biography.jpg');

insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('2:36', 2021, 7.2, 100, 'West Side Story','west_side_story.jpg','west_side_story_lg.jpg', 'An adaptation of the 1957 musical, West Side Story explores forbidden love and the rivalry between the Jets and the Sharks, two teenage street gangs of different ethnic backgrounds.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('1:49', 2021, 7.2, 100, 'Encanto','encanto.jpg','encanto_lg.jpg','A Colombian teenage girl has to face the frustration of being the only member of her family without magical powers.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('2:14', 2021, 7.3, 100, 'Cruella', 'cruella.jpg','cruella_lg.jpg','A live-action prequel feature film following a young Cruella de Vil.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('1:38', 2021, 7.3, 101, 'Belfast', 'belfast.jpg','belfast_lg.jpg','A young boy and his working-class Belfast family experience the tumultuous late 1960s.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('2:36', 2021, 8, 100, 'Dune', 'dune.jpg','dune_lg.jpg','A noble family becomes embroiled in a war for control over the galaxy''s most valuable asset while its heir becomes troubled by visions of a dark future.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('2:30', 2020, 7.3, 101, 'Tenet', 'tenet.jpg','tenet_lg.jpg','Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('1:48', 2020, 7.3, 100, 'Nomadland', 'nomadland.jpeg','nomadland_lg.jpeg', 'A woman in her sixties, after losing everything in the Great Recession, embarks on a journey through the American West, living as a van-dwelling modern-day nomad.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('1:55', 2020, 7.4, 102, 'Minari', 'minari.jpg','minari_lg.jpg', 'A Korean family starts a farm in 1980s Arkansas.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('1:40', 2020, 8, 100, 'Soul', 'soul.jpg','soul_lg.jpg', 'After landing the gig of a lifetime, a New York jazz pianist suddenly finds himself trapped in a strange land between Earth and the afterlife.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('2:06', 2021, 6.8, 103, 'The Power of the Dog', 'thepowerofthedog.jpg','thepowerofthedog_lg.jpg', 'Charismatic rancher Phil Burbank inspires fear and awe in those around him. When his brother brings home a new wife and her son, Phil torments them until he finds himself exposed to the possibility of love.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('2:02', 2019, 8.4, 100, 'Joker', 'joker.jpg','joker_lg.jpg', 'A mentally troubled stand-up comedian embarks on a downward spiral that leads to the creation of an iconic villain.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('1:51', 2021, 8, 104, 'CODA', 'coda.jpg','coda_lg.jpg', 'As a CODA (Child of Deaf Adults) Ruby is the only hearing person in her deaf family. When the family''s fishing business is threatened, Ruby finds herself torn between pursuing her passion at Berklee College of Music and her fear of abandoning her parents.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('2:10', 2017, 7.8, 105, 'Call Me by Your Name', 'callmebyyourname.jpg','callmebyyourname_lg.jpg', 'In 1980s Italy, romance blossoms between a seventeen-year-old student and the older man hired as his father''s research assistant.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('2:05', 2017, 7.4, 100, 'Darkest Hour', 'darkesthour.jpg','darkesthour_lg.jpg', 'In May 1940, the fate of World War II hangs on Winston Churchill, who must decide whether to negotiate with Adolf Hitler, or fight on knowing that it could mean the end of the British Empire.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('1:48', 2019, 7.9, 100, 'Jojo Rabbit', 'jojorabbit.jpg','jojorabbit_lg.jpg', 'A young German boy in the Hitler Youth whose hero and imaginary friend is the country''s dictator is shocked to discover that his mother is hiding a Jewish girl in their home.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('1:44', 2017, 7.7, 100, 'Get Out', 'getout.jpg','getout_lg.jpg', 'A young African-American visits his white girlfriend''s parents for the weekend, where his simmering uneasiness about their reception of him eventually reaches a boiling point.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('2:03', 2017, 7.3, 100, 'The Shape of Water', 'theshapeofwater.jpg','theshapeofwater_lg.jpg', 'At a top secret research facility in the 1960s, a lonely janitor forms a unique relationship with an amphibious creature that is being held in captivity.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('2:14', 2018, 7.9, 102, 'Bohemian Rhapsody', 'bohemianrhapsody.jpg','bohemianrhapsody_lg.jpg', 'The story of the legendary British rock band Queen and lead singer Freddie Mercury, leading up to their famous performance at Live Aid (1985).');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('2:08', 2016, 8, 100, 'La La Land', 'lalaland.jpg','lalaland_lg.jpg', 'While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations for the future.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('1:57', 2020, 7.7, 106, 'Another Round', 'anotherround.jpg','anotherround_lg.png', 'Four high-school teachers consume alcohol on a daily basis to see how it affects their social and professional lives.');
insert into movies(duration, released_year, rating, nation_id, title, sm_image, lg_image, descriptions) values ('2:17', 2016, 7.8, 100, 'Manchester by the Sea', 'manchesterbythesea.jpg','manchesterbythesea_lg.png', 'A depressed uncle is asked to take care of his teenage nephew after the boy''s father dies.');


insert into movie_genre(movie_id, genre_id) values (1000, 1);
insert into movie_genre(movie_id, genre_id) values (1000, 2);
insert into movie_genre(movie_id, genre_id) values (1000, 3);
insert into movie_genre(movie_id, genre_id) values (1001, 4);
insert into movie_genre(movie_id, genre_id) values (1001, 5);
insert into movie_genre(movie_id, genre_id) values (1002, 7);
insert into movie_genre(movie_id, genre_id) values (1002, 5);
insert into movie_genre(movie_id, genre_id) values (1002, 1);
insert into movie_genre(movie_id, genre_id) values (1003, 2);
insert into movie_genre(movie_id, genre_id) values (1004, 6);
insert into movie_genre(movie_id, genre_id) values (1004, 8);
insert into movie_genre(movie_id, genre_id) values (1004, 2);
insert into movie_genre(movie_id, genre_id) values (1005, 6);
insert into movie_genre(movie_id, genre_id) values (1005, 7);
insert into movie_genre(movie_id, genre_id) values (1006, 2);
insert into movie_genre(movie_id, genre_id) values (1007, 11);
insert into movie_genre(movie_id, genre_id) values (1007, 2);
insert into movie_genre(movie_id, genre_id) values (1008, 4);
insert into movie_genre(movie_id, genre_id) values (1008, 5);
insert into movie_genre(movie_id, genre_id) values (1008, 8);
insert into movie_genre(movie_id, genre_id) values (1009, 2);
insert into movie_genre(movie_id, genre_id) values (1009, 9);
insert into movie_genre(movie_id, genre_id) values (1010, 1);
insert into movie_genre(movie_id, genre_id) values (1010, 2);
insert into movie_genre(movie_id, genre_id) values (1010, 7);
insert into movie_genre(movie_id, genre_id) values (1011, 2);
insert into movie_genre(movie_id, genre_id) values (1011, 3);
insert into movie_genre(movie_id, genre_id) values (1011, 5);
insert into movie_genre(movie_id, genre_id) values (1012, 2);
insert into movie_genre(movie_id, genre_id) values (1012, 9);
insert into movie_genre(movie_id, genre_id) values (1013, 2);
insert into movie_genre(movie_id, genre_id) values (1013, 12);
insert into movie_genre(movie_id, genre_id) values (1014, 2);
insert into movie_genre(movie_id, genre_id) values (1014, 5);
insert into movie_genre(movie_id, genre_id) values (1015, 7);
insert into movie_genre(movie_id, genre_id) values (1015, 10);
insert into movie_genre(movie_id, genre_id) values (1016, 2);
insert into movie_genre(movie_id, genre_id) values (1016, 9);
insert into movie_genre(movie_id, genre_id) values (1017, 2);
insert into movie_genre(movie_id, genre_id) values (1017, 3);
insert into movie_genre(movie_id, genre_id) values (1018, 2);
insert into movie_genre(movie_id, genre_id) values (1018, 3);
insert into movie_genre(movie_id, genre_id) values (1018, 5);
insert into movie_genre(movie_id, genre_id) values (1019, 2);
insert into movie_genre(movie_id, genre_id) values (1019, 5);
insert into movie_genre(movie_id, genre_id) values (1020, 2);

DELIMITER \\
create procedure findAllMoviesWithGenres()
	begin
		select m.id movieId, m.title title, m.released_year releasedYear, m.descriptions descriptions, m.sm_image smImage,
			   m.lg_image lgImage, m.rating rating, m.duration duration, group_concat(g.genre separator '/') genre
		from movies m
        inner join movie_genre mg
        on m.id = mg.movie_id
        inner join genres g
        on g.id = mg.genre_id
        group by m.id;

	end \\
    
    
DELIMITER \\
create procedure findMovieWithGenreByTitle(in searchTitle varchar(255))
	begin
		select m.id movieId, m.title title, m.released_year releasedYear, m.descriptions descriptions, m.sm_image smImage,
			   m.lg_image lgImage, m.rating rating, m.duration duration, group_concat(g.genre separator '/') genre
		from movies m
        inner join movie_genre mg
        on m.id = mg.movie_id
        inner join genres g
        on g.id = mg.genre_id
        where lower(m.title) like concat('%', lower(searchTitle), '%')
        group by m.id;

	end \\
    
DELIMITER \\
create procedure findMovieWithGenreByGenre(in searchGenre varchar(255))
begin
    select *
	from (select m.id movieId, m.title title, m.released_year releasedYear, m.descriptions descriptions, m.sm_image smImage,
			     m.lg_image lgImage, m.rating rating, m.duration duration, group_concat(g.genre separator '/') genre
		  from movies m
          inner join movie_genre mg
          on m.id = mg.movie_id
          inner join genres g
          on g.id = mg.genre_id
          group by m.id) as f
	where lower(f.genre) like concat('%', lower(searchGenre), '%');
    
end \\
    
        
call findAllMoviesWithGenres();

call findMovieWithGenreByTitle('your name');

call findMovieWithGenreByGenre('family');