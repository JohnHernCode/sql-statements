/*0 Select Basics*/

/*1. The example uses a WHERE clause to show the population of 'France'. 
Note that strings (pieces of text that are data) should be in 'single quotes';
Modify it to show the population of Germany*/
SELECT population FROM world
  WHERE name = 'Germany'

/*2. Checking a list The word IN allows us to check if an item is in a list. 
The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.
Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.*/
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

/*3. Which countries are not too small and not too big? 
BETWEEN allows range checking (range specified is inclusive of boundary values). 
The example below shows countries with an area of 250,000-300,000 sq. km. 
Modify it to show the country and the area for 
countries with an area between 200,000 and 250,000. */
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

/*1 SELECT name*/

/*1. You can use WHERE name LIKE 'B%' to find the countries that start with "B".
The % is a wild-card it can match any characters. 
Find the country that start with Y*/
SELECT name FROM world
  WHERE name LIKE 'Y%'

/*2. Find the countries that end with y*/
SELECT name FROM world
  WHERE name LIKE '%Y'

/*3. Luxembourg has an x - so does one other country. 
List them both. Find the countries that contain the letter x*/
SELECT name FROM world
  WHERE name LIKE '%x%'

/*4. Iceland, Switzerland end with land - but are there others? 
Find the countries that end with land*/
SELECT name FROM world
  WHERE name LIKE '%land'

/*5. Columbia starts with a C and ends with ia - there are two more like this.
Find the countries that start with C and end with ia*/
SELECT name FROM world
  WHERE name LIKE 'C%ia'

/*6. Greece has a double e - who has a double o? 
Find the country that has oo in the name*/
SELECT name FROM world
  WHERE name LIKE '%oo%'

/*7. Bahamas has three a - who else? 
Find the countries that have three or more a in the name*/
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

/*8. India and Angola have an n as the second character. 
You can use the underscore as a single character wildcard. 
SELECT name FROM world
 WHERE name LIKE '_n%'
ORDER BY name
Find the countries that have "t" as the second character.*/
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

/*9. Lesotho and Moldova both have two o characters separated by two other characters.
Find the countries that have two "o" characters separated by two others.*/
SELECT name FROM world
 WHERE name LIKE '%o__o%'

/*10. Cuba and Togo have four characters names. 
Find the countries that have exactly four characters.*/
SELECT name FROM world
 WHERE name LIKE '____'

/*11. The capital of Luxembourg is Luxembourg. 
Show all the countries where the capital is the same as the name of the country
Find the country where the name is the capital city.*/
SELECT name
  FROM world
 WHERE name LIKE capital

/*12. The capital of Mexico is Mexico City. 
Show all the countries where the capital has the country together with the word "City".
Find the country where the capital is the country plus "City".*/
SELECT name
  FROM world
 WHERE capital LIKE CONCAT(name, ' ', 'City')

/*13. Find the capital and the name where the capital includes the name of the country.*/
SELECT capital, name
  FROM world
 WHERE capital LIKE CONCAT('%', name, '%')

/*14. Find the capital and the name where the capital 
is an extension of name of the country. 
You should include Mexico City as it is 
longer than Mexico. You should not include Luxembourg 
as the capital is the same as the country. */
SELECT capital, name
  FROM world
 WHERE capital LIKE CONCAT(name, '%') AND capital <> name;

/*15. For Monaco-Ville the name is Monaco and the extension is -Ville. 
Show the name and the extension where the capital is an extension of name of the country.*/
SELECT name, REPLACE(capital, name, '') AS ext
  FROM world where capital LIKE CONCAT(name, '_%');

/*2 SELECT from World*/

/*1. Read the notes about this table. 
Observe the result of running this SQL command to show the name, 
continent and population of all countries. */
SELECT name, continent, population FROM world

/*2. How to use WHERE to filter records. 
Show the name for the countries that have a population 
of at least 200 million. 
200 million is 200000000, there are eight zeros. */
SELECT name
  FROM world
 WHERE population > 200000000

/*3. Give the name and the per capita GDP for those countries 
with a population of at least 200 million. */
SELECT name, gdp/population
FROM world
WHERE population > 200000000

