USE BLOG;

CREATE TABLE BOOKSHELF(
BOOKID INT(50) Auto_Increment PRIMARY KEY,
TITLE VARCHAR (50),
AUTHOR VARCHAR (50),
PAGECOUNT INT(255)
);

INSERT INTO BOOKSHELF(TITLE,AUTHOR,PAGECOUNT)
values
("ALL","BIG",100),
("CRYSTAL","DOLL",150),
("ELEPHANT","FROG",200),
("GIT","HUB",250),
("INFINITY","JOKER",300),
("KARL","LOG",350),
("MONOPOLY","NEAT",400),
("ORANGE","PEOPLE",450),
("QUEEN","ROSE",500),
("STEAM","TOY",550),
("ULTRA","VOILET",600);

select * from bOOKSHELF
WHERE PAGECOUNT>400;

alter table bookshelf
add column status VARCHAR (50);
update bookshelf
set status = "Reading"
where BookID = 4;

delete from bookshelf
where bookid = 9;

select * from bookshelf;
