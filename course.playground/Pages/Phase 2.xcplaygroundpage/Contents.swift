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
