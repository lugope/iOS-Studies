import Foundation
//Chapter 5 challenges
//1
typealias Attack = (name: String, damage: Int)

//2
func attackEnemy(damage: Int) -> Void{
    print("Enemy attacked with damage \(damage)")
}

//3
func attackEnemy(attack: Attack) -> String {
    let attackMessage = "Enemy used \(attack.name) and made a damage of value \(attack.damage)!"
    return attackMessage
}

//4
attackEnemy(damage: 30)
let myAttack: Attack = ("Sun Beam", 40)
let message: String = attackEnemy(attack: myAttack)
print(message)

//5
typealias AttackClosure = ([Attack])->Void
let attack1: Attack = ("Attack name 1", 40)
let attack2: Attack = ("Attack name 2", 50)
let attack3: Attack = ("Attack name 3", 60)
let testArray: [Attack] = [attack1, attack2, attack3]

//6
func fetchPlayerAttacks(closure: AttackClosure) {
    closure(testArray)
}

//7
fetchPlayerAttacks { attacks in
    for attack in attacks{
        print("\(attack.name) with damage \(attack.damage)")
    }
}
