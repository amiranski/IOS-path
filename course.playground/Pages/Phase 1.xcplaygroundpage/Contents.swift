import Foundation
import UIKit
// MARK: - Day 2
var y = 0
let x = 0
let alertMessage = "Too many tries"
var defaultErrorMessage = "Another"
y = 10
y = x
defaultErrorMessage = alertMessage
let bool = true
y = y + x
y = 10 + 4 / 2 - 5 + (5 - 10)
y *= 10
let first: Int
var second: String
first = 5
print(first)
let double = 22.5
let doubleText = String(double)

// MARK: - Day 3

let playerName = "Adam"
var points = 15
var message = "Player \(playerName) earned \(points) points."

let levelsCompleted = 3
let totalLevels = 10
print("Progress: \(levelsCompleted * 100 / totalLevels)%")

let expenseName = "Coffee"
let basePrice = 4.0
let transaction = "New transaction: \(expenseName). Total with tips (15%): \(basePrice * 1.15)%"
print(transaction)

let name = "John"
let level = 5
let coinBalance = 550
let notificationsEnabled = true
print("Welcome \(name) your current level is \(level), your coin balance is \(coinBalance) and your notifications are enabled: \(notificationsEnabled)")

let score = 15
let isGameOver = false
if score > 10 {
    print("You achieved new level!")
} else if score == 10 {
    print("So close to failure!")
} else {
    print("Try again")
}

let currentLevel = 3
switch currentLevel {
case 1:
    print("Learning")
case 2, 3:
    print("Middle speed")
case 4...10:
    print("High speed")
default:
    print("Level \(currentLevel) doesn't exist yet")
}
var timeRemaining = 0
if timeRemaining == 0 {
    print("No time left")
}

// MARK: - Day 4
for i in 1...5 {
    print("current step: \(i)")
}

let devices = ["iPhone", "iPad", "MacBook"]
for device in devices {
    print("Device: \(device)")
}

for _ in 1...3 {
    print("Sending a request to the server...")
}
var batteryLevel = 100
var hoursUsed = 0
while batteryLevel > 0 {
    batteryLevel -= 20
    hoursUsed += 1
    print("Battery is dying. Current battery level is:\(batteryLevel)")
}
print("Battery died after \(hoursUsed) hours")

var diceRoll = 0
repeat{
    diceRoll = Int.random(in: 1...6)
    print("You have: \(diceRoll)" )
    
} while diceRoll != 6
print("Finally you have 6")

var finalDayExpenses = 0.0
let dailyExpenses = [12.5, 8.0, 25.4, 3.2]
for expense in dailyExpenses {
    finalDayExpenses += expense
}
print("Final expenses for today: \(finalDayExpenses)")

var secondsLeft = 5
while secondsLeft > 0 {
    print("Left: \(secondsLeft) seconds")
    secondsLeft -= 1
}
print("Time ended")

var generatedPin = 0
repeat{
    generatedPin = Int.random(in: 1000...9999)
    print("Your generated PIN is: \(generatedPin)")
} while generatedPin <= 9500
            print("Your final PIN is: \(generatedPin)")
            
// MARK: - Day 5
var unlockedLevels = ["Forest", "Desert", "Mountains"]
var dailyScores: [Int] = []
if dailyScores.isEmpty {
    print("Daily score is 0")
}
print(unlockedLevels[0])
unlockedLevels.append("Lake")
unlockedLevels.insert("Canyone", at: 1)
print(unlockedLevels[1])
var tasks = ["Buy bread", "Clean", "Call to mom"]
tasks.remove(at: 1)
tasks.removeLast()

let blockedUsers = ["user_123", "spammer_99"]
if blockedUsers.contains("user_123"){
    print("Access denied!")
}
print("Total blocked users: \(blockedUsers.count)")

var recentTransactions = ["Coffee", "Taxi", "Lunch"]
recentTransactions.removeLast()
recentTransactions.append("Dinner")

var categoryLimits: [String: Double] = [:]
var playerScores = [
    "Adam": 1500,
    "Alex": 800,
    "Sarah": 2100
]
var prices = ["coffee": 4.5, "tea": 3.0]
let teaCost = prices["tea"] ?? 0.0
let finalPrice = teaCost + 1.5

