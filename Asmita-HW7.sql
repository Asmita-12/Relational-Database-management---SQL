/*Assignment no 7*/
                            /*Name : Asmita Shelke*/


/*Question 1*/
SELECT concat(city,',',statecode) AS Location,count(*) AS Count 
FROM publisher 
GROUP BY Location 
ORDER BY count(*) ASC,Location DESC;

/*Question 2*/
SELECT title,count(Rating) AS "Total Ratings",min(Rating) AS "Low",max(Rating) AS "High",avg(Rating) AS "Average"  
FROM book LEFT JOIN bookreview 
ON book.ISBN = bookreview.ISBN 
GROUP BY title 
ORDER BY count(Rating) DESC,avg(rating) DESC;

/*Question 3*/
SELECT Name AS "Publisher Name",count(book.PublisherID) AS "Book Count" 
FROM Publisher INNER JOIN book 
ON publisher.PublisherID = book.PublisherID 
GROUP BY Name 
HAVING count(book.PublisherID)>2 
ORDER BY count(book.PublisherID) DESC,Name ASC;

/*Question 4*/
SELECT title,length(title) AS "Length",substr(title,instr(title,"Bill")+4,10) AS "After Bill" 
FROM book 
WHERE title LIKE '%bill%';

/*Question 5*/
SELECT DISTINCT title 
FROM ownersbook JOIN book 
ON book.ISBN=ownersbook.ISBN;