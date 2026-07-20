import Foundation
import UIKit

//struct
struct Player {
    let name: String
    var health: Int
    var isAlive: Bool
    
    func sayHello(){
        print("Hi, I'm \(name)! My health is \(health) HP")
    }
    func showStats(){
        print("Health: \(health)")
    }
    mutating func takeDamage(amount: Int){
        health -= amount
        if health <= 0 {
            isAlive = false
            print("\(name) died")
        }
    }
}
var playerOne = Player(name: "Arthur", health: 100, isAlive: true)
playerOne.sayHello()
var playerTwo = Player(name: "Merlin", health: 50, isAlive: true)

struct SpaceShip{
    let name: String
    var fuelLevel: Int
    func status(){
        print("Ship's name: \(name), fuel level is \(fuelLevel)")
    }
    mutating func fly(distance: Int) {
        fuelLevel -= distance
    }
}
var spaceShipOne = SpaceShip(name: "Victoria", fuelLevel: 100)
spaceShipOne.status()
spaceShipOne.fly(distance: 50)
spaceShipOne.status()

// class
class Hero{
    var name: String
    var hp: Int
    init(name: String, hp: Int){
        self.name = name
        self.hp = hp
    }
}
let myHero = Hero(name: "Alex", hp: 100)

class SmartBulb{
    var roomName: String
    var isOn: Bool
    init(roomName: String, isOn: Bool){
        self.roomName = roomName
        self.isOn = isOn
    }
    func toggle(){
        if isOn{
            isOn = false
        }
        else{
            isOn = true
        }
        print("Light in \(roomName) is now \(isOn)")
    }
}
let kitchenBulb = SmartBulb(roomName: "kitchen", isOn: false)
let sharedBulb = kitchenBulb
sharedBulb.toggle()
print(kitchenBulb.isOn)

struct UserProfile{
    let login: String
    let status: String?
    let age: Int?
    func showProfile(){
        print(login)
        if let safeStatus = status {
            print(safeStatus)
        }
        else{
            print("Status isn't set")
        }
        let safeAge = age ?? 0
        print(safeAge)
    }
}
let user1 = UserProfile(login: "adam01", status: "Married", age: 25)
let user2 = UserProfile(login: "platina300", status: nil, age: nil)
user1.showProfile()
user2.showProfile()

func upgradeWeapon(weapon: String?, level: Int?, costGold: Int?){
    guard let safeWeapon = weapon, var safeLevel = level, var safeCostGold = costGold
    else {
        print("Error: Not enough data for improvement")
        return
    }
    safeLevel += 1
    safeCostGold -= 50
    print("Weapon \(safeWeapon) improved to level \(safeLevel). Gold balance: \(safeCostGold)")
}
upgradeWeapon(weapon: "Excalibur", level: 5, costGold: 150)
upgradeWeapon(weapon: "Bow", level: nil, costGold: 200)
upgradeWeapon(weapon: nil, level: 3, costGold: nil)

struct Processor {
    let model: String
}
struct Computer {
    let brand: String
    let cpu: Processor?
}
struct Programmer {
    let name: String
    let pc: Computer?
}
let myChip = Processor(model: "Apple M4")
let myMac = Computer(brand: "Macbook", cpu: myChip)
let steve = Programmer(name: "Steve", pc: myMac)

let emptyComputer = Computer(brand: "Windows PC", cpu: nil)
let bill = Programmer(name: "Bill", pc: emptyComputer)
let linus = Programmer(name: "Linus", pc: nil)

struct Engine  {
    let power: Int
}
    struct Car {
        let brand:String
        let engine: Engine?
    }
    struct Person {
        let name: String
        let car: Car?
    }

func printEnginePower (ofPerson: Person){
    let safePower = ofPerson.car?.engine?.power ?? 0
    print("The power of engine: \(safePower)")
}

let engineBmw = Engine(power: 150)
let bmw = Car(brand: "BMW", engine: engineBmw)
let adam = Person(name: "Adam", car: bmw)
printEnginePower(ofPerson: adam)
let skoda = Car(brand: "Skoda", engine: nil)
let petr = Person(name:"Petr", car: skoda)
printEnginePower(ofPerson: petr)
let james = Person(name: "James", car: nil)
printEnginePower(ofPerson: james)

protocol Coach{
    var name: String {get}
    func blowWhistle()
    func conductPractice()
}
struct HockeyCoach: Coach {
    var name: String
    func blowWhistle(){
        print("Feeew! Everebody skate!")
    }
    func conductPractice(){
        print("Training shots, 1 vs 1 drils, powerplay tactics")
    }
}
protocol Driver {
    func driveBus()
}
struct MultiTaskingCoach: Coach, Driver {
    var name: String
    func blowWhistle(){
        print("Whistle!")
    }
    func conductPractice(){
        print("Training session started")
    }
    func driveBus(){
        print("I'm starting engine, we are going to road game")
    }
}
extension Coach {
    func motivateTeam(){
        print("Let's go boys, we gona win!")
       
    }
}

