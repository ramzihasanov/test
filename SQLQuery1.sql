create database blogdb
use blogdb

create table Categories(
Id int  PRIMARY KEY IDENTITY,
Name nvarchar(30) not null unique,

)


create table Users(
Id int  PRIMARY KEY IDENTITY,
UserName nvarchar(30) not null unique,
FullName nvarchar(30) not null unique,
age INT check(age between 0 and 150),
)

create table Tags(
Id int  PRIMARY KEY IDENTITY,
Name nvarchar(30) not null unique,

)

create table Comments(
Id int  PRIMARY KEY IDENTITY,
content nvarchar(250) not null check(len(content) between 1 and 250),
userId  int FOREIGN KEY REFERENCES Users(Id),
blogId int FOREIGN KEY REFERENCES Blogs(Id)

)

create table Blogs(
Id int  PRIMARY KEY IDENTITY,
Title nvarchar(50) not null check(len(title) between 1 and 50),
descriptionn nvarchar(300) not null,
userId  int FOREIGN KEY REFERENCES Users(Id),
categoryId  int FOREIGN KEY REFERENCES Categories(Id),

)

create table BlogTags(
    PRIMARY KEY (blog_id, tag_id),
    blog_id INT,
    tag_id INT,
    FOREIGN KEY (blog_id) REFERENCES Blogs(Id),
    FOREIGN KEY (tag_id) REFERENCES Tags(Id)
)


select * from Blogs
select * from Users
select * from Categories
select * from Comments
select * from Tags


insert into Categories values
('cat1'),
('cat2'),
('cat3')

insert into Tags values
('tag1'),
('tag2'),
('tag3'),
('tag4'),
('tag5'),
('tag6')


insert into Users values
('re12','remzi hesenov',19),
('el234i','eli eliyev',23),
('veli234','veli iamamoglu',18),
('hesen65','elekberov',32),
('husen111','huseynov',21)



insert into Comments values
('content1',1,2),
('content2',5,3),
('content3',4,4),
('conten4',2,1),
('conten5',3,5)



insert into Blogs values
('title1','desc1',1,1),
('title2','desc2',2,1),
('title3','desc3',5,2),
('title4','desc4',3,3),
('title5','desc5',4,3)




select * from Categories
select * from Blogs
select * from Users
select * from Comments
select * from Tags


create view view1 as
select b.Title,c.Name
FROM Blogs as b
JOIN Categories as c
ON 
b.categoryId=c.Id

select * from view1

create view view2 as
select b.Title,u.UserName,u.FullName
FROM Blogs as b
JOIN Users as u
ON 
b.categoryId=u.Id

select * from view2

create procedure USR_Get_commit @userid int
AS
select c.Id, c.content
from Comments as c
where c.userId=@userid



 USR_Get_commit 1




 create procedure USR_Get_blogs @userid int
AS
select b.Id,b.Title,b.descriptionn
from Blogs as b
where b.userId=@userid



 USR_Get_blogs 1





create function GetCount(@userid int)
returns table
as
return select Blogs.Id,Blogs.Title,Blogs.descriptionn
from Blogs
join Users
on 
 Users.Id=@userid

 
