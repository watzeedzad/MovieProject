/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  jiraw
 * Created: Nov 13, 2016
 */

SELECT mo.movieId AS "ID", mo.movieName AS "Name", mo.boxOffice AS "Box Office", mo.duration AS "Duration",
mo.rating AS "Rating", so.name AS "Soundtrack Name", CONCAT(di.firstname, " ", di.lastname) AS "Director Name",
aw.awardName AS "Award", stu.name AS "Studio", tmo.type AS "Type", CONCAT(firstname, " ", lastname) AS "Starring Name" FROM Movie mo
LEFT JOIN Soundtrack so ON so.soundtrackId = mo.soundtrackId
LEFT JOIN Director di ON di.directorId = mo.directorId
LEFT JOIN MovieAward maw ON maw.awardId = mo.movieId
LEFT JOIN Award aw ON aw.awardId = maw.awardId
LEFT JOIN Studio stu ON stu.studioId = mo.studioId
LEFT JOIN TypeMovie tmo ON tmo.typeMovieId = mo.typeMovie
LEFT JOIN MovieActor ma ON ma.movieId = mo.movieId
LEFT JOIN Starring star ON starringId = ma.starringId ;

SELECT starringId AS "ID", CONCAT(firstname, " " , lastname) AS "Starring Name", age AS "Age", street AS "Street",
`state` AS "State", city AS "City", bio AS "BIO", dob AS "Date of brith", nationality AS "Nationality", sex AS "Sex"
FROM Starring star WHERE star.starringId = 1;

SELECT so.soundtrackId AS "ID", so.`name` AS "Name", sog.genreType AS "Gerne", soc.composerName AS "Composer" FROM Soundtrack so
LEFT JOIN SoundtrackGenre sog ON so.genreId = sog.genreId
LEFT JOIN SoundtrackComposer soc ON so.composerId = soc.composerId ;

SELECT su.studioId AS "ID", su.`name` AS "Name", su.street AS "Street", su.`state` AS "State", su.zip AS "Zip", su.city AS "City"
FROM Studio su ;

SELECT maw.movieId AS "Movie ID", mo.movieName AS "Movie Name", aw.awardName AS "Award", awt.`type` AS "Award Type" FROM Award aw
LEFT JOIN MovieAward maw ON maw.awardId = aw.awardId
LEFT JOIN Movie mo ON maw.movieId = mo.movieId
LEFT JOIN AwardType awt ON aw.awardType = awt.awardTypeId WHERE mo.movieId IS NOT NULL ;

SELECT saw.starringId AS "Actor ID", CONCAT(st.firstname, " ", st.lastname) AS "Actor Name", aw.awardName AS "Award", awt.`type` AS "Award Type" FROM Award aw
LEFT JOIN StarringAward saw ON aw.awardId = saw.awardId
LEFT JOIN Starring st ON saw.starringId = st.starringId
LEFT JOIN AwardType awt ON aw.awardType = awt.awardTypeId WHERE st.starringId IS NOT NULL ;

SELECT daw.directorId AS "Director ID", CONCAT(di.firstname, " ", di.lastname) AS "Director Name", aw.awardName AS "Award", awt.`type` AS "Award Type" FROM Award aw
LEFT JOIN DirectorAward daw ON daw.awardId = aw.awardId
LEFT JOIN Director di ON di.directorId = daw.directorId
LEFT JOIN AwardType awt ON aw.awardType = awt.awardTypeId WHERE di.directorId IS NOT NULL ;