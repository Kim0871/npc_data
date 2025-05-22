-- =======================
-- 4 Simple queries
-- =======================

-- Select the information of the NPCs located in the location 4 and whom the level is superior or equal to 15
select * from NPC where Location_ID = 4 and Level >= 15;

-- Select the name of the items whom the rarity is Rare or Epic
select item_name from item where rarity = "Rare" or rarity = "Epic";

-- Select the descriptions of the quest where the xp gain is superior to 1000
select description from quest where xp > 1000;

-- Select the name of the npcs whom the level is inferior to 5
select name from npc where level < 5;


-- =======================
-- 2 Join queries
-- =======================

-- Select the npcs' name, the country he lives in, and the region he lives in
-- Ordered by ascending order with respect to the region of the location.

select npc.name, loc.country, loc.region 
from npc
join location as loc 
on loc.location_id = npc.location_id
order by loc.region asc;

-- Select npcs' name, npcs' level and their stats uniquely when the npc is someone to be defeated.

select npc.name, npc.level, npc.stats
from npc
join takes_part_in as partof
on npc.npc_id = partof.npc_id
where partof.role = "Must be Defeated";

-- =======================
-- 2 Agregation queries
-- =======================

-- Select the name, the level, and the stats of the npc which has the highest level or the lowest level.
select Name, Level, Stats
from npc
where Level = (
    select max(Level)
    from npc) 
    or Level = (
    select min(Level)
    from npc
);

-- Select the name, the level, and the stats of the npcs which has the a level higher than average
select Name, Level, Stats
from npc
where Level > (
    select avg(Level)
    from npc
);

-- =======================
-- 2 queries both Join and Agregration
-- =======================

-- Select the average price of the items possessed by npc 11
select avg(i.Price)
from item as i
join have as h
on h.item_id=i.item_id
where h.npc_id=11;

-- Select the quests for which the bounty is inferior to the average bounty
select q.description
from quest as q
join occurs_at as o
on o.quest_id=q.quest_id
where Bounty < (
    select avg(Bounty)
    from quest
);

-- =======================
-- 4 Negation queries
-- =======================

-- Select all the regions from the locations where the country is not Merrimill
select region from location where not country = "Merrimill";

-- Select the information of the npcs whose race is not Tieffelin nor Dragon
select * from npc where not (race = "Tieffelin" or race = "Dragon");

-- Select the bounty, description and the xp from the quests which are not main quests
select bounty, description, xp from quest where not quest_type = "Main Quest";

-- Select the name of the items whom the rarity is not a Story item
select item_name from item where not rarity = "Story Item";