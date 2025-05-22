-- =====================================================================
-- Data Insertion for Npc_Comics Database
-- =====================================================================

-- =====================================================================
-- Insert data for the LOCATION table
-- =====================================================================
insert into LOCATION (Location_ID, Country, Region) values 
(1, "Merrimill", "Riverfield"), 
(2, "Merrimill", "Waterpond"), 
(3, "Elfgard", "Windhollow"), 
(4, "Bluewynne", "Eastshore"),
(5, "Kingdom Of Ethyvia", "Sheirwood"),
(6, "Bluewynne", "Midgard"),
(7, "Bluewynne", "Vulkaris");

-- =====================================================================
-- Insert data for the NPC table
-- =====================================================================
insert into NPC (NPC_ID, Name, Level, Stats, Race, Profession, Location_ID) values
(1, "Loris", 17, "STR:16, DEX:32, CON:27, INT:4, WIS:7, CHA:3", "Human", "Senator", 5), 
(2, "Ayden", 9, "STR:16, DEX:12, CON:15, INT:10, WIS:14, CHA:18", "Tieffelin", "Adventurer", 4),
(3, "Oyar", 6, "STR:12, DEX:12, CON:10, INT:8, WIS:11, CHA:8", "Human", "Guard", 1),
(4, "David", 25, "STR:22, DEX:24, CON:20, INT:16, WIS:16, CHA:32", "Elf", "Adventurer", 3),
(5, "Orcus", 26, "STR:27, DEX:14, CON:25, INT:20, WIS:20, CHA:25", "Demon","Demon Lord", 6),
(6, "Nam", 4, "STR:8, DEX:9, CONT:8, INT:11, WIS:9, CHAR:13", "Human", "Musician", 1),
(7, "Aglea", 5, "STR:7, DEX:10, CONT:9, INT:12, WIS:11, CHAR:14", "Human", "Merchant", 5),
(8, "Manchau", 1, "STR:2, DEX:27, CONT:2, INT:2, WIS:20, CHAR:1000", "Beast", "Fishman", 2),
(9, "Teostra", 15, "STR:22, DEX:16, CONT:20, INT:18, WIS:16, CHAR:20", "Dragon", "Ancient Dragon", 7),
(10, "Lufa", 26, "STR:26, DEX:26, CONT:26, INT:26, WIS:26, CHAR:26", "Elf", "Druid", 3),
(11, "Charlatan", 5, "STR:5, DEX:5, CONT:5, INT:5, WIS:5, CHAR:5", "Human", "Merchant", 5);

-- =====================================================================
-- Insert data for the QUEST table
-- =====================================================================
insert into QUEST (Quest_ID, Quest_Type, Description, Bounty, XP) values
(1, "Monthly Quest", "Guard the gate at Riverfield", 32, 10),
(2, "Main Quest", "Save Midgard from Orcus, the Demon Lord", 10000000, 50000),
(3, "Annex Quest", "Help me find my love one", 100, 50),
(4, "Main Quest", "Looking for a relic left by the lost hero David", 600, 400),
(5, "Main Quest", "Defeat the Dragon at Vulkaris", 1000, 200);

-- =====================================================================
-- Insert data for the ITEM table
-- =====================================================================
insert into ITEM (Item_ID, Item_Name, Item_Type, Rarity, Description, Price, Effects) values
(1, "God Blessing", "Miscellaneous", "Story Item", "Defeating Orcus, Gods gave you their blessing", 1000000000, "The wielder become an aasimar, a being of divinity"),
(2, "The Hero of a lost time", "Miscellaneous", "Story Item", "A book of spells written by David", 10000, "Grants access to unique spells"),
(3, "Excalibur", "Equipment", "Legendary", "A sword forged by the hands of the best forgeon known to mankind", 1000, "Deals high physical damage and has a chance to inflict 'Bleed'"),
(4, "Dragon Scale Armor", "Equipment", "Epic", "Armor forged from the scales of an ancient red dragon", 800, "Greatly increases defense and provides fire damage resistance"),
(5, "Potion of Greater Healing", "Miscellaneous", "Rare", "A potent potion that quickly restores a significant amount of health", 100, "Instantly restores a large amount of health points"),
(6, "Tome of Arcane Knowledge", "Miscellaneous", "Rare", "An ancient tome filled with powerful arcane spells and forgotten knowledge", 700, "Teaches advanced arcane spells like 'Fireball', 'Ice Storm', and 'Teleport'"),
(7, "Amulet of the Silent Protector", "Equipmen", "Epic", "An intricately crafted amulet that silently wards off danger and enhances the wearer's resilience", 450, "Provides a constant shield effect and increases resistance to magic damage");

-- =====================================================================
-- Insert data for relationship tables
-- =====================================================================

-- =====================================================================
-- Insert data for TAKES_PART_IN
-- Connects NPCs to Quests and defines their Role in the quest.
-- =====================================================================
insert into TAKES_PART_IN (NPC_ID, Quest_ID, ROLE) values
(3, 1, "Submitted the Quest"),
(1, 2, "Submitted the Quest"),
(5, 2, "Must be Defeated"),
(6, 3, "Submitted the Quest"),
(7, 3, "Searching for them"),
(2, 4, "Submitted the Quest"),
(4, 4, "Involved in the Quest"),
(10, 4, "Must be Defeated"),
(8, 5, "Submitted the Quest"),
(9, 5, "Must be Defeated");

-- =====================================================================
-- Insert data for OCCURS_AT 
-- Specifies where quests take place.
-- =====================================================================
insert into OCCURS_AT (Location_ID, Quest_ID) values
(1, 1),  -- Quest 1 occurs at Location 1.
(6, 2),  -- Quest 2 occurs at Location 6.
(5, 3),  -- Quest 3 occurs at Location 5.
(3, 4),  -- Quest 4 occurs at Location 3.
(7, 5);  -- Quest 5 occurs at Location 7.

-- =====================================================================
-- Insert data for INVOLVES
-- Links quests to the items required or related to them.
-- =====================================================================
insert into INVOLVES (Quest_ID, ITEM_ID) values
(2, 1),  -- Quest 2 involves Item 1.
(4, 2);  -- Quest 4 involves Item 2.

-- =====================================================================
-- Insert data for HAVE
-- Shows which NPCs possess which items.
-- =====================================================================
insert into HAVE (NPC_ID, ITEM_ID) values
(10, 2), -- NPC 10 has Item 2.
(11, 3), -- NPC 11 has Item 3.
(11, 4), -- NPC 11 has Item 4.
(11, 5), -- NPC 11 has Item 5.
(11, 6), -- NPC 11 has Item 6.
(11, 7); -- NPC 11 has Item 7.