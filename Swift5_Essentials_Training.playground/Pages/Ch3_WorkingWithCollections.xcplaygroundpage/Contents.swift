import Foundation

// MARK: Swift Arrays
//Creating Arrays
var levelDifficulty: [String] = ["Easy", "Normal", "Hard", "Nightmare"] //Can be empty adding just []
var extraSyntax1: Array<String> = Array<String>()
//Count and isEmpty
levelDifficulty.count
levelDifficulty.isEmpty
//Accessing array values
var mostDifficult = levelDifficulty[3]
levelDifficulty[3] = "Are you kidding me?"


// MARK: Core Array Methods
//Changing and appending itens
var characterClasses = ["Ranger", "Mage", "Paladin"]
characterClasses.append("Gunslinger")
characterClasses += ["Berserker", "Healer"]
//Inserting and removing
characterClasses.insert("BeastMaster", at: 2)
characterClasses.remove(at: 1)
//Ordering and querying values
characterClasses.reverse()
var reversedClasses = characterClasses.reversed()
characterClasses.sort()
var sortedClasses = characterClasses.sorted()
//2D arrays
var skillTree: [[String]] = [
    ["Attack+", "Barrage", "Heavy Hitter"],
    ["Guard+", "Evasion", "Run"]
]
var attackTreeSkill = skillTree[0][2]


// MARK: Swift Dictionaries
var blacksmithShop: [String: Int] = ["Bottle": 10, "Shield": 15, "Ocarina": 1000]
//Accessing and modifying values
var shieldPrice = blacksmithShop["Shield"]
blacksmithShop["Bottle"] = 5
blacksmithShop["Towel"] = 42 //If the key doesn't exist swift will add the new element automatically
//All keys and values
var allKeys = [String](blacksmithShop.keys)
var allValues = [Int](blacksmithShop.values)


//MARK: Core dictionary methods
//Caching and overwriting items
var playerStats: [String: Int] = ["HP":100, "Attack":35, "Gold":29]
var oldValue = playerStats.updateValue(30, forKey: "Attack")
//Caching and removing
var removedValue = playerStats.removeValue(forKey: "Gold")
//Nested dictionaries
var questBoard = [
    "Fetch Gemstone": [
        "Objective": "Retrieve 4 gemstones",
        "Challenge": "Complete under 5 minutes"
    ],
    "Defeat the boss": [
        "Objective": "Beat the Boss",
        "Challenge": "Don't get hit"
    ]
]
var gemstoneObjective = questBoard["Fetch Gemstone"]?["Objective"]


//MARK: Working with Sets
///Setts are great tools if you need to store unique , unordered values in a collection, as opposed to arrays and dictionaries which can hold duplicates
var setOfNames: Set = ["Jorge", "Pedro", "Lucas"]
//Inserting and removing elements
setOfNames.insert("Bia")
setOfNames.remove("Lucas")
//More common methods
setOfNames.contains("Wanderson")
setOfNames.sorted()


//MARK: Set core methods
var activeQuests: Set = ["Fetch Gemstones", "Big Boss", "The Undertaker"]
var completedQuests: Set = ["Big Boss", "All-4-One", "The Hereafter"]
//Set operations
var commomQuests = activeQuests.intersection(completedQuests)
var differentQuests = activeQuests.symmetricDifference(completedQuests)
var allQuests = activeQuests.union(completedQuests)
var clippedQuests = activeQuests.subtracting(completedQuests)


//MARK: Swift Tuples
///Tuples have the hability to store values of different types
//Simple tuple
var uppercutAttack: (String, Int, Bool) = ("Uppercut Smash", 25, true)
uppercutAttack.0
uppercutAttack.1
uppercutAttack.2
var (attack, damage, rechargeable) = uppercutAttack
attack
damage
rechargeable
//Naming tuple values
var planetSmash = (name: "Planet Smash", damage: 100, rechargeable: false)
planetSmash.name
planetSmash.damage
planetSmash.rechargeable
//Naming with type notation
var shieldStomp: (name: String, damage: Int, rechargeable: Bool)
shieldStomp.damage = 100
