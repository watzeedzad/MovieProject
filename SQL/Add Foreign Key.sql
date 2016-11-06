/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  jiraw
 * Created: Oct 19, 2016
 */

ALTER TABLE Movie
ADD FOREIGN KEY (starringId)
REFERENCES Starring(starringId) ;

ALTER TABLE Movie
ADD FOREIGN KEY (soundtrackId)
REFERENCES Soundtrack(soundtrackId) ;

ALTER TABLE Movie
ADD FOREIGN KEY (directorId)
REFERENCES Director(directorId) ;

ALTER TABLE Movie
ADD FOREIGN KEY (awardId)
REFERENCES Award(awardId) ;

ALTER TABLE Movie
ADD FOREIGN KEY (studioId)
REFERENCES Studio(studioId) ;

ALTER TABLE Movie
ADD FOREIGN KEY (stuntManId)
REFERENCES StuntMan(stuntManId) ;

ALTER TABLE Movie
ADD FOREIGN KEY (typeMovieId)
REFERENCES TypeMovie(typeMovieId) ;

ALTER TABLE Director
ADD FOREIGN KEY (awardId)
REFERENCES Award(awardId) ;

ALTER TABLE Starring
ADD FOREIGN KEY (awardId)
REFERENCES Award(awardId) ;

ALTER TABLE Starring
ADD FOREIGN KEY (stuntManId)
REFERENCES StuntMan(stuntManId) ;
