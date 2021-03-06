USE [News]
GO
/****** Object:  User [tuan]    Script Date: 06/25/2016 21:00:47 ******/
CREATE USER [tuan] FOR LOGIN [tuan] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 06/25/2016 21:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID_user] [int] IDENTITY(1,1) NOT NULL,
	[User_name] [nchar](50) NOT NULL,
	[User_pass] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID_user] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 06/25/2016 21:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID_cat] [int] IDENTITY(1,1) NOT NULL,
	[Cat_name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID_cat] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Cat_Update]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PRoc [dbo].[Cat_Update](
	@Cat_name nvarchar(50),
	@ID_cat int
)
As
begin
update Categories set Cat_name=@Cat_name Where Id_cat = @Id_cat
end
GO
/****** Object:  StoredProcedure [dbo].[Cat_SelectID]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Cat_SelectID](
	@idCat int
)
As
begin
select * from Categories where ID_cat = @idCat
end
GO
/****** Object:  StoredProcedure [dbo].[Cat_SelectAll]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PRoc [dbo].[Cat_SelectAll]
As
begin
select * from Categories
end
GO
/****** Object:  StoredProcedure [dbo].[Cat_Insert]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PRoc [dbo].[Cat_Insert](
	@Cat_name nvarchar(50)
)
As
begin
insert into Categories(Cat_name) Values (@Cat_name)
end
GO
/****** Object:  StoredProcedure [dbo].[Cat_Delete]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PRoc [dbo].[Cat_Delete](
	@ID_cat int
)
As
begin
delete From Categories where Id_cat=@ID_cat
end
GO
/****** Object:  StoredProcedure [dbo].[User_Update]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[User_Update](
	@User_name nchar(50),
	@User_pass nchar(50),
	@ID_user int
)
As
Begin
Update Users set User_name=@User_name, User_pass = @User_pass where ID_user=@ID_user
End
GO
/****** Object:  StoredProcedure [dbo].[User_SelectAll]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[User_SelectAll]
As
Begin
select * from Users
End
GO
/****** Object:  StoredProcedure [dbo].[User_Search]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[User_Search](
	@User_name nchar(50),
	@User_pass nchar(50)
)
As
Begin
select * from Users where User_name=@User_name and User_pass=@User_pass
End
GO
/****** Object:  StoredProcedure [dbo].[User_Insert]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[User_Insert](
	@User_name nchar(50),
	@User_pass nchar(50)
)
As
Begin
insert into Users(User_name,User_pass) values(@User_name, @User_pass)
End
GO
/****** Object:  StoredProcedure [dbo].[User_Delete]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[User_Delete](
	@ID_user int
)
As
Begin
Delete from Users where ID_user = @ID_user
End
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 06/25/2016 21:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[ID_post] [int] IDENTITY(1,1) NOT NULL,
	[Post_title] [nvarchar](200) NULL,
	[Post_content] [nvarchar](max) NULL,
	[Post_date] [datetime] NULL,
	[ID_cat] [int] NULL,
	[Post_thumb] [nvarchar](100) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ID_post] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Post_Update]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PRoc [dbo].[Post_Update](
	@ID_post int,
	@Post_title nvarchar(200),
	@Post_content nvarchar(Max)
)
As
begin
 update Posts set Post_title = @Post_title, Post_content = @Post_content where ID_post = @ID_post
end
GO
/****** Object:  StoredProcedure [dbo].[Post_slide]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Post_slide]
as
begin
select Top 5 * from Posts order by ID_post desc
end
GO
/****** Object:  StoredProcedure [dbo].[Post_SelectRandom]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Post_SelectRandom](
@idCat int
)

as
begin
select top 4 * from Posts where ID_cat = @idCat order by NEWID()
end
GO
/****** Object:  StoredProcedure [dbo].[Post_SelectIDcat]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PRoc [dbo].[Post_SelectIDcat](
	@ID_cat int
)
As
begin
select Top 5 * from Posts where ID_cat = @ID_cat order by ID_post desc
end
GO
/****** Object:  StoredProcedure [dbo].[Post_SelectID]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PRoc [dbo].[Post_SelectID](
	@ID_post int
)
As
begin
select * from Posts,Categories where ID_post = @ID_post and Posts.ID_cat = Categories.ID_cat
end
GO
/****** Object:  StoredProcedure [dbo].[Post_SelectHome]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Post_SelectHome](
	@ID_cat int
)
as
begin
select TOP 6 * from Posts,Categories where Posts.ID_cat = @ID_cat and Posts.ID_cat = Categories.ID_cat
order by ID_post desc
end
GO
/****** Object:  StoredProcedure [dbo].[Post_SelectAll]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PRoc [dbo].[Post_SelectAll]
As
begin
select * from Posts
end
GO
/****** Object:  StoredProcedure [dbo].[Post_SelectAdmin]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Post_SelectAdmin]
as
begin
select * from Posts, Categories where Posts.ID_cat = Categories.ID_cat 
end
GO
/****** Object:  StoredProcedure [dbo].[Post_Insert]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Post_Insert](
	@Post_title nvarchar(200),
	@Post_content nvarchar(MAX),
	@Post_date datetime,
	@Post_cat int,
	@Post_thumb nvarchar(100)
)
as
begin
insert into Posts(Post_title,Post_content,Post_date,ID_cat, Post_thumb) values(@Post_title,@Post_content,@Post_date,@Post_cat, @Post_thumb)
end
GO
/****** Object:  StoredProcedure [dbo].[Post_Delete]    Script Date: 06/25/2016 21:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Post_Delete] (
	@IDpost int
)
as
begin
Delete from Posts where ID_post = @IDpost
end
GO
/****** Object:  Default [DF_Table_1_ID_cat]    Script Date: 06/25/2016 21:00:41 ******/
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Table_1_ID_cat]  DEFAULT ((1)) FOR [ID_cat]
GO
/****** Object:  ForeignKey [FK_Posts_Categories]    Script Date: 06/25/2016 21:00:41 ******/
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Categories] FOREIGN KEY([ID_cat])
REFERENCES [dbo].[Categories] ([ID_cat])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Categories]
GO
