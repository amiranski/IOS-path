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

enum NetworkError: Error{
    case noInternet
    case serverDown
}
func fetchMatchResult(hasInternet: Bool) -> Result<String, NetworkError>{
    if !hasInternet {
        return .failure(.noInternet)
    }
    return .success("We won! Game score 3:1")
}
let downloadStatus = fetchMatchResult(hasInternet: true)
switch downloadStatus {
case .success(let matchScore):
    print("News: \(matchScore)")
case .failure(let error):
    print("Couldn't download data. Reason: \(error)")
}
let someResult = fetchMatchResult(hasInternet: false)
do {
    let text = try someResult.get()
    print(text)
}catch{
    print("Error during unpacking: \(error)")
}

struct TelegramUser {
    let name: String
    var age: Int
    var isOnline: Bool
    let phoneNumber: String
}
var myProfile: TelegramUser = TelegramUser(name: "Amiran", age: 21, isOnline: true, phoneNumber: "+123456789")
var friendProfile: TelegramUser = TelegramUser(name: "Alex", age:25, isOnline: false, phoneNumber: "+987654321")
func sendMessage(to user: TelegramUser, text: String){
    
}

struct BankAccountStruct {
    static let bankName: String = "Global Bank"
    @MainActor static var totalAccounts: Int = 0
    var owner: String
    var balance: Int
    @MainActor init(owner: String, balance: Int){
        self.owner = owner
        self.balance = balance
        BankAccountStruct.totalAccounts += 1
    }
    static func printBankRules(){
        print("Rules of bank \(bankName): Do not give your personal information")
    }
    func showBalance(){
        print("Balance of \(owner): $\(balance)")
    }
}
let account1 = BankAccountStruct(owner: "Amiran", balance: 1000)
let account2 = BankAccountStruct(owner: "Alex", balance: 500)
account1.showBalance()
account2.showBalance()
BankAccountStruct.printBankRules()
print("Total opened accounts: \(BankAccountStruct.totalAccounts)")

class HockeyPlayer {
    var name: String
    var goals: Int
    init(name: String, goals: Int){
        self.name = name
        self.goals = goals
    }
}
let hockeyPlayerOne = HockeyPlayer(name: "Alex", goals: 10)
let hockeyPlayerTwo = hockeyPlayerOne
hockeyPlayerTwo.goals = 50
print(hockeyPlayerOne.goals)

class Team {
    var teamName: String
    var city: String
    var isActive: Bool
    
    init(teamName: String, city: String, isActive: Bool){
        self.teamName = teamName
        self.city = city
        self.isActive = isActive
    }
}

struct TeamStats {
    var teamName: String
    var wins: Int
    var losses: Int
    var totalGames: Int {
        return wins + losses
    }
}
var myTeam = TeamStats(teamName: "Wolves", wins: 10, losses: 5)
print(myTeam.totalGames)
myTeam.wins = 15
print(myTeam.totalGames)

struct BankAccountApp {
    var balanceInDollars: Double
    var balanceInEuros: Double {
        get {
            return balanceInDollars * 0.9
        }
        set(newEuroAmount){
            balanceInDollars = newEuroAmount / 0.9
        }
    }
}
var myAccount = BankAccountApp(balanceInDollars: 1000)
print(myAccount.balanceInEuros)
myAccount.balanceInEuros = 1800
print(myAccount.balanceInDollars)

class Employee {
    var name: String
    init (name: String){
        self.name = name
    }
    func doWork(){
        print("\(name) is filling papers")
    }
}
class Manager: Employee {
    override func doWork(){
        print("\(name) is giving tasks to team and drinking coffee")
    }
}
let regularWorker = Employee(name: "Ivan")
regularWorker.doWork()
let boss = Manager(name: "Anna")
boss.doWork()

class ChatMessage {
    var text: String
    var sender: String
    var isRead: Bool
    var time: String
    init (text: String, sender: String, isRead: Bool, time: String){
        self.text = text
        self.sender = sender
        self.isRead = isRead
        self.time = time
    }
    convenience init(text: String, sender: String){
        self.init(text: text, sender: sender, isRead: false, time: "Right now")
    }
}
let oldMessage = ChatMessage(text: "Hello", sender: "Adam", isRead: true, time: "Yesterday at 3 PM")
let newMessage = ChatMessage(text: "How are you?", sender: "Adam")

class Document {
    var id: String
    required init(id: String){
        self.id = id
    }
}
class CreditContract: Document {
    var amount: Int
    init(id: String, amount: Int){
        self.amount = amount
        super.init(id: id)
    }
    required init(id: String){
        self.amount = 0
        super.init(id: id)
    }
}