/*4. Show the name and population in millions for the 
countries of the continent 'South America'. 
Divide the population by 1000000 to get population in millions. */
SELECT name, population/1000000 
FROM world
WHERE continent = 'South America';

/*5. Show the name and population for France, Germany, Italy */
SELECT name, population 
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

/*6. Show the countries which have a name that includes the word 'United' */
SELECT name 
FROM world
WHERE name LIKE '%United%';

/*7. Two ways to be big: A country is big if it has an area of 
more than 3 million sq km or it has a population of more than 250 million.
Show the countries that are big by area or big by population. 
Show name, population and area.*/
SELECT name, population, area 
FROM world
WHERE area > 3000000 OR population > 250000000;

/*8. Exclusive OR (XOR). Show the countries that are big by area 
(more than 3 million) or big by population (more than 250 million) 
but not both. Show name, population and area.
Australia has a big area but a small population, it should be included.
Indonesia has a big population but a small area, it should be included.
China has a big population and big area, it should be excluded.
United Kingdom has a small population and a small area, it should be excluded.*/
SELECT name, population, area 
FROM world
WHERE (area > 3000000 AND population < 250000000) OR (area < 3000000 AND population > 250000000);

/*9. Show the name and population in millions and the 
GDP in billions for the countries of the continent 
'South America'. Use the ROUND function to show the 
values to two decimal places.
For South America show population in millions and GDP 
in billions both to 2 decimal places.
Millions and billions
Divide by 1000000 (6 zeros) for millions. 
Divide by 1000000000 (9 zeros) for billions.*/
SELECT name, 
ROUND(population/1000000,2), ROUND(gdp/1000000000,2) AS gdp 
FROM world
WHERE continent = 'South America';

/*10. Show the name and per-capita GDP for those countries with a
GDP of at least one trillion (1000000000000; that is 12 zeros). 
Round this value to the nearest 1000.
Show per-capita GDP for the trillion dollar countries to the nearest $1000.*/
SELECT name, 
ROUND(gdp/population, -3) AS gdp 
FROM world
WHERE gdp > 1000000000000;

/*11. Greece has capital Athens. Each of the strings 'Greece', 
and 'Athens' has 6 characters.
Show the name and capital where the name and the capital have 
the same number of characters.
You can use the LENGTH function to find the number of characters 
in a string*/
SELECT name, capital
FROM world
WHERE LENGTH(name) LIKE LENGTH(capital)

/*12. The capital of Sweden is Stockholm. Both words start with the letter 'S'.
Show the name and the capital where the first letters of each match. 
Don't include countries where the name and the capital are the same word.
You can use the function LEFT to isolate the first character.
You can use <> as the NOT EQUALS operator.*/
SELECT name, capital
FROM world
WHERE LEFT(name,1) LIKE LEFT(capital,1) <> name LIKE capital

/*13. Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. 
They don't count because they have more than one word in the name. 
Find the country that has all the vowels and no spaces in its name.
You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'*/
SELECT name
FROM world
WHERE name LIKE '%A%'
AND name LIKE '%E%'
AND name LIKE '%I%'
AND name LIKE '%O%'
AND name LIKE '%U%'
AND name NOT LIKE '% %'

/*3 SELECT from Nobel*/

/*1. Change the query shown so that it displays Nobel prizes for 1950. */
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

/*2. Show who won the 1962 prize for Literature. */
SELECT winner
FROM nobel
WHERE yr = 1962 AND subject = 'Literature'

/*3. Show the year and subject that won 'Albert Einstein' his prize. */
SELECT yr, subject
FROM nobel
WHERE winner LIKE 'Albert Einstein'

/*4. Give the name of the 'Peace' winners since the year 2000, including 2000. */
SELECT winner
FROM nobel
WHERE yr >= 2000 AND subject LIKE 'Peace'

/*5. Show all details (yr, subject, winner) of the Literature 
prize winners for 1980 to 1989 inclusive. */
SELECT * FROM nobel
WHERE yr BETWEEN 1980 AND 1989 AND subject LIKE 'Literature'

