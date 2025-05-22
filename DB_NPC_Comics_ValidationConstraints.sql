-- Ensure that the Price in the ITEM table is non-negative (positive or zero).
-- This prevents invalid prices from being entered.
alter table ITEM add constraint CHK_Price check (Price >= 0);

-- Ensure that the Level in the NPC table is strictly positive.
-- NPCs cannot have a level of 0 or a negative level.
alter table NPC add constraint CHK_Level check (Level > 0);

-- Ensure that Bounty and XP in QUEST table are positive or zero
alter table QUEST add constraint CHK_Bounty check (Bounty >= 0);
alter table QUEST add constraint CHK_XP check (XP >= 0);