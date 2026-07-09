-- ==========================================
-- DATABASE
-- ==========================================
drop database if exists training_platform;
CREATE DATABASE training_platform;
USE training_platform;

-- ==========================================
-- TABLE: users
-- ==========================================

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    date_of_birth DATE,
	country_code CHAR(2),
    weight DECIMAL(5,2),
    height SMALLINT UNSIGNED,
    ftp SMALLINT UNSIGNED,
    max_heart_rate TINYINT UNSIGNED,
    resting_heart_rate TINYINT UNSIGNED,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ==========================================
-- TABLE: seasons
-- ==========================================

CREATE TABLE seasons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    -- year YEAR NOT NULL,
    start_date DATE,
    end_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ==========================================
-- TABLE: goals
-- ==========================================

CREATE TABLE goals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    season_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    goal_date DATE,
    status ENUM(
        'pending',
        'in_progress',
        'completed',
        'cancelled'
    ) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ==========================================
-- TABLE: sports
-- ==========================================

CREATE TABLE sports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    icon VARCHAR(100),
    color VARCHAR(7)
);

-- ==========================================
-- TABLE: workout_types
-- ==========================================

CREATE TABLE workout_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    color VARCHAR(7)
);

-- ==========================================
-- TABLE: planned_workouts
-- ==========================================

CREATE TABLE planned_workouts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    season_id INT NOT NULL,
    sport_id INT NOT NULL,
    workout_type_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    workout_date DATE NOT NULL,
    start_time TIME,
    planned_duration_minutes SMALLINT UNSIGNED,
    planned_distance DECIMAL(6,2),
    planned_tss SMALLINT UNSIGNED,
    status ENUM(
        'planned',
        'completed',
        'missed',
        'cancelled'
    ) DEFAULT 'planned',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ==========================================
-- TABLE: activities
-- ==========================================

CREATE TABLE activities (
		id INT AUTO_INCREMENT PRIMARY KEY,

		user_id INT NOT NULL,

		planned_workout_id INT,

		sport_id INT NOT NULL,

		workout_type_id INT NOT NULL,

		title VARCHAR(150),

		description TEXT,

		activity_date DATE NOT NULL,

		start_time DATETIME,

		duration_seconds INT UNSIGNED,

		moving_time_seconds INT UNSIGNED,

		elapsed_time_seconds INT UNSIGNED,

		distance DECIMAL(8,2),

		elevation_gain INT UNSIGNED,

		elevation_loss INT UNSIGNED,

		average_speed DECIMAL(5,2),

		max_speed DECIMAL(5,2),

		average_power SMALLINT UNSIGNED,

		normalized_power SMALLINT UNSIGNED,

		max_power SMALLINT UNSIGNED,

		average_heart_rate TINYINT UNSIGNED,

		max_heart_rate TINYINT UNSIGNED,

		average_cadence SMALLINT UNSIGNED,

		max_cadence SMALLINT UNSIGNED,

		calories SMALLINT UNSIGNED,

		training_stress_score DECIMAL(5,1),

		intensity_factor DECIMAL(4,2),

		energy_kj INT UNSIGNED,

		average_temperature DECIMAL(4,1),

		fit_file_path VARCHAR(255),

		garmin_activity_id BIGINT,

		created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

		updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
        
        
);

-- ==========================================
-- TABLE: activity_notes
-- ==========================================

CREATE TABLE activity_notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    activity_id INT NOT NULL UNIQUE,
    perceived_exertion TINYINT UNSIGNED,
    feeling ENUM(
        'very_bad',
        'bad',
        'normal',
        'good',
        'excellent'
    ),
    nutrition TEXT,
    hydration TEXT,
    equipment TEXT,
    comments TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ==========================================
-- TABLE: personal_records
-- ==========================================

CREATE TABLE personal_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    activity_id INT NOT NULL,
    sport_id INT NOT NULL,
    record_type VARCHAR(100) NOT NULL,
    value DECIMAL(10,2) NOT NULL,
    unit VARCHAR(20) NOT NULL,
    record_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==========================================