var appSettings = ["Sound": true, "Vibration": true]
appSettings["PushNotifications"] = false
appSettings["Sound"] = false
appSettings["Vibration"] = nil

let expenses = ["Coffee": 4.5, "Taxi": 12.0, "Lunch": 15.5]
for (categoryName, amount) in expenses {
    print("Category: \(categoryName). Spent: \(amount)")
}

var monthlyExpenses: [String: Double] = [:]
monthlyExpenses["Groceries"] = 45.5
monthlyExpenses["Music"] = 9.99

var visitedCities: Set<String> = []
var activeUsers: Set<String> = ["Adam","Alex", "Sarah","Alex"]
print(activeUsers)
let swiftStudents: Set = ["Adam", "Alex", "Bob"]
let pythonStudents: Set = ["Bob","Sarah", "Alex"]
let allStudents = swiftStudents.union(pythonStudents)
let polyglots = swiftStudents.intersection(pythonStudents)
let onlySwift = swiftStudents.subtracting(pythonStudents)
let singleLanguageStudents = swiftStudents.symmetricDifference(pythonStudents)
// MARK: - Day 6
let serverResponse = (404, "Not Found", false)
print("Error: \(serverResponse.0)")
print("Description: \(serverResponse.1)")

var userProfile = (name: "Adam",age: 21, isPremium: true)
print("User: \(userProfile.name)")
userProfile.isPremium = false

let httpResponse = (200, "OK")
let (statusCode, statusMessage) = httpResponse
print(statusCode)
print(statusMessage)
let (onlyCode, _) = httpResponse
print(onlyCode)

var lastTransaction = (category: "Taxi", amount: 15.5, isSuccesfull: true)

print(lastTransaction.amount)

enum ExpenseCategory{
    case groceries
    case transport
    case entertainment
    case health
}
var currentExpense: ExpenseCategory = ExpenseCategory.groceries
currentExpense = .transport
switch currentExpense {
case .groceries:
    print("Groceries buy")
case .transport:
    print("Public transport ticket")
case .entertainment:
    print("entertainment")
case .health:
    print("Pharmacy")
}
enum Currency: String {
    case usd = "Dollar USA"
    case eur = "Euro"
    case kzt = "Kazakhstan tenge"
}
let myCurrency = Currency.kzt
print("Choosen currency is: \(myCurrency.rawValue)")
enum PaymentStatus{
    case processing
    case success(receiptId: String)
    case failed(errorCode: Int)
}
let status1 = PaymentStatus.processing
let status2 = PaymentStatus.success (receiptId: "TXN-98765")
let status3 = PaymentStatus.failed(errorCode: 404)

let currentStatus = PaymentStatus.success(receiptId: "Apple-pay-14134")
switch currentStatus{
case .processing:
    print("Please wait...")
case .success(let receipt):
    print("Successfull! Your receipt: \(receipt)")
case .failed(let code):
    print("Error of transaction. Code: \(code)")
}

enum LoginState{
    case loggedIn(userName: String)
    case loggedOut
}
let currentUserState = LoginState.loggedIn(userName: "Adam")

// MARK: - Day 7
func showWelcomeScreen(){
    print("Welcome to application")
}
showWelcomeScreen()

func printReceipt(customerName: String, category: String){
    print("Customer \(customerName) made transaction in category: \(category).")
}
printReceipt(customerName: "Adam", category: "Groceries")

func sendMoney(_ amount: Double, to user: String){
    print("Sent \(amount)$ to user \(user)")
}
sendMoney(50.0, to: "Alex")
func sendGreeting(to recipient: String){
    print("Hi, \(recipient)! How are you?")
}
sendGreeting(to: "Adam")

func calculateTax(price: Double, taxRate: Double) -> Double{
    let taxAmount = price * taxRate
    return taxAmount
}
let myTax = calculateTax(price: 100.0, taxRate: 0.15)
print("After taxes: \(myTax)")

func createAccount(username: String, isPremium: Bool = false){
    if isPremium{
        print("VIP-account for \(username) was created")
    } else {
        print("Regular account for \(username) was created")
    }
}
createAccount(username: "Adam")
createAccount(username: "Alex", isPremium: true)

