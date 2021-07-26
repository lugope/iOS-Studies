import Foundation

// MARK: Variaveis e Constantes
// Declara variável que pode ser modificada a qualquer instante
var currentHealth = 90
var numberItens = 5, equipmentsSlots = 3, currentGold = 42
// Declara constante que não pode ter valor modificado depois de definido
let maxHealth = 100


// MARK: Type Safety and Inference
// Swift é uma linguagem fortemente tipada então uma variavel deve ter um tipo específico e deve receber um valor que corresponde a esse tipo. As notações abaixo também servem para constantes
//Type inference (Infere que é do tipo Int)
var health = 100
//Type annotation + inference
var charName: String = "King John"


// MARK: Operadores
// Aritméticos (+, -, *, /)
var usingMath = 5 + 4 - 3 / 2 * 1
// Composto (+=, -=, /=, *=, %=)
usingMath += 10
//Módulo (%)
var experienceOverflow = 100 % 90


// MARK: Strings
//Declarando Strings
var activeQuest: String = "Kill 5 pigs"
//Concatenação
var questDifficulty = "Nightmare"
var questInfo = activeQuest + " -> " + questDifficulty
questInfo += "!!!"
//Interpolação de String
var questInfoIterpolated = "You're not ready to \(activeQuest) yet, it's \(questDifficulty) level"


// MARK: Working with strings
var dialogue = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
//String data
dialogue.count
dialogue.isEmpty
dialogue.contains("Lorem") //Is case sensitive
//Append and insert, remove and split
dialogue.append("!")
dialogue.removeLast()
dialogue.split(separator: ",")


// MARK: Type Conversions
var currentGold_Double = 5.832
// Explicit Conversion
var currentGold_Int: Int = Int(currentGold_Double)
var currentGold_String = String(currentGold_Double)
// Inferred conversion with operators
var bankDeposit = 37 + 5.892
var bankDeposit_explicit = currentGold_Double + Double(currentGold_Int)


// MARK: Bools and logical operators
var isActive: Bool = false
// Logical operators (!, &&, ||)


// MARK: Optionals
/// Optional variables tell the compiler that the variable is either storing  value or storing nothing, which is useful when you need place holders for potentially unknown values. You can do a forced enwrapping in a optional value to use the placeholder value if it exists, but you need to be careful because it assumes that the optional variable ir holding a non-nil value and it may crash the code.
// Creating optionals
var itemGathered: String? = "Pickaxe"
var isExchangeable: Bool?
// Forced unwrapping
print(itemGathered!)





