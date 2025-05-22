# Creation of the database
create database Npc_Comics;
use Npc_Comics;

# Creation of the entities

-- =====================================================================
-- Table: LOCATION
-- Purpose: Stores information about geographical locations within the game.
-- =====================================================================
create table LOCATION(
	  Location_ID int primary key,
    Country varchar(50) not null,
    Region varchar(50) not null
);

-- =====================================================================
-- Table: ITEM
-- Purpose:  Stores details about items that exist within the game world.
-- =====================================================================
create table ITEM(
	Item_ID int primary key, 
	Item_Name varchar(50) not null, 
	Item_Type varchar(50) not null, 
	Rarity varchar(50) not null, 
	Description varchar(100) not null, 
	Price int not null,
	Effects varchar(100) not null,
	unique(Item_Name)
);

-- =====================================================================
-- Table: NPC
-- Purpose:  Stores information about Non-Player Characters (NPCs).
-- =====================================================================
create table NPC(
	NPC_ID int primary key, 
	Name varchar(50) not null, 
	Level int not null, 
	Stats varchar(50) not null,
	Race varchar(50) not null,
	Profession varchar(50) not null,
	Location_ID int,
	foreign key (Location_ID) references LOCATION(Location_ID) on delete cascade on update cascade
);

-- =====================================================================
-- Table: QUEST
-- Purpose:  Stores details about quests available in the game world.
-- =====================================================================
create table QUEST(
	  Quest_ID int primary key,
    Quest_Type varchar(50) not null,
    Description varchar(50) not null,
    Bounty int not null,
    XP int not null
);

# Creation of the associations

-- =====================================================================
-- Table: OCCURS_AT (LOCATION <-> QUEST)
-- =====================================================================
create table OCCURS_AT(
	Location_ID int,
	Quest_ID int,
  primary key(Location_ID, Quest_ID),
  foreign key (Location_ID) references LOCATION(Location_ID) on delete cascade on update cascade,
  foreign key (Quest_ID) references QUEST(Quest_ID) on delete cascade on update cascade
);


-- =====================================================================
-- Table: HAVE (NPC <-> ITEM)
-- =====================================================================
create table HAVE(
	NPC_ID int,
	ITEM_ID int,
  primary key(NPC_ID, ITEM_ID),
  foreign key (NPC_ID) references NPC(NPC_ID) on delete cascade on update cascade,
  foreign key (ITEM_ID) references ITEM(ITEM_ID) on delete cascade on update cascade
);

-- =====================================================================
-- Table: INVOLVES (QUEST <-> ITEM)
-- =====================================================================
create table INVOLVES(
	Quest_ID int,
	ITEM_ID int,
  primary key(Quest_ID, ITEM_ID),
  foreign key (Quest_ID) references QUEST(Quest_ID) on delete cascade on update cascade,
  foreign key (ITEM_ID) references ITEM(ITEM_ID) on delete cascade on update cascade
);

-- =====================================================================
-- Table: TAKES_PART_IN (NPC <-> QUEST)
-- =====================================================================
create table TAKES_PART_IN(
	NPC_ID int,
	Quest_ID int,
	ROLE varchar(50) not null,
  primary key(NPC_ID, Quest_ID),
  foreign key (NPC_ID) references NPC(NPC_ID) on delete cascade on update cascade,
  foreign key (Quest_ID) references QUEST(Quest_ID) on delete cascade on update cascade
);