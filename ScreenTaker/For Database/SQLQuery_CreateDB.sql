begin try
begin tran
CREATE TABLE Folder
(
	id int  NOT NULL ,
	name varchar(max)  NOT NULL ,
	ownerId integer  NOT NULL ,
	isPublic bit  NOT NULL DEFAULT 0,
	sharedCode varchar(max)  NOT NULL ,
	publicationDate datetime NOT NULL
)


ALTER TABLE Folder DROP COLUMN id 
ALTER TABLE Folder ADD id INT IDENTITY(1,1)

ALTER TABLE Folder
	ADD CONSTRAINT XPKfolder PRIMARY KEY  CLUSTERED (id ASC)



CREATE TABLE GroupMember
(
	id integer  NOT NULL ,
	groupId integer  NOT NULL ,
	personMemberId integer  NOT NULL 
)


ALTER TABLE GroupMember DROP COLUMN id 
ALTER TABLE GroupMember ADD id INT IDENTITY(1,1)

ALTER TABLE GroupMember
	ADD CONSTRAINT XPKgroupMember PRIMARY KEY  CLUSTERED (id ASC)



CREATE TABLE GroupShare
(
	id integer  NOT NULL ,
	groupId integer  NOT NULL ,
	folderId int  NULL ,
	imageId int  NULL 
)


ALTER TABLE GroupShare DROP COLUMN id 
ALTER TABLE GroupShare ADD id INT IDENTITY(1,1)

ALTER TABLE GroupShare
	ADD CONSTRAINT XPKfolderGroup PRIMARY KEY  CLUSTERED (id ASC)



CREATE TABLE Image
(
	id integer  NOT NULL ,
	folderId int  NOT NULL ,
	isPublic bit  NOT NULL ,
	sharedCode varchar(max)  NOT NULL ,
	name varchar(max)  NOT NULL ,
	publicationDate datetime  DEFAULT GETDATE()  
)


ALTER TABLE Image DROP COLUMN id 
ALTER TABLE Image ADD id INT IDENTITY(1,1)


ALTER TABLE Image
	ADD CONSTRAINT XPKimage PRIMARY KEY  CLUSTERED (id ASC)



CREATE TABLE ImageTag
(
	imageId integer  NOT NULL ,
	tagId integer  NOT NULL 
)



ALTER TABLE ImageTag
	ADD CONSTRAINT XPKimageTag PRIMARY KEY  CLUSTERED (imageId ASC,tagId ASC)



CREATE TABLE Person
(
	id integer  NOT NULL ,
	email varchar(max)  NOT NULL ,
	personImageName varchar(max) DEFAULT 'avatar.png' ,
	isActive bit  NOT NULL ,
	passwordHash varbinary(128)  NOT NULL ,
	salt varchar(20)  NOT NULL ,
	registartionDate datetime  DEFAULT GETDATE() 
)


ALTER TABLE Person DROP COLUMN id 
ALTER TABLE Person ADD id INT IDENTITY(1,1)

ALTER TABLE Person
	ADD CONSTRAINT XPKuser PRIMARY KEY  CLUSTERED (id ASC)



CREATE TABLE PersonGroup
(
	id integer  NOT NULL ,
	name varchar(max)  NOT NULL ,
	personId integer  NULL 
)


ALTER TABLE PersonGroup DROP COLUMN id 
ALTER TABLE PersonGroup ADD id INT IDENTITY(1,1)

ALTER TABLE PersonGroup
	ADD CONSTRAINT XPKgroup PRIMARY KEY  CLUSTERED (id ASC)



CREATE TABLE Tag
(
	id integer  NOT NULL ,
	name varchar(max)  NOT NULL ,
	personId integer  NOT NULL 
)


ALTER TABLE Tag DROP COLUMN id 
ALTER TABLE Tag ADD id INT IDENTITY(1,1)

ALTER TABLE Tag
	ADD CONSTRAINT XPKtag PRIMARY KEY  CLUSTERED (id ASC)



CREATE TABLE UserShare
(
	id integer  NOT NULL ,
	personId integer  NULL ,
	imageId integer  NULL ,
	folderId int  NULL ,
	email varchar(max)  NULL 
)


ALTER TABLE UserShare DROP COLUMN id 
ALTER TABLE UserShare ADD id INT IDENTITY(1,1)

ALTER TABLE UserShare
	ADD CONSTRAINT XPKsharedUser PRIMARY KEY  CLUSTERED (id ASC)




ALTER TABLE Folder
	ADD CONSTRAINT  R_16 FOREIGN KEY (ownerId) REFERENCES Person(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION




ALTER TABLE GroupMember
	ADD CONSTRAINT  R_37 FOREIGN KEY (personMemberId) REFERENCES Person(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION


ALTER TABLE GroupMember
	ADD CONSTRAINT  R_36 FOREIGN KEY (groupId) REFERENCES PersonGroup(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION




ALTER TABLE GroupShare
	ADD CONSTRAINT  R_22 FOREIGN KEY (groupId) REFERENCES PersonGroup(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION


ALTER TABLE GroupShare
	ADD CONSTRAINT  R_23 FOREIGN KEY (folderId) REFERENCES Folder(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION


ALTER TABLE GroupShare
	ADD CONSTRAINT  R_24 FOREIGN KEY (imageId) REFERENCES Image(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION




ALTER TABLE Image
	ADD CONSTRAINT  R_19 FOREIGN KEY (folderId) REFERENCES Folder(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION




ALTER TABLE ImageTag
	ADD CONSTRAINT  R_33 FOREIGN KEY (imageId) REFERENCES Image(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION


ALTER TABLE ImageTag
	ADD CONSTRAINT  R_34 FOREIGN KEY (tagId) REFERENCES Tag(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION




ALTER TABLE PersonGroup
	ADD CONSTRAINT  R_20 FOREIGN KEY (personId) REFERENCES Person(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION




ALTER TABLE Tag
	ADD CONSTRAINT  R_35 FOREIGN KEY (personId) REFERENCES Person(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION




ALTER TABLE UserShare
	ADD CONSTRAINT  R_25 FOREIGN KEY (personId) REFERENCES Person(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION


ALTER TABLE UserShare
	ADD CONSTRAINT  R_26 FOREIGN KEY (imageId) REFERENCES Image(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION


ALTER TABLE UserShare
	ADD CONSTRAINT  R_27 FOREIGN KEY (folderId) REFERENCES Folder(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION




commit tran
end try
begin catch
rollback tran
end catch;