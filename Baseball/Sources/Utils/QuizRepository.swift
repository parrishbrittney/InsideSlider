

import Foundation

class QuizRepository {
    static func getBaseballQuizzes() -> [QuizeDetailsViewModel] {
        return [
            .init(
                id: "quiz_1",
                title: "How many innings are in a regulation MLB game?",
                items: [
                    .init(id: "9_innings", title: "9 innings", isCorrect: true),
                    .init(id: "7_innings", title: "7 innings", isCorrect: false),
                    .init(id: "5_innings", title: "5 innings", isCorrect: false)
                ]
            ),
            
                .init(
                    id: "quiz_2",
                    title: "How many players are on the field for each team during play?",
                    items: [
                        .init(id: "11_players", title: "11 players", isCorrect: false),
                        .init(id: "9_players", title: "9 players", isCorrect: true),
                        .init(id: "7_players", title: "7 players", isCorrect: false)
                    ]
                ),
            
                .init(
                    id: "quiz_3",
                    title: "What is a 'strike'?",
                    items: [
                        .init(id: "hit_ball", title: "When a batter hits the ball", isCorrect: false),
                        .init(id: "throw_base", title: "When a pitcher throws to a base", isCorrect: false),
                        .init(id: "miss_zone", title: "When a batter swings and misses or doesn't swing at a pitch in the strike zone", isCorrect: true)
                    ]
                ),
            
                .init(
                    id: "quiz_4",
                    title: "How many strikes constitute a strikeout?",
                    items: [
                        .init(id: "4_strikes", title: "4 strikes", isCorrect: false),
                        .init(id: "3_strikes", title: "3 strikes", isCorrect: true),
                        .init(id: "2_strikes", title: "2 strikes", isCorrect: false)
                    ]
                ),
            
                .init(
                    id: "quiz_5",
                    title: "How many balls result in a walk?",
                    items: [
                        .init(id: "5_balls", title: "5 balls", isCorrect: false),
                        .init(id: "4_balls", title: "4 balls", isCorrect: true),
                        .init(id: "3_balls", title: "3 balls", isCorrect: false)
                    ]
                ),
            
                .init(
                    id: "quiz_6",
                    title: "What is a 'home run'?",
                    items: [
                        .init(id: "out_fair", title: "When a batter hits the ball out of play in fair territory", isCorrect: true),
                        .init(id: "all_bases", title: "When a runner touches all bases and returns to home", isCorrect: false),
                        .init(id: "first_base", title: "When a batter hits the ball and runs to first base", isCorrect: false)
                    ]
                ),
            
            // Positions
            .init(
                id: "quiz_7",
                title: "What position is abbreviated as 'SS'?",
                items: [
                    .init(id: "second_base", title: "Second Base", isCorrect: false),
                    .init(id: "shortstop", title: "Shortstop", isCorrect: true),
                    .init(id: "strong_safety", title: "Strong Safety", isCorrect: false)
                ]
            ),
            
                .init(
                    id: "quiz_8",
                    title: "Which position is responsible for catching pitches?",
                    items: [
                        .init(id: "first_baseman", title: "First Baseman", isCorrect: false),
                        .init(id: "pitcher", title: "Pitcher", isCorrect: false),
                        .init(id: "catcher", title: "Catcher", isCorrect: true)
                    ]
                ),
            
                .init(
                    id: "quiz_9",
                    title: "How many outfield positions are there in baseball?",
                    items: [
                        .init(id: "2_outfields", title: "2 (Left and Right field)", isCorrect: false),
                        .init(id: "3_outfields", title: "3 (Left, Center, Right field)", isCorrect: true),
                        .init(id: "4_outfields", title: "4 (Left, Left-Center, Right-Center, Right field)", isCorrect: false)
                    ]
                ),
            
                .init(
                    id: "quiz_10",
                    title: "What is the position number for the pitcher?",
                    items: [
                        .init(id: "position_1", title: "1", isCorrect: true),
                        .init(id: "position_9", title: "9", isCorrect: false),
                        .init(id: "position_5", title: "5", isCorrect: false)
                    ]
                ),
            
            // Gameplay
            .init(
                id: "quiz_11",
                title: "What is a 'double play'?",
                items: [
                    .init(id: "two_runs", title: "When two runners score on the same hit", isCorrect: false),
                    .init(id: "double_hit", title: "When a batter hits a double", isCorrect: false),
                    .init(id: "two_outs", title: "When the defensive team records two outs in the same play", isCorrect: true)
                ]
            ),
            
                .init(
                    id: "quiz_12",
                    title: "What is an 'RBI'?",
                    items: [
                        .init(id: "reliable_index", title: "Reliable Batting Index", isCorrect: false),
                        .init(id: "run_batted", title: "Run Batted In - when a batter's action results in a run scoring", isCorrect: true),
                        .init(id: "running_interference", title: "Running Base Interference", isCorrect: false)
                    ]
                ),
            
                .init(
                    id: "quiz_13",
                    title: "What is a 'sacrifice fly'?",
                    items: [
                        .init(id: "fly_caught_runner", title: "When a batter hits a fly ball that's caught but allows a runner to score", isCorrect: true),
                        .init(id: "easy_pitch", title: "When a pitcher intentionally throws an easy pitch", isCorrect: false),
                        .init(id: "bunt_strike", title: "When a batter bunts with two strikes", isCorrect: false)
                    ]
                ),
            
                .init(
                    id: "quiz_14",
                    title: "What is 'stealing a base'?",
                    items: [
                        .init(id: "base_souvenir", title: "When a player takes a base from the field as a souvenir", isCorrect: false),
                        .init(id: "take_base", title: "When a fielder takes a base away from a runner", isCorrect: false),
                        .init(id: "advance_pitch", title: "When a runner advances to the next base during a pitch", isCorrect: true)
                    ]
                ),
            
                .init(
                    id: "quiz_15",
                    title: "What is a 'balk'?",
                    items: [
                        .init(id: "illegal_motion", title: "An illegal motion by the pitcher", isCorrect: true),
                        .init(id: "batter_box", title: "When a batter steps out of the batter's box", isCorrect: false),
                        .init(id: "drop_catch", title: "When a fielder drops an easy catch", isCorrect: false)
                    ]
                ),
            
            // Equipment
            .init(
                id: "quiz_16",
                title: "What is the standard number of stitches on an MLB baseball?",
                items: [
                    .init(id: "216_stitches", title: "216 stitches", isCorrect: false),
                    .init(id: "108_stitches", title: "108 stitches", isCorrect: true),
                    .init(id: "88_stitches", title: "88 stitches", isCorrect: false)
                ]
            ),
            
                .init(
                    id: "quiz_17",
                    title: "What material are most professional baseball bats made of?",
                    items: [
                        .init(id: "carbon_fiber", title: "Carbon fiber", isCorrect: false),
                        .init(id: "aluminum", title: "Aluminum", isCorrect: false),
                        .init(id: "wood", title: "Wood (maple, ash, or birch)", isCorrect: true)
                    ]
                ),
            
                .init(
                    id: "quiz_18",
                    title: "How far is the pitcher's mound from home plate in MLB?",
                    items: [
                        .init(id: "60ft_6in", title: "60 feet, 6 inches", isCorrect: true),
                        .init(id: "50ft", title: "50 feet", isCorrect: false),
                        .init(id: "66ft", title: "66 feet", isCorrect: false)
                    ]
                ),
            
            // Strategy
            .init(
                id: "quiz_19",
                title: "What is a 'squeeze play'?",
                items: [
                    .init(id: "base_caught", title: "When a base runner is caught between bases", isCorrect: false),
                    .init(id: "bunt_third", title: "When a batter bunts with a runner on third base to score them", isCorrect: true),
                    .init(id: "fielders_popup", title: "When fielders converge to catch a pop-up", isCorrect: false)
                ]
            ),
            
                .init(
                    id: "quiz_20",
                    title: "What does it mean to 'shift' defensively?",
                    items: [
                        .init(id: "position_different", title: "When fielders position differently based on a batter's tendencies", isCorrect: true),
                        .init(id: "change_positions", title: "When players change positions during an inning", isCorrect: false),
                        .init(id: "change_pitchers", title: "When a team changes pitchers", isCorrect: false)
                    ]
                ),
            
            // History
            .init(
                id: "quiz_21",
                title: "Who is credited with inventing baseball?",
                items: [
                    .init(id: "thomas_edison", title: "Thomas Edison", isCorrect: false),
                    .init(id: "abner_doubleday", title: "Abner Doubleday (though this is mostly a myth)", isCorrect: true),
                    .init(id: "babe_ruth", title: "Babe Ruth", isCorrect: false)
                ]
            ),
            
                .init(
                    id: "quiz_22",
                    title: "When was the first World Series played?",
                    items: [
                        .init(id: "1888", title: "1888", isCorrect: false),
                        .init(id: "1927", title: "1927", isCorrect: false),
                        .init(id: "1903", title: "1903", isCorrect: true)
                    ]
                ),
            
                .init(
                    id: "quiz_23",
                    title: "Who was the first player to break the color barrier in MLB?",
                    items: [
                        .init(id: "jackie_robinson", title: "Jackie Robinson", isCorrect: true),
                        .init(id: "willie_mays", title: "Willie Mays", isCorrect: false),
                        .init(id: "satchel_paige", title: "Satchel Paige", isCorrect: false)
                    ]
                ),
            
            // Statistics
            .init(
                id: "quiz_24",
                title: "What does the stat 'ERA' stand for?",
                items: [
                    .init(id: "extra_runs", title: "Extra Runs Allowed", isCorrect: false),
                    .init(id: "earned_run", title: "Earned Run Average", isCorrect: true),
                    .init(id: "exceptional_running", title: "Exceptional Running Ability", isCorrect: false)
                ]
            ),
            
                .init(
                    id: "quiz_25",
                    title: "What is considered a 'good' batting average in baseball?",
                    items: [
                        .init(id: "500_higher", title: ".500 or higher", isCorrect: false),
                        .init(id: "100_higher", title: ".100 or higher", isCorrect: false),
                        .init(id: "300_higher", title: ".300 or higher", isCorrect: true)
                    ]
                ),
            
                .init(
                    id: "quiz_26",
                    title: "What does 'OPS' stand for in baseball statistics?",
                    items: [
                        .init(id: "onbase_plus", title: "On-base Plus Slugging", isCorrect: true),
                        .init(id: "optimal_player", title: "Optimal Player Score", isCorrect: false),
                        .init(id: "outstanding_pitching", title: "Outstanding Pitching Statistic", isCorrect: false)
                    ]
                ),
            
            // Famous players
            .init(
                id: "quiz_27",
                title: "Who holds the MLB record for most career home runs?",
                items: [
                    .init(id: "hank_aaron", title: "Hank Aaron", isCorrect: false),
                    .init(id: "barry_bonds", title: "Barry Bonds", isCorrect: true),
                    .init(id: "babe_ruth", title: "Babe Ruth", isCorrect: false)
                ]
            ),
            
                .init(
                    id: "quiz_28",
                    title: "Which pitcher holds the record for most strikeouts in MLB history?",
                    items: [
                        .init(id: "roger_clemens", title: "Roger Clemens", isCorrect: false),
                        .init(id: "randy_johnson", title: "Randy Johnson", isCorrect: false),
                        .init(id: "nolan_ryan", title: "Nolan Ryan", isCorrect: true)
                    ]
                ),
            
                .init(
                    id: "quiz_29",
                    title: "Who is known as 'The Iron Horse' for playing in 2,130 consecutive games?",
                    items: [
                        .init(id: "cal_ripken", title: "Cal Ripken Jr.", isCorrect: false),
                        .init(id: "lou_gehrig", title: "Lou Gehrig", isCorrect: true),
                        .init(id: "joe_dimaggio", title: "Joe DiMaggio", isCorrect: false)
                    ]
                ),
            
            // Unusual rules
            .init(
                id: "quiz_30",
                title: "What is the 'infield fly rule'?",
                items: [
                    .init(id: "infielders_dirt", title: "A rule requiring infielders to stay on the infield dirt", isCorrect: false),
                    .init(id: "infielders_throw", title: "A rule limiting how high infielders can throw the ball", isCorrect: false),
                    .init(id: "infielders_drop", title: "A rule that prevents infielders from intentionally dropping pop-ups to get double plays", isCorrect: true)
                ]
            ),
            
                .init(
                    id: "quiz_31",
                    title: "What happens when a batter is hit by a pitch?",
                    items: [
                        .init(id: "hit_again", title: "The batter gets to hit again", isCorrect: false),
                        .init(id: "first_base", title: "The batter is awarded first base", isCorrect: true),
                        .init(id: "pitcher_removed", title: "The pitcher is removed from the game", isCorrect: false)
                    ]
                ),
            
                .init(
                    id: "quiz_32",
                    title: "What is a 'ground rule double'?",
                    items: [
                        .init(id: "hit_twice", title: "When a batter hits the ball twice", isCorrect: false),
                        .init(id: "bounce_outplay", title: "When a fair ball bounces out of play", isCorrect: true),
                        .init(id: "runner_error", title: "When a runner advances two bases on an error", isCorrect: false)
                    ]
                ),
            
            // International baseball
            .init(
                id: "quiz_33",
                title: "Which country, besides the USA, is known for its passion for baseball?",
                items: [
                    .init(id: "australia", title: "Australia", isCorrect: false),
                    .init(id: "japan", title: "Japan", isCorrect: true),
                    .init(id: "brazil", title: "Brazil", isCorrect: false)
                ]
            ),
            
                .init(
                    id: "quiz_34",
                    title: "What international baseball competition features countries competing against each other?",
                    items: [
                        .init(id: "world_classic", title: "World Baseball Classic", isCorrect: true),
                        .init(id: "baseball_cup", title: "Baseball World Cup", isCorrect: false),
                        .init(id: "international_series", title: "International Series", isCorrect: false)
                    ]
                ),
            
            // Advanced rules
            .init(
                id: "quiz_35",
                title: "What is a 'force out'?",
                items: [
                    .init(id: "umpire_ejects", title: "When an umpire ejects a player", isCorrect: false),
                    .init(id: "forced_leave", title: "When a baserunner is put out because they are forced to leave their base", isCorrect: true),
                    .init(id: "pitcher_throws", title: "When a pitcher throws out a runner", isCorrect: false)
                ]
            ),
            
                .init(
                    id: "quiz_36",
                    title: "What is a 'tag up'?",
                    items: [
                        .init(id: "fielder_tags", title: "When a fielder tags a runner with the ball", isCorrect: false),
                        .init(id: "batter_checks", title: "When a batter checks their stance", isCorrect: false),
                        .init(id: "runner_retouch", title: "When a runner must retouch their base after a fly ball is caught before advancing", isCorrect: true)
                    ]
                ),
            
                .init(
                    id: "quiz_37",
                    title: "What is the 'designated hitter' rule?",
                    items: [
                        .init(id: "place_pitcher", title: "A player who bats in place of the pitcher", isCorrect: true),
                        .init(id: "extra_innings", title: "A player chosen to hit in extra innings", isCorrect: false),
                        .init(id: "home_games", title: "A player who only plays during home games", isCorrect: false)
                    ]
                ),
            
            // Umpires and officials
            .init(
                id: "quiz_38",
                title: "How many umpires are typically on the field in an MLB game?",
                items: [
                    .init(id: "two_umpires", title: "2", isCorrect: false),
                    .init(id: "four_umpires", title: "4 (more in playoff games)", isCorrect: true),
                    .init(id: "six_umpires", title: "6", isCorrect: false)
                ]
            ),
            
                .init(
                    id: "quiz_39",
                    title: "What is the umpire behind home plate responsible for?",
                    items: [
                        .init(id: "calling_balls", title: "Calling balls and strikes", isCorrect: true),
                        .init(id: "calling_outs", title: "Calling outs at first base", isCorrect: false),
                        .init(id: "managing_scoreboard", title: "Managing the scoreboard", isCorrect: false)
                    ]
                ),
            
            // Pitching
            .init(
                id: "quiz_40",
                title: "What is a 'no-hitter'?",
                items: [
                    .init(id: "team_fails", title: "When a team fails to get any hits in a game", isCorrect: false),
                    .init(id: "pitcher_completes", title: "When a pitcher completes a game without allowing any hits", isCorrect: true),
                    .init(id: "batter_fails", title: "When a batter fails to hit in all their at-bats", isCorrect: false)
                ]
            ),
            
                .init(
                    id: "quiz_41",
                    title: "What is a 'perfect game'?",
                    items: [
                        .init(id: "ten_runs", title: "When a team wins by 10 or more runs", isCorrect: false),
                        .init(id: "every_atbat", title: "When a player gets a hit in every at-bat", isCorrect: false),
                        .init(id: "no_runners", title: "When a pitcher allows no runners to reach base for the entire game", isCorrect: true)
                    ]
                ),
            
                .init(
                    id: "quiz_42",
                    title: "What is a 'save' in baseball?",
                    items: [
                        .init(id: "relief_pitcher", title: "When a relief pitcher preserves a lead in a close game", isCorrect: true),
                        .init(id: "exceptional_play", title: "When a fielder makes an exceptional defensive play", isCorrect: false),
                        .init(id: "prevent_scoring", title: "When a team prevents the opponents from scoring", isCorrect: false)
                    ]
                ),
            
            // Stadiums
            .init(
                id: "quiz_43",
                title: "What is the oldest MLB stadium still in use?",
                items: [
                    .init(id: "dodger_stadium", title: "Dodger Stadium (Los Angeles Dodgers)", isCorrect: false),
                    .init(id: "yankee_stadium", title: "Yankee Stadium (New York Yankees)", isCorrect: false),
                    .init(id: "fenway_park", title: "Fenway Park (Boston Red Sox)", isCorrect: true)
                ]
            ),
            
                .init(
                    id: "quiz_44",
                    title: "What is unique about the outfield wall at Fenway Park?",
                    items: [
                        .init(id: "green_monster", title: "It has a tall left field wall called the 'Green Monster'", isCorrect: true),
                        .init(id: "transparent_wall", title: "It's made of transparent plexiglass", isCorrect: false),
                        .init(id: "changes_colors", title: "It changes colors between innings", isCorrect: false)
                    ]
                ),
            
            // Miscellaneous
            .init(
                id: "quiz_45",
                title: "What is the 'seventh-inning stretch'?",
                items: [
                    .init(id: "fans_stretch", title: "A tradition where fans stand up and stretch during the seventh inning", isCorrect: true),
                    .init(id: "players_break", title: "A mandatory break for the players to rest", isCorrect: false),
                    .init(id: "pitchers_warmup", title: "When relief pitchers warm up", isCorrect: false)
                ]
            ),
            
                .init(
                    id: "quiz_46",
                    title: "What does MLB stand for?",
                    items: [
                        .init(id: "multiple_league", title: "Multiple League Baseball", isCorrect: false),
                        .init(id: "modern_league", title: "Modern League of Baseball", isCorrect: false),
                        .init(id: "major_league", title: "Major League Baseball", isCorrect: true)
                    ]
                ),
            
                .init(
                    id: "quiz_47",
                    title: "How many MLB teams are there as of 2024?",
                    items: [
                        .init(id: "28_teams", title: "28 teams", isCorrect: false),
                        .init(id: "30_teams", title: "30 teams", isCorrect: true),
                        .init(id: "32_teams", title: "32 teams", isCorrect: false)
                    ]
                ),
            
                .init(
                    id: "quiz_48",
                    title: "What is typically sung before the start of an MLB game?",
                    items: [
                        .init(id: "sweet_caroline", title: "Sweet Caroline", isCorrect: false),
                        .init(id: "national_anthem", title: "The national anthem", isCorrect: true),
                        .init(id: "take_me_out", title: "Take Me Out to the Ball Game", isCorrect: false)
                    ]
                )

        ]
    }
}
