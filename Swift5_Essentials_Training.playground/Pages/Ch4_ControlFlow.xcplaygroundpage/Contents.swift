//MARK: The if statement
var currentHealth = 95
var maxHealth = 100
// If statement (<, >, <=, >=, !=, ==)
if currentHealth >= maxHealth {
    print("HP is maximum")
} else if currentHealth <= 50 {
    print("Grab some helth soon!")
} else if currentHealth > 90 && currentHealth <= 100{
    print("It's fine :)")
} else {
    print("I don't know what I'm doing...")
}


//MARK : Using for-in loops
let myString = "hello world"
let testItems: [String] = ["item1", "item2", "item3"]
let testDictionary: [String: Int] = ["a": 1, "b": 2, "c": 3]
// Strings and arrays
for strigCharacter in myString {
    print(strigCharacter)
}
for testItem in testItems {
    print(testItem)
}
// Dictionary key-value
for (key, value) in testDictionary {
    print("\(key): \(value)")
}
for justValue in testDictionary.values {
    print(justValue)
}
// Using ranges
for indexNumber in 1...10 {
    print(indexNumber)
}
for item in testItems[0...] {
    print(item)
}
for item in testItems[...testItems.count] {
    print(item)
}


//MARK: While loops
var playerHealth = 10
while playerHealth > 0 {
    playerHealth -= 1
    print("take a hit")
}


//MARK: switch statement
let initial = "H"
let hp = 26
let mp = 24

switch initial {
case "H":
    print("Maybe you're Haroldo el magias!")
case "A":
    print("Anitta?")
default:
    print("Can't guess")
}
//Complex variations
switch (hp, mp) {
case (15, 10):
    print("Good boy!")
case (1...15, 20..<25):
    print("Look at these ranges")
default:
    print("I've got nothing...")
}


//MARK: The guard statement
///The guard statement acts like a  gate keeper . Code execution can only get past them if their condition is true
let shopItems = ["Magic wand": 10, "Iron helmet": 5, "Excalibur": 1000]
let currentGold = 30

for (item, price) in shopItems {
    guard currentGold < price else {
        print("You can't afford \(item)")
        continue //This will keep the loop happening
    }
    
    print("You can buy the \(item) for \(price)")
}
