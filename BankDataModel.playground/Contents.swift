import UIKit
import Foundation

struct Bank{
    var allCustomers: [Customer] = []
    var allEmployees: [Employee] = []
    var allATMs: [ATM] = []
    var allBranches: [BankBranch] = []
}

enum CustomerInitError: Error {
    case wrongBankID
    case wrongEmail(provided: String)
    case wrongPhoneNumber(provided: String)
    case wrongDateOfBirth(provided: Date)
}

struct Customer{
    let bankID: String
    let firstName: String
    let lastName: String
    var middleName: String?
    var fullName: String{
        if let safeMiddleName = middleName{
           return "\(firstName) \(safeMiddleName) \(lastName)"
        }else{
            return "\(firstName) \(lastName)"
        }
    }
    let dateOfBirth: Date
    let email: String
    let phoneNumber: String
    private var card: Card?
    func cardView(){
        guard let safeCard = card else{
            print("Customer has not a card yet")
            return
        }
        print(safeCard)
    }
    var appProfile: User?
    func profileView(){
        guard let safeProfile = appProfile else{
            print("Customer has not a app profile yet")
            return
        }
        print(safeProfile)
    }
    init(bankID: String, firstName: String, lastName: String, phoneNumber: String, email: String, dateOfBirth: Date) throws {
        if bankID.count != 10 {
            throw CustomerInitError.wrongBankID
        }
        if !email.contains("@"){
            throw CustomerInitError.wrongEmail(provided: email)
        }
        if phoneNumber.count != 10 || !phoneNumber.allSatisfy({ $0.isNumber }){
            throw CustomerInitError.wrongPhoneNumber(provided: phoneNumber)
        }
        let calendar = Calendar.current
        let today = Date()
        if let eighteenYearsAgo = calendar.date(byAdding: .year, value: -18, to: today){
            if dateOfBirth > eighteenYearsAgo {
                throw CustomerInitError.wrongDateOfBirth(provided: dateOfBirth)
            }
        }
        self.bankID = bankID
        self.email = email
        self.phoneNumber = phoneNumber
        self.dateOfBirth = dateOfBirth
        self.firstName = firstName
        self.lastName = lastName
    }
    var bankAccounts: [BankAccount] = []
    mutating func openAccount(newAccount: BankAccount){
        bankAccounts.append(newAccount)
        print("New account \(newAccount) was successfully added to customer")
    }
    }

struct User {
    let username: String
    let faceID: Bool
    private var passwordHash: String
    func checkPassword(input: String) -> Bool {
        return input == passwordHash
    }
    }

class BankAccount {
    let accountNumber: String
    private var balance = 0.0
    var transactionHistory: [Transaction] = []
    var closingDate: Date?
    
    init(accountNumber: String ){
        self.accountNumber = accountNumber
    }
    enum AccountError: Error
    {
        case insufficientFunds(shortage: Double)
    }
    func withdraw(amount: Double) throws {
        if amount > balance {
            let shortage = amount - balance
            throw AccountError.insufficientFunds(shortage: shortage)
        }
        balance -= amount
    }
    func transfer(){}
    func zelleTransfer(){}
}
class CreditAccount: BankAccount{
    private var creditBalance: Double
    override func withdraw(amount: Double) throws {
        creditBalance -= amount
        print("Success! Your  credit balance: \(creditBalance) ")
    }
    init (accountNumber: String,startingCreditBalance: Double){
        self .creditBalance = startingCreditBalance
        super.init(accountNumber: accountNumber)
    }
}
class CheckingAccount: BankAccount{}
class SavingsAccount: BankAccount{
    var interestRate: Double
    init(accountNumber: String, interestRate: Double){
        self .interestRate = interestRate
        super.init(accountNumber: accountNumber)
    }
}
struct Card{
    let cardNumber: String
    let cardExpiration: String
    let cardCVC: String
   private var cardPIN: String
    init(cardNumber: String, cardExpiration: String, cardCVC: String){
        self .cardNumber = cardNumber
        self .cardExpiration = cardExpiration
        self .cardCVC = cardCVC
        self .cardPIN = String(format: "%04d", Int.random(in: 0...9999))
    }
    mutating func changePIN(to newPIN: String){
        cardPIN = newPIN
    }
    func checkPIN(input: String) -> Bool{
        if cardPIN == input{
            return true
        }
        else {
            return false
        }
    }
    enum CardStatus {
        case active
        case blocked
        case expired
    }
    var status: CardStatus = .active
}
    struct Transaction{
        let amount: Double
        let date: Date
        let transactionDescription: String?
        func transactionDescriptionView(){
            guard let safeDescription = transactionDescription else {
                print("Transaction has not any description")
                return
            }
            print(safeDescription)
        }
        enum TransactionType {
            case income
            case expense
        }
        enum Currency{
            case usd
            case eur
        }
        let type: TransactionType
        let currency: Currency
    }
struct Employee {
    let firstName: String
    let lastName: String
    let middleName: String?
    var fullName: String{
        if let safeMiddleName = middleName{
            return "\(firstName) \(safeMiddleName) \(lastName)"
        }else{
            return "\(firstName) \(lastName)"
        }
    }
    let position: String
    let salary: Double
    let email: String
    let phoneNumber: String
    let branch: BankBranch?
    func showBranch(){
        guard let safeBranch = branch else {
            print("Employee has not a branch")
            return
        }
        print(safeBranch)
    }
}
struct BankBranch{
    let address: String
    let rentAmount: Double
}
struct ATM{
    let location: String
    let isFullService: Bool
    var cashAmount: Double
    
    enum ATMError: Error {
        case atmOutOfMoney
        case insufficientCash (possibleWithdraw: Double)
        case wrongPIN
    }
    mutating func withdraw(amount: Double, PIN: String, card: Card, account: BankAccount) throws {
        if cashAmount <= 0 {
            throw ATMError.atmOutOfMoney
        }
        if amount > cashAmount {
            throw ATMError.insufficientCash(possibleWithdraw: cashAmount)
        }
        if card.checkPIN(input: PIN) == false {
            print("Wrong PIN. Please try again")
            throw ATMError.wrongPIN
        }
        try account.withdraw(amount: amount)
        cashAmount -= amount
    }
}

var myCard = Card(cardNumber: "1111222233334444", cardExpiration: "12/28", cardCVC: "123")
let myAccount = BankAccount(accountNumber: "123456789")
 var streetATM = ATM(location: "Main Street", isFullService: true, cashAmount: 5000.0)
do {
    try streetATM.withdraw(amount: 100.0, PIN: "0000", card: myCard, account: myAccount)
    print("Money were succesfully withdrawed")
}
catch ATM.ATMError.wrongPIN {
    print("Wrong PIN. Please try again")
}
catch ATM.ATMError.atmOutOfMoney {
   print("We apologize, ATM out of cash")
}
catch BankAccount.AccountError.insufficientFunds(let shortage){
    print("Not enough money on your account, missing amount \(shortage)")
}
catch {
    print("Error: \(error)")
}

