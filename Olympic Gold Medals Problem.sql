-- write a query to find no of gold medal per swimmer for swimmer who only won gold medals-
CREATE TABLE events (
ID int,
event varchar(255),
YEAR INt,
GOLD varchar(255),
SILVER varchar(255),
BRONZE varchar(255)
);

delete from events;

INSERT INTO events VALUES (1,'100m',2016, 'Amthhew Mcgarray','donald','barbara');
INSERT INTO events VALUES (2,'200m',2016, 'Nichole','Alvaro Eaton','janet Smith');
INSERT INTO events VALUES (3,'500m',2016, 'Charles','Nichole','Susana');
INSERT INTO events VALUES (4,'100m',2016, 'Ronald','maria','paula');
INSERT INTO events VALUES (5,'200m',2016, 'Alfred','carol','Steven');
INSERT INTO events VALUES (6,'500m',2016, 'Nichole','Alfred','Brandon');
INSERT INTO events VALUES (7,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events VALUES (8,'200m',2016, 'Thomas','Dawn','catherine');
INSERT INTO events VALUES (9,'500m',2016, 'Thomas','Dennis','paula');
INSERT INTO events VALUES (10,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events VALUES (11,'200m',2016, 'jessica','Donald','Stefeney');
INSERT INTO events VALUES (12,'500m',2016,'Thomas','Steven','Catherine');

# Solution1:
Select GOLD as Player_name,Count(1) as No_of_Medals 
from events
where GOLD not in (Select SILVER from events UNION ALL Select BRONZE from events)
Group By GOLD;

#Solution2:
with CTE(Player_name,Medal_type) AS (
Select GOLD as Player_name,'gold' as Medal_type from events
UNION ALL
Select SILVER as Player_name,'silver' as Medal_type from events
UNION ALL
Select BRONZE as Player_name,'bronze' as Medal_type from events
)
Select Player_name,Count(1) as No_of_Medals from CTE
group by Player_name
having Count(distinct Medal_type)=1 and max(Medal_type)='gold'