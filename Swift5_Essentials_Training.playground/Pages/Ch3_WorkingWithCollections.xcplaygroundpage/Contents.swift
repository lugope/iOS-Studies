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