func calculateFinalPrice(_ basicPrice: Double, discount: Double = 0.0 ) -> Double{
   let finalPrice = basicPrice - (basicPrice * (discount / 100))
    return finalPrice
}
let firstTransaction = calculateFinalPrice(150.0)
print(firstTransaction)
let secondTransaction = calculateFinalPrice(200.0, discount: 15.0)
print(secondTransaction)

let dataLoaded = true
let userIsLogged = true
let dataError = false
let connection = true
if dataLoaded && userIsLogged {
    print("User's profile")
}
else if dataLoaded && !userIsLogged{
    print("Registration form")
}
else if dataError || !connection{
    print("Something went wrong")
}
else{
    print("UX of website")
}
// MARK: - Day 8
func printEven(array: [Int], isEven: Bool){
    let remainder = isEven ? 0 : 1
    for element in array {
      
            if element % 2 == remainder {
                print(element)
            }
        }
    
}

let someArray = [1,2,-8,10,-22,1,-3]
printEven(array: someArray, isEven: true)
printEven(array: someArray, isEven: false)
printEven(array: [1,2], isEven: false)

func calculateEconomyPrice(distance: Int) -> Int{
    return distance * 10
}
func calculateBusinessPrice(distance: Int) -> Int {
    return distance * 30
}
var currentCalculator: (Int)-> Int
currentCalculator = calculateBusinessPrice
let finalAmount = currentCalculator(5)
print(finalAmount)

let greet = {
    print("Hello")
}
greet()

let multiply = { (a: Int, b: Int) -> Int in
    return a * b
}
let result = multiply(4 , 5)

func makeCounter() -> () -> Int{
    var count = 0
    let increment = {
        count += 1
        return count
    }
    return increment
}
let counter = makeCounter()
print(counter())
print(counter())
print(counter())

let dollarPrices = [10.0, 20.0, 50.0]
let tengePrices = dollarPrices.map({(price: Double) -> Double in
    return price * 450.0
})
print(tengePrices)

let purchases = [10.0, 25.0, 50.0]
func addTax (beforeTaxes: Double) -> Double{
    return beforeTaxes * 1.2
}
let taxCalculator: (Double) -> Double = addTax

print(taxCalculator(100.0))

let discountedPurchases = purchases.map{ $0 - 5.0}
print(discountedPurchases)

let stringGlue: (String, String) -> String = {$0 + $1}
print(stringGlue("Hello, ", "World!"))
// MARK: - Day 9
func downloadFile(url: String, onSuccess: () -> Void){
    print("Downloading file from \(url)...")
    onSuccess()
}
// без замыкания
downloadFile(url: "apple.com/image.jpg", onSuccess: {
    print("File successfully downloaded to your phone!")
})
// with trailing closure professionaly
downloadFile(url: "apple.com/image.jpg"){
    print("File successfully saved to your phone!")
}

let prices2 = [10, 20, 30]
let doublePrices = prices2.map{$0 * 2}
//map
let euroPrices = [10.0, 20.0, 50.0]
//долгий вид
let tengePrices2 = euroPrices.map {(price: Double) -> String in
return "\(price * 500) tenge"}
print(tengePrices2)
//короткий вид
let tengePrices3 = euroPrices.map{ "\($0 * 500) tenge"}
print(tengePrices3)

//filters
let numbers = [-5, 2, 8, -10, 15, 4]
let positiveEvents = numbers.filter { $0 > 0 && $0 % 2 == 0}
print(positiveEvents)

//reduce
let expenses2 = [100, 250, 50]
// 0 - это наше стартовое значение (мы начинаем считать с нуля)
// $0 - накопленная сумма
// $1 - текущий расход в массиве
let totalExpenses = expenses2.reduce(0) { $0 + $1 }
print(totalExpenses)

let rawTemperatures = [10, -5, 20, -10, 5]
let finalResult = rawTemperatures
    .filter { $0 > 0}
    .map {$0 * 2}
    .reduce(0) {$0 + $1}
print(finalResult)

let ages = [16, 22, 18, 45, 12, 30, 28]
let adults = ages
    .filter { $0 >= 18}
    .map { "\($0) years"}
print(adults)

let salaries = [1500, 3200, 800, 4100, 2000]
let budget = salaries
    .map { $0 + 300}
    .reduce(0) { $0 + $1}