class TelegramUsers {
    var username: String
    var age: Int
    init?(username: String, age: Int){
        if age < 0{
            return nil
        }
        if username.isEmpty{
            return nil
        }
        self.username = username
        self.age = age
    }
}
let goodUser = TelegramUsers(username: "Adam", age: 21)
let badUser = TelegramUsers(username: "Alex", age: -5)
if let unwrappedUser = goodUser{
    print("User created successfully! Name: \(unwrappedUser.username)")
} else {
    print("Error: user isn't find")
}

class Doc {
    var id: String
    init(id: String){self.id = id}
}
class CreditDoc: Doc {
    var creditAmount: Int
    init(id: String, creditAmount: Int){
        self.creditAmount = creditAmount
        super.init(id: id)
    }
}
class MortgageContract: Doc {
    var houseAddress: String
    init(id: String, houseAddress: String){
        self.houseAddress = houseAddress
        super.init(id: id)
    }
}
let myCredit = CreditDoc(id: "111", creditAmount: 5000)
let myMortgage = MortgageContract(id: "222", houseAddress: "10122 Bespoke Rd")
let allDocuments: [Doc] = [myCredit, myMortgage]
let basicDoc = myCredit as Doc
for document in allDocuments{
    if document is MortgageContract {
        print("Mortgage with number \(document.id) was find")
    }else if document is CreditDoc {
        print("It is credit contract")
    }
}
let someDocument: Doc = myMortgage
if let credit = someDocument as? CreditDoc {
    print("Credit amount is: \(credit.creditAmount)")
}else{
    print("Error: it is not a credit contract")
}
let document1: Doc = myCredit
let document2: Doc = myMortgage
let exactCredit = document1 as! CreditDoc
print(exactCredit.creditAmount)
//let wrongCredit = document2 as! CreditDoc

class AudioPlayer {
    var volume: Int = 50
}

var playerOnPhone = AudioPlayer()
var playerOnMac = playerOnPhone // Копия НЕ создалась. Передалась ссылка на оригинал.

playerOnMac.volume = 100 // Мы поменяли громкость через мак

print(playerOnPhone.volume) // Выведет: 100

final class SecurityManager {
    func encryptPassword(_ pass: String) -> String{
        return "super_secret_hash_\(pass)"
    }
}
class Worker{
    var name: String
    init(name: String){self.name = name}
    func doWork(){
        print("\(name) id doing regular work")
    }
    final func calculateSalary(){
        print("Salary transfered to bank account")
    }
}
class Boss: Worker{
    override func doWork(){
        print("\(name) is drinking coffee and giving tasks")
    }
}

class BofaAccount {
    private var balance: Double = 0.0
    func deposit (amount: Double){
        if amount > 0{
            balance += amount
        }
    }
}
let myBofaAccount = BofaAccount()
myBofaAccount.deposit(amount: 100)
class Wallet {
    private(set) var money: Int = 500
    func spend(amount: Int){
        money -= amount
    }
}
let myWallet = Wallet()
print("I have: $\(myWallet.money)")

enum OrderStatus {
    case processing
    case shipping
    case delivered
}
var myOrder: OrderStatus = OrderStatus.processing
myOrder = .shipping
let currentStatus: OrderStatus = .shipping
switch currentStatus {
case .processing:
    print("We are packing your delivery")
case .shipping:
    print("Delivery is on the way")
case .delivered:
    print("Order deliverd. Bon appetit!")
}

enum Planet: String{
    case earth = "Earth"
    case mars = "Mars"
    case jupiter = "Jupiter"
}
let myPlanet = Planet.mars
print(myPlanet.rawValue)

enum LoginResult{
    case success(userID: Int)
    case failure(errorMessage: String)
}
let result1 = LoginResult.success(userID: 555)
let result2 = LoginResult.failure(errorMessage: "Wrong password")
switch result2{
case .success(let id):
    print("We found, your ID: \(id)")
case .failure(let message):
    print("Error of login: \(message)")
}

enum CoffeeSize: CaseIterable{
    case small
    case medium
    case large
}
let totalSizes = CoffeeSize.allCases.count
print("We have \(totalSizes) sizes of coffee cups")
for size in CoffeeSize.allCases{
    print("We are offering: \(size)")
}

enum Category: String, CaseIterable{
    case sports = "Sport"
    case movies = "Movie"
    case news = "News"
}
for category in Category.allCases{
    print("Botton of menu: \(category.rawValue)")
}