protocol Account {
    var balance: Double{ get }
}
struct Cash: Account {
    var balance: Double
}
struct BankAccount: Account{
    var balance: Double
    var cardNumber: String
}
struct CryptoWallet: Account {
    var balance: Double
    var walletAddress: String
}
let allMyMoney: [Account] = [
    Cash(balance: 150.0),
    BankAccount(balance: 1250.0, cardNumber: "************"),
    CryptoWallet(balance: 800.0, walletAddress: "0xABC")
]
var totalWealth = 0.0
for account in allMyMoney{
    totalWealth += account.balance
}
print(totalWealth)

extension Double {
    var m: Double{
        return self
    }
    var km: Double{
        return self * 1000.0
    }
    var cm: Double {
        return self / 100.0
    }
}
let marathon = 42.195.km
let myHeight = 183.0.cm
print(marathon)
print(myHeight)

extension String{
    func printWithStars(){
        print("***\(self)***")
    }
}
let greeting = "Hello, world!"
greeting.printWithStars()
"Error of download".printWithStars()

struct FootballCoach {
    var name: String
    var age: Int
}
extension FootballCoach: Coach{
    func conductPractice() {
        print("Kick a ball")
    }
    
    func blowWhistle(){
        print("Whistle!")
    }
    func conductTraining(){
        print("Start warmup")
    }
}
extension FootballCoach: Driver{
    func driveBus(){
        print("Driving to arena")
    }
}

func printAnything<T>(value: T){
    print("Your value: \(value)")
    print("Done!")
}
printAnything(value: 100)
printAnything(value: "Hello!")
printAnything(value: 45.5)

struct Box<Item>{
    var content: Item
}
let intBox = Box(content:25)
let stringBox = Box(content: "New sneakers")

func checkEquality<T: Equatable>(first: T, second: T){
    if first == second{
        print("They are equal")
    }else{
        print("They are different")
    }
}
checkEquality(first: 10, second: 10)
checkEquality(first: "A", second: "B")

enum ATMError: Error {
    case invalidPin
    case insufficientFunds(shortage: Double)
    case machineOutOfCash
}
func withdrawCash(amount: Double, pin: String, accountBalance: Double) throws -> Double{
    if pin != "1234"{
        throw ATMError.invalidPin
    }
    if amount > accountBalance{
        let missingMoney = amount - accountBalance
        throw ATMError.insufficientFunds(shortage: missingMoney)
    }
    let newBalance = accountBalance - amount
    return newBalance
}
let myBalance = 1000.0
do {
    let balanceAfterWithdrawal = try withdrawCash(amount: 1500, pin: "1234", accountBalance: myBalance)
    print("Success! Take your money. Your available balance: \(balanceAfterWithdrawal)")
} catch ATMError.invalidPin{
    print("Incorrect PIN. Try again")
} catch ATMError.insufficientFunds(let shortage){
    print("Error: Not enough money on your account. Your missing amount: \(shortage)")
} catch {
    print("Unknown error")
}
let result = try? withdrawCash(amount: 500, pin: "0000", accountBalance: 1000)
if result != nil{
    print("Take money")
} else {
    print("Something went wrong")
}
let forceResult = try! withdrawCash(amount: 10, pin: "1234", accountBalance: 99999)
print(forceResult)

enum GameError: Error{
    case invalidInput
}
func choiceCheck(choice: String) throws -> String {
    if choice == "p" || choice == "s" || choice == "r"{
        return "Good move"
    }else {
        throw GameError.invalidInput
    }
}
let myMove = "r"
do {
   let result =  try choiceCheck(choice: myMove)
    print(result)
}catch GameError.invalidInput{
    print("""
        Enter exactly "p", "s" or "r"
        """)
} catch {
    print("unknownError")
}

enum PlayerAccess: Error{
    case youngAge(shortage: Int)
    case missingItem(item: Set<String>)
    case injury
}
func iceAccess (age: Int, injury: Bool, equipment: [String]) throws -> String{
    if age < 5{
        let missingYears = abs(age - 5)
        throw PlayerAccess.youngAge(shortage: missingYears)
    }
    if injury {
        throw PlayerAccess.injury
    }
    let requiredEquipment = ["helmet", "skates", "elbows", "shoulders", "pants", "pats", "stick"]
    if !Set(requiredEquipment).isSubset(of:Set(equipment)){
        let missingItems = Set(requiredEquipment).subtracting(Set(equipment))
        throw PlayerAccess.missingItem(item: missingItems)
       
    }
    return "You are good to go"
    }
do {
    let result = try iceAccess(age: 5, injury: false, equipment: ["skates", "elbows", "shoulders", "pants", "pats", "helmet", "stick"])
    print(result)
} catch PlayerAccess.youngAge(let shortage) {
    print("You are \(shortage) year(s) younger than 5")
} catch PlayerAccess.injury{
    print("You are injured and not allowed to participate in trainings until doctor will approve")
} catch PlayerAccess.missingItem(let items){
    let itemsString = items.joined(separator: ", ")
    print("You are missing \(itemsString) to participate on ice")
}catch {
    print("Something went wrong, ask your coach's approve to participate in training session")
}