print("$\(budget)" )
    //optionals: unwrapping
// Force Unwrapping
let userAge: Int? = 25
print(userAge! * 2)
//Nil-Coalescing
var userName: String? = nil
let greeting = "Hi, " + (userName ?? "Guest")
print(greeting)

//Optional Binding
var userEmail: String? = "test@mail.com"
if let safeEmail = userEmail {
    print("Sending email to \(safeEmail)")
} else {
    print("User doesn't have email")
}
    //сокращенная версия
if let userEmail {
    // Внутри этих скобок userEmail - это уже временно распакованная, безопасная константа без знака вопроса!Блок else ты добавляешь исключительно по своему желанию, когда тебе нужен запасной план Если запасной план не нужен, ты смело оставляешь только if let { ... }
    print(userEmail)
}

let apartmentNumber: Int? = 42
let entranceCode: String? = nil

if let apartmentNumber {
    print("Deliverman is coming to apt. \(apartmentNumber)")
}

let finalCode = entranceCode ?? "No code, please call to customer"
print(finalCode)

// MARK: - Day 10
let dataIsLoaded = true
let userIsLoggedIn = true
let errorOfData = false
let internetConnection = true
switch true {
case  dataIsLoaded && userIsLoggedIn:
    print("User's profile")
case dataIsLoaded && !userIsLoggedIn:
    print("Registration form")
case errorOfData || !internetConnection:
    print("Something went wrong")
default:
    print("UX of website")
}


// MARK: - Day 11

for i in (1...100).reversed() {
    print(i)
}
        
for i in -1000...0{
    print(i)
}

for i in 1...100 {
    if i % 3 == 0{
        print(i)
    }
}
var finalEvenNumber = 0
for i in 1...100{
    if i % 2 == 0{
        finalEvenNumber += i
    }
}
print(finalEvenNumber)

//collections

let shoppingList = ["Water", "Protein bar", "Brocoli"]
print(shoppingList[1])

print(shoppingList.count)
print(shoppingList.isEmpty)
print(shoppingList.contains("Water"))

for value in shoppingList{
    print(value)
}

for (index, item) in shoppingList.enumerated(){
    print("\(index) \(item)")
}

var mutableShoppingList = shoppingList
mutableShoppingList.append("Bread")
mutableShoppingList[0] = "Bread"
print(mutableShoppingList)
mutableShoppingList.removeLast()
mutableShoppingList.insert("Cabbage", at: 1)
print(mutableShoppingList)
mutableShoppingList == shoppingList
let emptyArray: [String] = []
let emptyArray2: Array<String> = []
let emptyArray3 = [String]()
let emptyArray4 = Array<String>()

let chat = ["title": "Roman", "lastMessage": "How are you?"]
print(chat["title"] ?? "No title")
print(chat["time"])

let emptyDictionary: [String: Int] = [:]

let ingredients: Set<String> = ["cocoa beans", "sugar", "cocoa butter", "salt"]

let array1 = [1,2,3,4,5,6]
for i in stride(from:0, to: array1.count, by: 2){
    let currentArray = [array1[i], array1[i + 1]]
    print(currentArray)
}
let arr1 = [1,2,3]
let arr2 = [4,5,6]
let combinedArr = arr1 + arr2
print(combinedArr)

func combinedArrays(firstArray: [Int], secondArray: [Int]) -> [Int]{
    return firstArray + secondArray
}
let myFinalArray = combinedArrays(firstArray: [1,2,3], secondArray: [4,5,6])
print(myFinalArray)

var arr3 = [1,2,3,4,5,6,7,8,9,10]
for index in [8, 6, 2]{
    arr3.remove(at: index)
}
print(arr3)

func arr3func(array3: [Int], indicesToRemove: [Int]) -> [Int]{
    let sortedIndices = indicesToRemove.sorted(by: >)
    var array3return = array3
    for index in sortedIndices{
        array3return.remove(at: index)
    }
    return array3return
}
let initialArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let indices = [0, 8, 5]
let finalResult3 = arr3func(array3: initialArray, indicesToRemove: indices)
print(finalResult3)

let arr4 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]
let halfCount = arr4.count / 2
let firstHalf = arr4[0..<halfCount]
let firstHalfSum = firstHalf.reduce(0, +)
print (firstHalfSum)

