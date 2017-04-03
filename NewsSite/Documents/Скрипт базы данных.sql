drop table News;
CREATE TABLE [dbo].[News] (
    [NewId]            INT            IDENTITY (1, 1) NOT NULL,
    [Title]            NVARCHAR (MAX) NOT NULL,
    [Date]             DATE           NOT NULL,
    [BriefDescription] NVARCHAR (MAX) NOT NULL,
    [FullText]         NVARCHAR (MAX) NOT NULL,
    [PictureUrl]       NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([NewId] ASC)
);
insert into News values (N'Новости из Сочи', '2014-02-10', N'Трехкратная олимпийская чемпионка', N'))', N'1001_Даша.jpg');
insert into News values (N'Работа', '2014-03-17', N'Вот так надо работать :)', N'))', N'1003_A13-44_1.jpg');
insert into News values (N'Google', '2014-05-11', N'It-компания', N'))', N'1005_google_logo.jpg');
insert into News values (N'Мерс', '2013-02-18', N'Хорошая машина', N'))', N'1010_4.jpg');
insert into News values (N'Огни города', '2014-01-21', N'Хотите жить в большом городе?', N'))', N'1007_1.jpg');
insert into News values (N'Природа', '2013-02-17', N'Классно там :)) ', N'))', N'1008_2.jpg');
insert into News values (N'Красиво', '2013-02-17', N'Нетронутая природа :)', N'))', N'1009_3.jpg');


