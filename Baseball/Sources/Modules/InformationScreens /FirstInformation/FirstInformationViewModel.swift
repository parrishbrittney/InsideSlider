
import Foundation
import RealmSwift

final class FirstInformationViewModel: ObservableObject {
    func loadData() {
        let storage: ModelStorage = .init()
        
        guard storage.read().isEmpty else { return }
        
        let easy = List<EasyDomainModel>()
        let medium = List<MediumDomainModel>()
        let hard = List<HardDomainModel>()
        
        easy.append(.init(image: "easyLvl1", title: "Basic Bat Work with Tee", descriptions: """
          Goal: Develop proper swing mechanics and improve coordination
          Execution: Place a baseball on a tee at waist level. Assume a batting stance, swing, and hit the ball, focusing on proper weight transfer from back foot to front foot.
          Volume: 4 sets of 15 swings
          Recommendations: Monitor elbow position, swing smoothness, and follow-through position. Don't rush, focus on technique.
        """))
        easy.append(.init(image: "easyLvl2", title: "Soft Toss for Hitting Practice", descriptions: """
        Goal: Improve hand-eye coordination and ball contact
        Execution: Partner stands to the side of the batter at a distance of 3-4 meters and softly tosses balls in an arc. The batter should hit the ball at the optimal point.
        Volume: 3 sets of 20 swings
        Recommendations: Start with slow tosses, gradually increasing speed. Focus on making solid contact with the center of the bat.
        """))
        easy.append(.init(image: "easyLvl3", title: "Basic Glove Catching", descriptions: """
        Goal: Master ball reception technique and glove positioning
        Execution: Players pair up at a distance of 10 meters and throw to each other. The receiver should position the glove correctly and catch the ball.
        Volume: 50 throws per player
        Recommendations: Emphasize proper body position in front of the ball; always keep both hands ready for reception.
        """))
        easy.append(.init(image: "easyLvl4", title: "Defensive Footwork", descriptions: """
        Goal: Develop proper movement for fielding
        Execution: Coach or partner throws balls at various distances. Player must quickly position themselves in front of the ball, correctly field it, and simulate a throw.
        Volume: 30 receptions from various positions
        Recommendations: Move with small steps while maintaining balance. Don't cross your feet during lateral movements.
        """))
        easy.append(.init(image: "easyLvl5", title: "Throw Accuracy Development", descriptions: """
        Goal: Improve throwing precision
        Execution: Set up a target (or partner with a glove) and throw from different distances (10-25 meters).
        Volume: 40 throws with gradually increasing distance
        Recommendations: Focus on proper ball grip, torso work, and wrist follow-through. Proper ball rotation is more important than initial velocity.
        """))
        easy.append(.init(image: "easyLvl6", title: "Basic Base-to-Base Sprint", descriptions: """
        Goal: Develop speed and understanding of distances between bases
        Execution: Perform a series of sprints from home plate to first base, then from first to second, etc.
        Volume: 8-10 sprints between each pair of bases
        Recommendations: Practice proper starting technique, maximum acceleration in the first 3-5 steps, and proper base-touching technique.
        """))
        easy.append(.init(image: "easyLvl7", title: "Fly Ball Catching", descriptions: """
        Goal: Master technique for catching balls in the air
        Execution: Coach or partner tosses balls at different heights. Player must position correctly and catch the ball.
        Volume: 25 high balls
        Recommendations: Learn to properly judge trajectory, always catch with two hands above your head when possible.
        """))
        easy.append(.init(image: "easyLvl8", title: "Base Sliding Practice", descriptions: """
        Goal: Master safe sliding technique
        Execution: On a soft surface or special sliding track, practice sliding to a base.
        Volume: 15-20 repetitions
        Recommendations: Start at low speed, focusing on technique. Bend one leg underneath you, extend the other toward the base. Keep hands raised to avoid injuries.
        """))
        easy.append(.init(image: "easyLvl9", title: "Basic Pitching Training", descriptions: """
        Goal: Master basic pitching mechanics
        Execution: Perform pitching simulation without a ball, then with a ball at short distance (5-10 meters).
        Volume: 30 simulations, 20 actual pitches
        Recommendations: Focus on movement sequence, proper torso work, and balance. Speed is not important at this stage.
        """))
        easy.append(.init(image: "easyLvl10", title: "Basic Tactical Understanding", descriptions: """
        Goal: Develop basic understanding of game situations
        Execution: Model simple game situations (e.g., runner on first base, ball hit to second baseman).
        Volume: 15-20 minutes of analyzing various situations
        Recommendations: Discuss and demonstrate proper actions in each situation, allow players to ask questions.
        """))
        
        medium.append(.init(image: "mediumLvl1", title: "Hitting Moving Balls from Different Directions", descriptions: """
        Goal: Improve ability to hit various types of pitches
        Execution: Pitcher or pitching machine delivers balls at different heights and speeds. Batter must adapt and hit effectively.
        Volume: 4 sets of 15 swings
        Recommendations: Analyze technique between sets and adjust batting zone position. Practice recognizing pitch type in the first milliseconds.
        """))
        medium.append(.init(image: "mediumLvl2", title: "Bunting and Contact Hitting", descriptions: """
        Goal: Master tactical hitting for advancing runners
        Execution: Perform bunts on balls pitched from different zones. Learn to direct the ball to specific areas of the field.
        Volume: 25-30 bunts to different zones
        Recommendations: Hold the bat at a 45-degree angle, absorb the hit rather than pushing the ball. Practice both standard bunts and drag bunts (with movement toward first base).
        """))
        medium.append(.init(image: "mediumLvl3", title: "Situational Defense and Ball Reception", descriptions: """
        Goal: Develop reaction and positioning in defense
        Execution: Coach hits or throws balls to different zones at varying speeds. Players must react, perform correct movements, and make accurate throws.
        Volume: 30-40 situations per player
        Recommendations: Create various scenarios: fast balls, slow rollers, bounces. Practice communication between players.
        """))
        medium.append(.init(image: "mediumLvl4", title: "Advanced Base Running Footwork", descriptions: """
        Goal: Improve starting technique and turns on bases
        Execution: Perform exercises for quick starts, proper base touching when turning, and efficient acceleration.
        Volume: 12-15 runs focusing on different elements
        Recommendations: When turning on a base, use the inside of your foot, lean your body inward, and reduce the movement trajectory. Practice reading pitcher actions before starting.
        """))
        medium.append(.init(image: "mediumLvl5", title: "Throws from Different Positions", descriptions: """
        Goal: Develop throwing accuracy while moving and from awkward positions
        Execution: Player receives the ball while moving or in a difficult position and immediately throws to a base.
        Volume: 35-40 throws from various positions
        Recommendations: Practice throwing while jumping, turning, and after quickly rising from the ground. Maintaining balance and control even in difficult situations is important.
        """))
        medium.append(.init(image: "mediumLvl6", title: "Advanced Pitching Technique", descriptions: """
        Goal: Develop control and variety of pitches
        Execution: Practice different types of grips and pitches with focus on accurately hitting the strike zone.
        Volume: 40-50 pitches of various types
        Recommendations: Start by mastering the fastball with good control, then add a changeup (slow pitch with the same mechanics). Work on consistency in mechanics.
        """))
        medium.append(.init(image: "mediumLvl7", title: "Two-Way Outfielder Drills", descriptions: """
        Goal: Improve ball handling skills in the deep field
        Execution: Coach hits or uses a machine to send balls to the outfield. Players must catch the ball and make an accurate throw to the needed base.
        Volume: 20-25 complex actions
        Recommendations: Practice various situations: balls over the head, balls rolling past, bounces off the wall. Learn to quickly determine where to throw the ball.
        """))
        medium.append(.init(image: "mediumLvl8", title: "Situational Hitting", descriptions: """
        Goal: Develop tactical thinking when batting
        Execution: Model game situations (e.g., runner on third, one out) and practice appropriate hits (fly ball to outfield, hit to the right side, etc.).
        Volume: 30 hits in various situations
        Recommendations: Emphasize understanding the objective for each situation and adapting hitting technique to that task.
        """))
        medium.append(.init(image: "mediumLvl9", title: "Advanced Defensive Movements", descriptions: """
        Goal: Develop speed and coordination during defensive actions
        Execution: Perform exercises for quick direction changes, jumping for balls, falling and rolling with quick recovery.
        Volume: 20-25 minutes of comprehensive training
        Recommendations: Practice safe techniques for falling and rolling. Learn to instantly transition from defensive actions to throwing.
        """))
        medium.append(.init(image: "mediumLvl10", title: "Baserunning and Base Stealing Strategy", descriptions: """
        Goal: Develop skills for effective base advancement
        Execution: Practice proper lead-offs, reading pitcher movements, determining the moment for stealing.
        Volume: 15-20 stealing attempts from different bases
        Recommendations: Learn to read pitcher movements, determine their rhythm, and choose the optimal moment to start. Develop explosive first movement.
        """))
        
        hard.append(.init(image: "hardLvl1", title: "Advanced Hitting Against Diverse Pitches", descriptions: """
        Goal: Master hitting complex pitches to any zone
        Execution: Training against a pitcher with diverse arsenal or against a machine simulating various pitch types (fastball, slider, curveball, etc.).
        Volume: 5 sets of 15 pitches of various types
        Recommendations: Analyze pitcher mechanics to determine upcoming pitch type. Develop ability to keep hands back until the last moment and quickly adapt to ball movement.
        """))
        hard.append(.init(image: "hardLvl2", title: "Extreme Defense and Throw", descriptions: """
        Goal: Practice defensive actions in extreme situations
        Execution: Perform ball receptions while jumping, falling, with 360° turns followed by accurate throws.
        Volume: 30 complex defensive actions
        Recommendations: Practice transitioning from difficult reception to throw in one fluid motion. High accuracy is important even in the most difficult body positions.
        """))
        hard.append(.init(image: "hardLvl3", title: "High-Speed Throws with Maximum Accuracy", descriptions: """
        Goal: Develop power and accuracy of throws
        Execution: Perform throws with maximum force while maintaining accuracy in hitting the target or partner's glove.
        Volume: 35-40 full-power throws
        Recommendations: Work on whole-body technique: proper weight transfer, torso rotation, shoulder work, and finishing wrist motion. Control mechanics even at maximum effort.
        """))
        hard.append(.init(image: "hardLvl4", title: "Advanced Pitching with Pitch Variety", descriptions: """
        Goal: Master different pitch types and their combinations
        Execution: Practice 3-4 different pitch types focusing on identical movement mechanics but different results.
        Volume: 50-60 pitches with type alternation
        Recommendations: Master slider, curveball, or other pitch types in addition to fastball and changeup. Work on disguising pitch type – your mechanics should look the same for all types.
        """))
        hard.append(.init(image: "hardLvl5", title: "Complex Tactical Exercises", descriptions: """
        Goal: Integrate all skills into real game situations
        Execution: Model complete game episodes with runners on bases, game score, and specific objectives.
        Volume: 8-10 full game situations
        Recommendations: Create maximally realistic scenarios, including score pressure and stress. Practice decision-making and communication between players.
        """))
        hard.append(.init(image: "hardLvl6", title: "Extreme Baserunning", descriptions: """
        Goal: Master advancement and base stealing in complex situations
        Execution: Practice stealing against a real pitcher-catcher combination, including double steals, delayed steals, and other advanced techniques.
        Volume: 20 attempts of complex steals
        Recommendations: Develop ability to quickly change decisions based on pitcher and catcher actions. Learn proper sliding techniques to avoid tag-outs.
        """))
        hard.append(.init(image: "hardLvl7", title: "Opposite-Field Hitting", descriptions: """
        Goal: Develop ability to hit to the opposite side of the natural field
        Execution: Focused training on hitting to a specified zone opposite to the hitter's natural direction.
        Volume: 4 sets of 15 hits
        Recommendations: Work on delaying the swing for right-handed hitters (or accelerating for left-handed) when directing the ball to right field. Change position in the box to facilitate the task.
        """))
        hard.append(.init(image: "hardLvl8", title: "Power Hitting for Distance", descriptions: """
        Goal: Develop hitting power for home runs
        Execution: Practice long-distance hits with full lower body engagement and correct bat trajectory.
        Volume: 3 sets of 15 hits with maximum power
        Recommendations: Focus on powerful hip rotation and correct angle of bat contact with the ball. It's important to maintain balance and control even at maximum effort.
        """))
        hard.append(.init(image: "hardLvl9", title: "Pitcher-Batter Sparring", descriptions: """
        Goal: Simulate real competitive situations
        Execution: Full pitcher vs. batter confrontations with different counts and situations.
        Volume: 4-5 complete "at-bats" for each player
        Recommendations: Create various game scenarios (0-2, 3-1 count, etc.). Pitcher and batter should develop strategy based on the situation.
        """))
        hard.append(.init(image: "hardLvl10", title: "High-Intensity Combined Training", descriptions: """
        Goal: Maintain high level of all skills during fatigue
        Execution: Chain of exercises covering all game aspects without lengthy pauses between them.
        Volume: 30-40 minutes of high-intensity work
        Recommendations: Simulate physical and psychological fatigue of late innings. Players should maintain accuracy and concentration even with accumulated fatigue.
        """))
        
        storage.store(item: .init(easyExers: easy, mediumExers: medium, hardExers: hard))
    }
}