func arr4func(array4: [Int]) -> Int{
    let halfCount = array4.count / 2
    let firstHalf = array4[0..<halfCount]
    let firstHalfSum = firstHalf.reduce(0, +)
    return firstHalfSum
}
let arr4print = arr4func(array4: arr4)
print(arr4print)

let arr5 = [1,2,-3,4,5,6,-7,8,9,10,11,-12,13,-14]
var amountOfNegative = 0
for i in arr5{
    if i < 0 {
        amountOfNegative += 1
    }
}
print(amountOfNegative)
//professional way
let arr5pro = [1, 2, -3, 4, 5, 6, -7, 8, 9, 10, 11, -12, 13, -14]
let amountOfNegativePro = arr5pro.filter { $0 < 0 }.count
print(amountOfNegativePro)
func arr5func(array5: [Int]) -> Int{
    let amount5func = array5.filter { $0 < 0 }.count
    return amount5func
}
let arr5funcPrint = arr5func(array5: arr5pro)
print(arr5funcPrint)

let arr6 = [1,2,-3,4,5,6,-7,8,9,10,11,-12,13,-14]
let positiveArr6 = arr6.filter{ $0 > 0}
print(positiveArr6)

func func6(array6: [Int]) -> [Int]{
    return array6.filter { $0 > 0}
}
let func6print = func6(array6: arr6)
print(func6print)

let arr7 = ["one", "two", "three"]
var arr7correct: [String] = []
for word in arr7{
    arr7correct.append(word.capitalized)
}
print(arr7correct)
//professional solving
let arr7Pro = ["one", "two", "three"]
let arr7correctPro = arr7Pro.map { $0.capitalized }
print(arr7correctPro) // ["One", "Two", "Three"]

func func7(array7: [String]) -> [String]{
    let func7return = array7.map{$0.capitalized}
    return func7return
}
let func7print = func7(array7: arr7Pro)
print(func7print)

let abcde = "abcde"
for letter in abcde{
    print(letter)
}
func wordFunc(word: String) -> String{
    var characters = ""
    for letter in word{
    characters += String(letter) + "\n"
    }
    return characters
}
let wordFuncPrint = wordFunc(word: "abcde")
print(wordFuncPrint)

let emoji = "🤯abcde"
var emojiNew = ""
for index in emoji.indices{
    let integerIndex = emoji.distance(from: emoji.startIndex, to: index)
    if integerIndex % 2 != 0 {
        emojiNew += String(emoji[index]).capitalized
    }else{
        emojiNew += String(emoji[index])
    }
}
print(emojiNew)

func emojiFunc(emoji1: String) -> String{
    var emojiNew1 = ""
    for index in emoji1.indices{
        let integerIndex = emoji1.distance(from: emoji1.startIndex, to: index)
        if integerIndex % 2 != 0 {
            emojiNew1 += String(emoji1[index]).capitalized
        }else{
            emojiNew1 += String(emoji1[index])
        }
    }
    return emojiNew1
}
let emojiFuncPrint = emojiFunc(emoji1: "lol😂")
print(emojiFuncPrint)

let arr10 = [1,2,3,4,5,6]
var even = 0
var odd = 0
for index in arr10.indices {
    if index % 2 == 0 {
        even += arr10[index]
    }else{
        odd += arr10[index]
    }
}
let answer = Double(even) / Double(odd)
print(answer)

//easy solving
let arr10Ez = [1,2,3,4,5,6]
var evenEz = 0
var oddEz = 0
for (index, number) in arr10Ez.enumerated(){
    if index % 2 == 0{
        evenEz += number
    }else{
        oddEz += number
    }
}
let answerEz = Double(evenEz)/Double(oddEz)
    print(answerEz)

func func10 (array10: [Int]) -> Double{
    var even10 = 0
    var odd10 = 0
    for (index, number) in array10.enumerated(){
        if index % 2 == 0{
            even10 += number
        }else{
            odd10 += number
        }
    }
    let answer10 = Double(even10)/Double(odd10)
    return answer10
}
let func10print = func10(array10: arr10Ez)
print(func10print)

