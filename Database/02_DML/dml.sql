use training_platform;

-- ==========================================
-- USERS
-- ==========================================

INSERT INTO users
(first_name, last_name, email, password_hash, date_of_birth, country_code, weight, height, ftp, max_heart_rate, resting_heart_rate)
VALUES
('Pau','Morilla','pau@example.com','hash123','2004-04-15','ES',68.5,178,310,193,46),
('Marc','Garcia','marc@example.com','hash456','1995-08-20','ES',74.2,181,285,188,49),
('Laura','Soler','laura@example.com','hash789','1998-11-12','ES',60.1,168,245,190,50);

-- ==========================================
-- SPORTS
-- ==========================================

INSERT INTO sports (name, icon, color)
VALUES
('Cycling','bike','#3498db'),
('Running','running','#2ecc71'),
('Swimming','swimmer','#1abc9c'),
('Gym','dumbbell','#9b59b6');

-- ==========================================
-- WORKOUT TYPES
-- ==========================================

INSERT INTO workout_types (name, description, color)
VALUES
('Recovery','Easy recovery session','#2ecc71'),
('Endurance','Aerobic endurance','#3498db'),
('Tempo','Tempo effort','#f1c40f'),
('Threshold','FTP intervals','#e67e22'),
('VO2 Max','High intensity','#e74c3c'),
('Race','Competition effort','#8e44ad'),
('Strength','Gym workout','#34495e');

-- ==========================================
-- SEASONS
-- ==========================================

INSERT INTO seasons
(user_id,name,start_date,end_date)
VALUES
(1,'Season 2026','2026-01-01','2026-12-31'),
(2,'Season 2026','2026-01-01','2026-12-31'),
(3,'Season 2026','2026-01-01','2026-12-31');

-- ==========================================
-- GOALS
-- ==========================================

INSERT INTO goals
(user_id,season_id,title,description,goal_date,status)
VALUES
(1,1,'Finish La Purito','Complete the event under 7 hours','2026-08-02','in_progress'),
(1,1,'Reach FTP 320W','Increase FTP during the season','2026-09-01','pending'),
(2,2,'Ride 10000 km','Annual cycling distance goal','2026-12-31','pending'),
(3,3,'Run Half Marathon','First half marathon','2026-10-18','pending');

-- ==========================================
-- PLANNED WORKOUTS
-- ==========================================

INSERT INTO planned_workouts
(user_id,season_id,sport_id,workout_type_id,title,description,workout_date,start_time,planned_duration_minutes,planned_distance,planned_tss,status)
VALUES
(1,1,1,4,'Threshold Intervals','4x10 min FTP','2026-07-10','18:00',90,55,95,'planned'),

(1,1,1,2,'Long Ride','Zone 2 endurance','2026-07-12','08:00',240,120,180,'planned'),

(2,2,1,5,'VO2 Max','6x4 min','2026-07-09','17:30',75,45,90,'planned'),

(3,3,2,2,'Easy Run','Comfortable pace','2026-07-11','08:30',60,10,55,'planned');

-- ==========================================
-- ACTIVITIES
-- ==========================================

INSERT INTO activities
(user_id,planned_workout_id,sport_id,workout_type_id,title,description,
activity_date,start_time,duration_seconds,moving_time_seconds,
elapsed_time_seconds,distance,elevation_gain,elevation_loss,
average_speed,max_speed,average_power,normalized_power,max_power,
average_heart_rate,max_heart_rate,average_cadence,max_cadence,
calories,training_stress_score,intensity_factor,energy_kj,
average_temperature,fit_file_path,garmin_activity_id)

VALUES

(1,1,1,4,
'Threshold Intervals',
'Completed as planned',
'2026-07-10',
'2026-07-10 18:00:00',
5400,
5250,
5500,
56.20,
720,
720,
37.4,
63.5,
282,
305,
811,
166,
184,
87,
115,
1320,
96.5,
0.93,
1525,
28.5,
'/activities/activity1.fit',
100000001),

(1,2,1,2,
'Sunday Long Ride',
'Mountain endurance',
'2026-07-12',
'2026-07-12 08:00:00',
14800,
14500,
15000,
122.60,
1820,
1820,
30.5,
65.2,
210,
225,
640,
142,
171,
82,
108,
2850,
178.2,
0.71,
3100,
24.0,
'/activities/activity2.fit',
100000002),

(3,NULL,2,2,
'Morning Run',
'Easy run',
'2026-07-11',
'2026-07-11 08:30:00',
3600,
3550,
3650,
10.20,
120,
120,
10.2,
15.3,
NULL,
NULL,
NULL,
151,
176,
171,
185,
620,
54.0,
0.76,
NULL,
22.0,
NULL,
100000003);

-- ==========================================
-- ACTIVITY NOTES
-- ==========================================

INSERT INTO activity_notes
(activity_id,perceived_exertion,feeling,nutrition,hydration,equipment,comments)
VALUES
(1,8,'good','2 gels','750 ml isotonic','Road Bike','Good sensations'),
(2,6,'excellent','Bars and gels','2 bottles','Road Bike','Very comfortable ride'),
(3,5,'good','Banana before run','500 ml water','Running shoes','Easy pace');

-- ==========================================
-- METRICS
-- ==========================================

INSERT INTO metrics
(activity_id,ctl,atl,tsb,fitness,fatigue,form)
VALUES
(1,78.5,82.0,-3.5,78.5,82.0,-3.5),
(2,79.3,88.1,-8.8,79.3,88.1,-8.8),
(3,45.2,48.0,-2.8,45.2,48.0,-2.8);

-- ==========================================
-- PERSONAL RECORDS
-- ==========================================

INSERT INTO personal_records
(user_id,activity_id,sport_id,record_type,value,unit,record_date)
VALUES
(1,1,1,'20 Minute Power',315,'W','2026-07-10'),
(1,2,1,'Longest Ride',122.6,'km','2026-07-12'),
(3,3,2,'10 km','48.3','min','2026-07-11');

-- ==========================================
-- COMPETITIONS
-- ==========================================

INSERT INTO competitions
(user_id,season_id,sport_id,name,location,competition_date,target,result,finish_time,position,distance,elevation_gain,comments)
VALUES
(1,1,1,'La Purito','Andorra','2026-08-02',
'Finish under 7 hours',
NULL,
NULL,
NULL,
115,
4800,
'Main objective of the season'),

(3,3,2,'Half Marathon Girona','Girona','2026-10-18',
'Finish',
NULL,
NULL,
NULL,
21.10,
120,
'First half marathon');