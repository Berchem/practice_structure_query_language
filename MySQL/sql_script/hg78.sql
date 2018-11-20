create database if not exists sports_pre_match;

create table if not exists soccer_events (
    event_id int auto_increment primary key,
    event_time datetime,
    home varchar(100),
    away varchar(100),
);

create table if not exists soccer_regular (
    event_id int foreign key,
    log_time datetime unique,

    win float,  -- home win
    draw float,
    loss float, -- home loss

    -- full time
    handicap varchar(7),
    handicap_home float,
    handicap_away float,

    ou varchar(4),
    ou_over float,
    ou_under float,

    odd float,
    even float,

    -- 1st half
    win_1st float,  -- home win
    draw_1st float,
    loss_1st float, -- home loss

    handicap_1st varchar(7),
    handicap_home_1st float,
    handicap_away_1st float,

    ou_1st varchar(4),
    ou_over_1st float,
    ou_under_1st float,

    odd_1st float,
    even_1st float);

create table if not exists soccer_correct_score (
    event_id int foreign key,
    log_time datetime unique,

    correct_score varchar(5),
    odds float);

create table if not exists soccer_3ways (
    event_id int foreign key,
    log_time datetime unique,

    win_win float,    -- 主/主
    win_draw float,   -- 主/和
    win_loss float,   -- 主/客
    draw_win float,   -- 和/主
    draw_draw float,  -- 和/和
    draw_loss float,  -- 和/客
    loss_win float,   -- 客/主
    loss_draw float,  -- 客/和
    loss_loss float); -- 客/客


odds = {}

def convert(**odds):
    h = 1 / odd['h']
    a = 1 / odd['a']
    base =