let arr11 = [123, 456, 789]
var arr11Rev: [String] = []
for i in arr11{
        arr11Rev.append(String(String(i).reversed()))
}
let arr11Opt = arr11Rev.map{Int($0) ?? 0}
print(arr11Opt)
//professional way
let arr11p = [123, 456, 789]
let arr11Optp = arr11p.map { Int(String(String($0).reversed())) ?? 0 }
print(arr11Optp)

func func11(arr11func: [Int]) -> [Int]{
    let func11print = arr11func.map { Int(String(String($0).reversed())) ?? 0 }
    return (func11print)
}
let arr11check = func11(arr11func: arr11p)
print(arr11check)

let arr12 = [1,2,3,4,5,6]
var arr12new: [Int] = []
for i in stride(from: 0, to: arr12.count, by: 2){
    arr12new.append(Int(String(arr12[i]) + String(arr12[i + 1])) ?? 0 )
}
print(arr12new)

func func12(array12: [Int]) -> [Int]{
    var arr12return: [Int] = []
    for i in stride(from: 0, to: array12.count, by: 2){
        arr12return.append(Int(String(array12[i]) + String(array12[i + 1])) ?? 0 )
    }
    return(arr12return)
}
let arr12check = func12(array12: arr12)
print(arr12check)

let arr13 = "aaa bbb ccc eee fff"
var arr13final: [String] = []
let arr13new = arr13.components(separatedBy: " ")
for (n, c) in arr13new.enumerated(){
    if n % 2 != 0 {
        arr13final.append(c.capitalized)
    }else{
        arr13final.append(c)
    }
}
print(arr13final.joined(separator: " "))
func func13(word13: String) -> String {
    var arr13print: [String] = []
    let arr13newF = word13.components(separatedBy: " ")
    for (n, c) in arr13newF.enumerated(){
        if n % 2 != 0 {
            arr13print.append(c.capitalized)
        }else{
            arr13print.append(c)
        }
    }
    return arr13print.joined(separator: " ")
}
let func13check = func13(word13: "aaa bbb ccc eee fff")
print(func13check)

var arr14 = [1, 2, 3, 3, 4, 5]
for (i, n) in arr14.enumerated() {
   
    if i < arr14.count - 1 {
        if arr14[i] == arr14[i + 1] {
            print("two identical numbers in a row")
            break
        }else{
            print(n)
        }
    }
}

 enum ResultType{
    case number(Int)
    case text(String)
}

func func14 (array14: [Int]) -> ResultType{
    var func14return: ResultType = .number(0)
    for (i, n) in array14.enumerated() {
       
        if i < array14.count - 1 {
            if array14[i] == array14[i + 1] {
               func14return = .text("two identical numbers in a row")
                break
            }else{
                func14return = .number (n)
            }
        }
    }
  return func14return
}
let func14print = func14(array14: arr14)
print(func14print)

let arr15 =
[
    [2,1,4,3,5],
    [3,5,2,4,1],
    [4,3,1,5,2]
]
let arr15sorted = arr15.map {$0.sorted()}
print(arr15sorted)

func func15 (array15: [[Int]]) -> [[Int]]{
    let array15Sorted = array15.map {$0.sorted()}
    return array15Sorted
}

let func15Print = func15(array15: arr15)
print(func15Print)

let arr16 =
[
    [1,2,3],
    [4,5,6],
    [7,8,9],
]
var counter16 = 0
for subArray in arr16{
    for number in subArray{
        counter16 += number
    }
}
print(counter16)

func func16 (array16: [[Int]]) -> Int{
    var counter16Func = 0
    for subArray in array16{
        for number in subArray{
            counter16Func += number
        }
    }
    return counter16Func
}
let func16Print = func16(array16: arr16)
print(func16Print)

let arr17 =
[
    [
        [11,12,13],
        [14,15,16],
        [17,17,19],
    ],
    [
        [21,22,23],
        [24,25,26],
        [27,27,29],
    ],
    [
        [31,32,33],
        [34,35,36],
        [37,37,39],
    ],
]
var counter17 = 0
for subArray in arr17{
    for subSubArray in subArray{
        for number in subSubArray{
            counter17 += number
        }
       
    }
}
print(counter17)

func func17 (array17: [[[Int]]]) -> Int{
    var counter17func = 0
    for subArray in array17{
        for subSubArray in subArray{
            for number in subSubArray{
                counter17func += number
            }
           
        }
    }
    return counter17func
}

