import UIKit
import Foundation

struct Bank{
    var allCustomers: [Customer] = []
    var allEmployees: [Employee] = []
    var allATMs: [ATM] = []
    var allBranches: [BankBranch] = []
}
struct Customer{
    let bankID: String
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
    let dateOfBirth: Date
    let email: String
    let phoneNumber: String
    var card: Card?
    var appProfile: User?
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
    init(accountNumber: String ){
        self.accountNumber = accountNumber
    }
    func withdraw(amount: Double){
        if amount > balance{
           let missingAmount = abs(amount - balance)
            print("You don't have enough money to withdraw this amount. MIssing amount is \(missingAmount)")
        }else{
            balance -= amount
            print("Success! Your available balance: \(balance)")
        }
    }
    func transfer(){}
    func zelleTransfer(){}
}
class CreditAccount: BankAccount{
    private var creditBalance: Double
    override func withdraw(amount: Double){
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
        let transactionDescription: String
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
}
struct BankBranch{
    let address: String
    let rentAmount: Double
}
struct ATM{
    let location: String
    let isFullService: Bool
    var cashAmount: Double
}
