//MARK: Basic Function
func findAlly(level: Int) -> String {
    print("Searching for ally \(level)")
    return "Marcus"
}

var nearestAlly = findAlly(level: 5)

//----------------------------------------
//MARK: Overloading funciton
// Base fucntion
func attackEnemy() {
    print("Executing attack")
}
// Overloaded functions
func attackEnemy(damage: Int) {
    print("Attacking for \(damage)")
}
func attackEnemy(damage: Int, weapon: String) -> Bool {
    let attackSuccess = true
    print("Attacking for \(damage) with \(weapon)")
    
    return attackSuccess
}

attackEnemy()
var isAttackSuccess = attackEnemy(damage: 5, weapon: "Morning Star")

//----------------------------------------
//MARK: Complex functions
//Optional return value
func setupArenaMatch() -> Bool? {
    return false
}

if let initSuccess = setupArenaMatch() {
    print("Level initialized: \(initSuccess)")
} else {
    print("Some thing went wrong")
}

//Multiple return values
func setupArenaMatch(levelName: String) -> (success: Bool, secretItem: String){
    print("Initializing \(levelName)...")
    
    return (true, "Sant Graal")
}

var levelDetails = setupArenaMatch(levelName: "Poison Flats")
levelDetails.secretItem
levelDetails.success

//Default Values
func setupDefaultMatch(levelName: String = "Fire Forest", opponents: Int = 3) {
    print("Arena match will take place in the \(levelName) between \(opponents) players!")
}

setupDefaultMatch()
setupDefaultMatch(levelName: "Poison Flats", opponents: 10)

//----------------------------------------
//MARK: Function types
// (Int) -> Int
func computeBonusDamage(baseDamage: Int) -> Int {
    return baseDamage * 2
}
// Function as parameter
func dealDamage(baseDamage: Int, bonusDamage: (Int)->Int) {
    let bonus = bonusDamage(baseDamage)
    print("Base damage: \(baseDamage)\nBonus damage: \(bonus)")
}
dealDamage(baseDamage: 3, bonusDamage: computeBonusDamage)

//----------------------------------------
//MARK: Understanding Closures
///Like functions, closures are enclosed blocks of functionality. In swift closures act like blocks of lambda expressions
//Definig closure
var closure: ()->() = {}
//Initializing closure
var computeBonusDamage2 = { base in
    return base * 4
}
computeBonusDamage2(25)

//----------------------------------------
//MARK: Using Closures
var highScores = [3421, 0, 1988, 722]
var partyMembers = ["Harrison", "Steven", "Bob the Noob"]
// Existing functions with closure
var ascendingSort = highScores.sorted { (firstValue, secoundValue) -> Bool in
    return firstValue < secoundValue
}

// Using custom closures with functions
func activeMembers(completition: ([String]) -> Void) {
    completition(partyMembers)
    
    print("**Estou acontecendo além da closure**\n")
}

activeMembers { (members) in
    for name in members {
        print("\(name) is active!!!")
    }
}

// Another way of using custom closures with functions
func activeMembers(members: [String]) -> ()->Void {
    let completion: ()->Void = {
        for name in members {
            print("\(name) is active!!")
        }
    }

    return completion
}

var closureReturn = activeMembers(members: partyMembers)
closureReturn()

//----------------------------------------
//MARK: Type Aliasing
//Type alias as a return value
typealias AttackTupple = (name: String, damage: Int, rechargeable: Bool)
var sunBeam: AttackTupple = ("Sun Beam", 45, false)

func levelUpAttack(baseAttack: AttackTupple) -> AttackTupple {
    let increasedAttack: AttackTupple = (baseAttack.name, baseAttack.damage + 10, true)
    return increasedAttack
}
var poweredAttack = levelUpAttack(baseAttack: sunBeam)

//Type alias as a function parameter
typealias ArrayClosure = ([String])->Void
func activeMembers2(completition: ArrayClosure) {
    completition(partyMembers)
    
    print("**Estou acontecendo além da closure**\n")
}

activeMembers2 { (members) in
    for name in members {
        print("\(name) is active!!!")
    }
}
//----------------------------------------