let func17Print = func17(array17: arr17)
print(func17Print)

let dictionary = [
    "firstArray": [
        11,
        12,
        13,
    ],
    "secondArray": [
        21,
        22,
        23,
    ],
    "thirdArray": [
        24,
        25,
        26,
    ],
]
var counter18 = 0
for array in dictionary.values{
    for number in array{
        counter18 += number
    }
}
print(counter18)

func func18 (dictionaryFunc: [String : [Int]]) -> Int {
    var counter18Func = 0
    for array in dictionaryFunc.values{
        for number in array{
            counter18Func += number
        }
    }
    return counter18Func
}
    let func18Print = func18(dictionaryFunc: dictionary)
    print(func18Print)

let dictionary19: [String: Any] = [
    "firstInnerDictionary": [
        1: 11,
        2: 22,
        3: 13,
    ],
    "secondInnerDictionary": [
        1: 21,
        2: 22,
        3: 23,
    ],
    "array": [
        24,
        25,
        26,
    ],
]
var counter19 = 0
for (key,unknownValue) in dictionary19{
    if let intArray = unknownValue as? [Int] {
        for number in intArray{
            counter19 += number
        }
    }
    if let innerDictionary = unknownValue as? [Int: Int]{
        for number in innerDictionary.values{
            counter19 += number
        }
    }
}
print(counter19)

func func19(dictionary19Func: [String : Any]) -> Int{
    var counter19Func = 0
    for (key,unknownValue) in dictionary19Func{
        if let intArray = unknownValue as? [Int] {
            for number in intArray{
                counter19Func += number
            }
        }
        if let innerDictionary = unknownValue as? [Int: Int]{
            for number in innerDictionary.values{
                counter19Func += number
            }
        }
    }
    return counter19Func
}
let func19Print = func19(dictionary19Func: dictionary19)
print(func19Print)

var arr20: [[Int]] = []
for _ in 1...5 {
var subArr20: [Int] = []
    for var number in 0...2{
        number += 1
        subArr20.append(number)
    }
    arr20.append(subArr20)
}
print("[")
for subArr20 in arr20{
    print("    \(subArr20),")
}
print("]")

func func20() -> [[Int]]{
    var arr20Func: [[Int]] = []
    for _ in 1...5 {
    var subArr20Func: [Int] = []
        for var number in 0...2{
            number += 1
            subArr20Func.append(number)
        }
        arr20Func.append(subArr20Func)
    }
    return arr20Func
}
let func20Print = func20()
print(func20Print)


let arr21 =
[
    [1,2,3],
    [4,5,6],
    [7,8,9]
]
var arr21final: [Int] = []
for subArray in arr21{
    for number in subArray{
        arr21final.append(number)
    }
}
print(arr21final)

    //professional way
let arr21pro = arr21.flatMap{ $0 }
print(arr21pro)
func func21 (array21:[[Int]]) -> [Int]{
    let arr21Func = array21.flatMap{ $0 }
    return arr21Func
}
let func21Print = func21(array21: arr21)
print(func21Print)

let arr22 = [1,2,3,4,5,6,7,8,9]
var arr22dictionary: [String : Double] = [:]
if let min = arr22.min(){
    arr22dictionary["Minimal"] = Double(min)
}
if let max = arr22.max(){
    arr22dictionary["Maximal"] = Double(max)
}
let sum = arr22.reduce(0, +)
let average = Double(sum) / Double(arr22.count)
arr22dictionary["Average"] = average
print(arr22dictionary)

func func22 (array22: [Int]) -> [String : Double]{
    var arr22dictionaryFunc: [String : Double] = [:]
    if let min = array22.min(){
        arr22dictionaryFunc["Minimal"] = Double(min)
    }
    if let max = array22.max(){
        arr22dictionaryFunc["Maximal"] = Double(max)
    }
    let sum = array22.reduce(0, +)
    let average = Double(sum) / Double(array22.count)
    arr22dictionaryFunc["Average"] = average
    return arr22dictionaryFunc
}
let func22Print = func22(array22: arr22)
print(func22Print)