/*6. Show all details of the presidential winners:

    Theodore Roosevelt
    Woodrow Wilson
    Jimmy Carter
    Barack Obama*/
SELECT yr, subject, winner 
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

/*7. Show the winners with first name John */
SELECT winner
FROM nobel
WHERE LEFT(winner, 4) LIKE 'John'

/*8. Show the year, subject, and name of Physics winners for 
1980 together with the Chemistry winners for 1984.*/
SELECT yr, subject, winner
FROM nobel
WHERE yr LIKE 1980 AND subject LIKE 'Physics' OR yr LIKE 1984 AND subject LIKE 'Chemistry'

/*9. Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine*/
SELECT yr, subject, winner
FROM nobel
WHERE yr LIKE 1980 
AND subject NOT LIKE 'Chemistry'
AND subject NOT LIKE 'Medicine'

/*10. Show year, subject, and name of people who won a 'Medicine' 
prize in an early year (before 1910, not including 1910) together 
with winners of a 'Literature' prize in a later year (after 2004, including 2004) */
SELECT yr, subject, winner
FROM nobel
WHERE yr < 1910 AND subject LIKE 'Medicine'
OR
yr >= 2004 AND subject LIKE 'Literature'

/*11. Find all details of the prize won by PETER GRÜNBERG
Non-ASCII characters
The u in his name has an umlaut. You may find this link 
useful https://en.wikipedia.org/wiki/%C3%9C#Keyboarding*/
SELECT *
FROM nobel
WHERE winner LIKE 'PETER GRÜNBERG'

/*12. Find all details of the prize won by EUGENE O'NEILL
Escaping single quotes
You can't put a single quote in a quote string directly. 
You can use two single quotes within a quoted string.*/
FROM nobel
WHERE winner LIKE 'EUGENE O''NEILL'

/*13. Knights in order
List the winners, year and subject where the winner starts with Sir. 
Show the the most recent first, then by name order.*/
SELECT winner, yr, subject
FROM nobel
WHERE LEFT(winner, 3) LIKE 'Sir' ORDER BY yr DESC 

/*14. The expression subject IN ('Chemistry','Physics') 
can be used as a value - it will be 0 or 1. 
Show the 1984 winners and subject ordered by subject and winner name; 
but list Chemistry and Physics last.*/
SELECT winner, subject
FROM nobel
WHERE yr LIKE 1984 
ORDER BY subject IN ('Physics','Chemistry'), subject, winner

/*4 SELECT within SELECT - [note: here is where I decided not to write out the whole question anymore]*/
-- 1.
SELECT name 
FROM world
WHERE population > 
(SELECT population
FROM world WHERE name LIKE 'Russia')
--2.
SELECT name
FROM world
WHERE continent LIKE 'Europe'
AND gdp/population >
(SELECT gdp/population FROM world
WHERE name='United Kingdom');
--3.
SELECT name, continent 
FROM world
WHERE continent IN
(SELECT continent 
FROM world
WHERE name='Argentina' 
OR name='Australia')
ORDER BY name;
--4.
SELECT name, population 
FROM world
WHERE population BETWEEN
(SELECT population 
FROM world
WHERE name='Canada')+1 AND
(SELECT population 
FROM world
WHERE name='Poland')-1;
--5.
SELECT name, 
CONCAT(ROUND(population*100/
(SELECT population 
FROM world 
WHERE name='Germany')), '%') 
AS population 
FROM world
WHERE continent = 'Europe';
--6.
--7.
--8.
--9.
--10.


/**/
/**/
/**/
/**/
/*5 SUM and COUNT*/
/**/
/**/
/**/
/**/
/**/
/**/
/*6 JOIN*/
/**/
/**/
/**/
/**/
/**/
/*7 More JOIN operations*/
/**/
/**/
/**/
/**/
/**/
/**/
/*8 Using Null*/
/**/
/**/
/**/
/**/
/**/
/**/
/*8+ Numeric Examples*/
/**/
/**/
/**/
/**/
/**/
/**/
/*9- Window function*/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/*9+ COVID 19*/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/*9 Self join*/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