-- TABLE: metrics
-- ==========================================

CREATE TABLE metrics (
    id INT AUTO_INCREMENT PRIMARY KEY,
    activity_id INT NOT NULL UNIQUE,
    ctl DECIMAL(5,2),
    atl DECIMAL(5,2),
    tsb DECIMAL(5,2),
    fitness DECIMAL(5,2),
    fatigue DECIMAL(5,2),
    form DECIMAL(5,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==========================================
-- TABLE: competitions
-- ==========================================

CREATE TABLE competitions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    season_id INT NOT NULL,
    sport_id INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    location VARCHAR(150),
    competition_date DATE NOT NULL,
    target VARCHAR(255),
    result VARCHAR(255),
    finish_time TIME,
    position SMALLINT UNSIGNED,
    distance DECIMAL(6,2),
	elevation_gain INT UNSIGNED,
    comments TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ==========================================
-- FOREIGN KEYS
-- ==========================================

-- ==========================================
-- Seasons
-- ==========================================

ALTER TABLE seasons
ADD CONSTRAINT fk_seasons_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- ==========================================
-- Goals
-- ==========================================

ALTER TABLE goals
ADD CONSTRAINT fk_goals_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE goals
ADD CONSTRAINT fk_goals_season
FOREIGN KEY (season_id)
REFERENCES seasons(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- ==========================================
-- Planned Workouts
-- ==========================================

ALTER TABLE planned_workouts
ADD CONSTRAINT fk_planned_workouts_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE planned_workouts
ADD CONSTRAINT fk_planned_workouts_season
FOREIGN KEY (season_id)
REFERENCES seasons(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE planned_workouts
ADD CONSTRAINT fk_planned_workouts_sport
FOREIGN KEY (sport_id)
REFERENCES sports(id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE planned_workouts
ADD CONSTRAINT fk_planned_workouts_workout_type
FOREIGN KEY (workout_type_id)
REFERENCES workout_types(id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- ==========================================
-- Activities
-- ==========================================

ALTER TABLE activities
ADD CONSTRAINT fk_activities_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE activities
ADD CONSTRAINT fk_activities_planned_workout
FOREIGN KEY (planned_workout_id)
REFERENCES planned_workouts(id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE activities
ADD CONSTRAINT fk_activities_sport
FOREIGN KEY (sport_id)
REFERENCES sports(id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE activities
ADD CONSTRAINT fk_activities_workout_type
FOREIGN KEY (workout_type_id)
REFERENCES workout_types(id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- ==========================================
-- Activity Notes
-- ==========================================

ALTER TABLE activity_notes
ADD CONSTRAINT fk_activity_notes_activity
FOREIGN KEY (activity_id)
REFERENCES activities(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- ==========================================
-- Metrics
-- ==========================================

ALTER TABLE metrics
ADD CONSTRAINT fk_metrics_activity
FOREIGN KEY (activity_id)
REFERENCES activities(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- ==========================================
-- Personal Records
-- ==========================================

ALTER TABLE personal_records
ADD CONSTRAINT fk_personal_records_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE personal_records
ADD CONSTRAINT fk_personal_records_activity
FOREIGN KEY (activity_id)
REFERENCES activities(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE personal_records
ADD CONSTRAINT fk_personal_records_sport
FOREIGN KEY (sport_id)
REFERENCES sports(id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- ==========================================
-- Competitions
-- ==========================================

ALTER TABLE competitions
ADD CONSTRAINT fk_competitions_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE competitions
ADD CONSTRAINT fk_competitions_season
FOREIGN KEY (season_id)
REFERENCES seasons(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE competitions
ADD CONSTRAINT fk_competitions_sport
FOREIGN KEY (sport_id)
REFERENCES sports(id)
ON DELETE RESTRICT
ON UPDATE CASCADE;