let dictionary23 =
[
    "min" : -100,
    "max" : 42
]
var arr23: [Int] = []
if let min = dictionary23["min"]
,let max = dictionary23["max"]{
        for i in stride(from: min, through: max, by: 2){
            arr23.append(i)
        }
    }
print(arr23)

func func23 (dictionary23Func: [String : Int]) -> [Int]{
    var arr23Func: [Int] = []
    if let min = dictionary23Func["min"]
    ,let max = dictionary23Func["max"]{
            for i in stride(from: min, through: max, by: 2){
                arr23Func.append(i)
            }
        }
    return arr23Func
}
let func23Print = func23(dictionary23Func: dictionary23)
print(func23Print)

func funcArray (arrayDuplicate: [Int]) -> [Int]{
    var funcArrayDictionary: [Int: Int] = [:]
    for number in arrayDuplicate{
        if funcArrayDictionary[number] == nil {
            funcArrayDictionary[number] = 1
        }
        else{
            funcArrayDictionary[number]! += 1
        }
    }
    var funcArrayReturn: [Int] = []
    for number in arrayDuplicate{
        if funcArrayDictionary[number]! <= 3{
            funcArrayReturn.append(number)
        }
    }
    return funcArrayReturn
}
let funcArrayPrint = funcArray(arrayDuplicate: [7,5,3,5,8,5,5,3,3])
print(funcArrayPrint)

func funcNeighbours (arrayNeighbours: [Int]) -> [Int]{
    var funcNeighboursReturn = [arrayNeighbours[0]]
    for index in 1..<arrayNeighbours.count{
        if arrayNeighbours[index] != arrayNeighbours[index - 1]{
            funcNeighboursReturn.append(arrayNeighbours[index])
        }
    }
    return funcNeighboursReturn
}
let funcNeighboursPrint = funcNeighbours(arrayNeighbours: [1,2,2,3,4,3,5,5,5,6])
print(funcNeighboursPrint)

let closureArray =
[
    [1,2,3],
    [4,5,6],
    [7,8,9]
]
func closureFunc(array: [[Int]], funcRecieved: ([[Int]]) -> Int) -> Int{
    return funcRecieved (array)
}
let sumClosure = closureFunc(array: closureArray, funcRecieved: {(array: [[Int]]) -> Int in
    var numberSum = 0
    for subArray in array{
        for number in subArray{
            numberSum += number
        }
    }
    return numberSum
})
print(sumClosure)

let multiplyClosure = closureFunc(array: closureArray, funcRecieved: {(array: [[Int]]) -> Int in
    var numbersMultiply = 1
    for subArray in array{
        for number in subArray{
            numbersMultiply *= number
        }
    }
    return numbersMultiply
    })
    print(multiplyClosure)

let differenceClosure = closureFunc(array: closureArray, funcRecieved: {(array: [[Int]]) -> Int in
    var numbersDifference = array[0][0]
    var isFirstStep = true
    for subArray in array{
        for number in subArray{
            if isFirstStep{
                isFirstStep = false
               continue
            }
            numbersDifference -= number
        }
    }
    return numbersDifference
})
print(differenceClosure)

//professional way
let differenceClosureP = closureFunc(array: closureArray, funcRecieved: {(array: [[Int]]) -> Int in
    let flatArray = Array(array.joined())
    var numbersDifferenceP = flatArray[0]
    for number in flatArray.dropFirst(){
        numbersDifferenceP -= number
    }
    return numbersDifferenceP
})

let closureArray2 = [1,2,3,4,5,6,7,8,9]
func funcClosure2 (array: [Int], action: ([Int]) -> Double) -> Double{
    return action(array)
}
let averageClosure = funcClosure2 (array: closureArray2, action: {(array: [Int]) -> Double in let averageNumber = Double(array.reduce(0,+)) / Double(array.count)
    return averageNumber
})
print(averageClosure)

let minimalClosure = funcClosure2 (array: closureArray2, action: {(array: [Int]) ->
    Double in
    let minimalNumber = Double(array.min() ?? 0)
    return minimalNumber
})
print(minimalClosure)

let maximalClosure = funcClosure2 (array: closureArray2, action: {(array: [Int]) ->
    Double in
    let maximalNumber = Double(array.max() ?? 0)
    return maximalNumber
})
print(maximalClosure)
