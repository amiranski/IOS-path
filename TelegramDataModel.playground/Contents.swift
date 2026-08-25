import UIKit

class Telegram {
    nonisolated(unsafe) private static var allUsers = 0
    nonisolated(unsafe) private static var allUsernames: [String] = []
    nonisolated(unsafe) private static var allIDs: [String] = []
    static func isUsernameTaken(username: String) -> Bool {
        return allUsernames.contains(username)
        }
    static func addUsername(username: String){
        allUsernames.append(username)
    }
}

class Contact {
    private let id: String
    var phoneNumber: String
    var localName: String?
    var registeredUser: User?
    var displayName: String{
        if let customName = localName{
            return customName
        }else if let globalUser = registeredUser{
            return globalUser.name
        }else {
            return phoneNumber
        }
    }
    var isBlocked = false
    var username: String?
    var profilePictureURL: String?
    var stories: [Story] = []
    var hasActiveStories: Bool{
        return  stories.contains { story in
            let secondsPassed = Date().timeIntervalSince(story.date)
            return secondsPassed < 86400
        }
    }
    enum Status{
        case online
        case recently
        case month
        case longTime
    }
    init?(id: String, phoneNumber: String, localName: String?, registeredUser: User?, status: Status){
            self.id = id
            self.phoneNumber = phoneNumber
            self.localName = localName
            self.registeredUser = registeredUser
            self.status = status
        }
        
        convenience init?(phoneNumber: String, registeredUser: User? = nil){
            self.init(
                id: UUID().uuidString,
                phoneNumber: phoneNumber,
                localName: nil,
                registeredUser: registeredUser,
                status: .recently
            )
            }

    
    var status: Status
    var bio: String?
}

class Calls{
    let contact: Contact?
    let duration: Int
    let time: Date
    enum CallStatus{
        case canceled
        case outgoing
        case missed
        case incoming
    }
    enum CallType{
        case audio
        case video
    }
    init (contact: Contact?, duration: Int, time: Date, callStatus: CallStatus, callType: CallType){
        self.contact = contact
        self.duration = duration
        self.time = time
        self.callStatus = callStatus
        self.callType = callType
    }
    var callStatus: CallStatus
    var callType: CallType
}

final class User {
    enum UserInitError: Error{
        case easyPassword
        case wrongEmailFormat (provided: String)
        case wrongPhoneNumberFormat (provided: String)
        case existingUsername
        case emptyName
        case usernameWithSpaces
    }
    
    private let id: String
    private var password: String?
    var email: String?
    var name: String
    var username: String?
    var phoneNumber: String
    var bio: String?
    func showProfileBio(user: User){
        guard let safeBio = user.bio else {
            print(" ")
            return
        }
       print(safeBio)
    }
    var profilePictureURL: String?
    func showProfilePicture(user: User){
        guard let safeProfilePicture = user.profilePictureURL else {
            if let firstLetter = (user.name).first{
                print("Default picture with \(firstLetter)")
            }
            return
        }
        print(safeProfilePicture)
    }
    var emojiStatus: String?
    var stickers: [String] = []
    var stories: [Story] = []
    var hasActiveStories: Bool{
        return  stories.contains { story in
            let secondsPassed = Date().timeIntervalSince(story.date)
            return secondsPassed < 86400
        }
    }
    var isPremium = false
    private var settings: UserSettings
    init(id: String, name: String, phoneNumber: String,password: String, email: String, username: String, settings: UserSettings) throws {
        if Telegram.isUsernameTaken(username: username){
            throw UserInitError.existingUsername
        }
          if !email.contains("@"){
            throw UserInitError.wrongEmailFormat(provided: email)
        }
        if name.isEmpty {
            throw UserInitError.emptyName
        }
        if username.contains(" "){
            throw UserInitError.usernameWithSpaces
        }
        if phoneNumber.count != 10 || !phoneNumber.allSatisfy({ $0.isNumber }){
                   throw UserInitError.wrongPhoneNumberFormat(provided: phoneNumber)
               }
        if password.count < 8 {
            throw UserInitError.easyPassword
        }
        self.id = id
        self.name = name
        self.phoneNumber = phoneNumber
        self.password = password
        self.email = email
        self.username = username
        self.settings = settings
    }
    struct UserSettings{
        var isDarkModeEnabled: Bool
        var notificationsEnabled: Bool
        var whoCanSeeMyPhone: PrivacyLevel
        enum PrivacyLevel: CaseIterable {
            case everyone
            case contacts
            case nobody
        }
    }
}

class Chats{
   private let id: String
    enum ChatType{
        case privateChat(contact: Contact)
        case groupChat(participants: [Contact], title: String, chatImage: Bool)
        case channel(admins: [Contact], subscribersCount: Int, isPrivate: Bool, comments: Comments, title: String, channelImage: Bool)
    }
    enum Comments {
        case open
        case subscribers
        case turnedOff
    }
    enum Folders{
        case unread
        case personal
        case channels
        case groupChats
        case custom(name: String)
    }
    var folders: [Folders] = []
    var chatType: ChatType
    
    struct Message {
        enum MessageError: Error{
            case emptyMessage
            case longText
            case hardVideo
            case userIsBlocked
            case longVideoCircle
        }
        enum MessageType{
            case text
            case audio
            case video
            case oneTime
        }
        struct MessageReaction {
            var reaction: String
            var reactionAmount: Int
        }
        var reactions: [MessageReaction] = []
        private let id: String
        let date: Date
        var text: String?
        var mediaURL: String?
        var messageType: MessageType
        var isRead: Bool
        var durationSeconds: Int?
        var messageLong: Int?
        let senderId: String
        var mediaSizeMB: Double?
        var replyToMessageId: String?
        enum MessageStatus: Int {
            case sent = 1
            case recieved = 2
            case read = 3
        }
        var messageStatus: MessageStatus
        init(text: String?, mediaURL: String?, messageType: MessageType, senderId: String, mediaSizeMB: Double?, replyToMessageId: String?){
            self.id = UUID().uuidString
            self.date = Date()
            self.text = text
            self.mediaURL = mediaURL
            self.messageType = messageType
            self.senderId = senderId
            self.mediaSizeMB = mediaSizeMB
            self.replyToMessageId = replyToMessageId
            self.isRead = false
            self.messageStatus = .sent
            self.messageLong = text?.count
        }
    }
    var messages: [Message] = []
    
    init(chatType: ChatType, id: String){
        self.chatType = chatType
        self.id = id
    }
    
    
    func sendMessage(message: Message, sender: User) throws {
        if message.text == nil  && message.mediaURL == nil {
            throw Message.MessageError.emptyMessage
        }
        if let safeMessage = message.text{
            if safeMessage.count > 4096 {
                throw Message.MessageError.longText
            }
        }
        if case let .privateChat(contact) = chatType {
            if contact.isBlocked{
                throw Message.MessageError.userIsBlocked
            }
                
        }
        if message.messageType == .video && (message.durationSeconds ?? 0) > 60{
            throw Message.MessageError.longVideoCircle
        }
        if (message.mediaSizeMB ?? 0) > 2048 && message.messageType == .video && !sender.isPremium {
            throw Message.MessageError.hardVideo
        }
        messages.append(message)
    }
}

struct Story{
    let date: Date
    enum StoryType{
        case photo(URL: String)
        case video(URL: String)
    }
    let postedBy: String
    var sound: Bool
    var caption: String?
}

var myUserSettings = User.UserSettings(isDarkModeEnabled: true, notificationsEnabled: true, whoCanSeeMyPhone: User.UserSettings.PrivacyLevel.contacts)

do {
    let myUser = try User(
        id: "123456789",
        name: "Alex",
        phoneNumber: "1234567890",
        password: "Alex2000",
        email: "example@example.com",
        username: "Alex",
        settings: myUserSettings)
    Telegram.addUsername(username: myUser.username ?? myUser.phoneNumber)
    print("Welcome! '\(myUser.username ?? "No name")' successfully registered")
    
    let myContact = Contact(phoneNumber: "123456789")!
    
    let myChat = Chats(chatType: .privateChat(contact: myContact) ,id: "1234567890")
    
    let myMessage = Chats.Message(text: "Text", mediaURL: "hruief435", messageType: Chats.Message.MessageType.text, senderId: "r48492428", mediaSizeMB: 3000.0, replyToMessageId: nil)
    
    try myChat.sendMessage(message: myMessage, sender: myUser)
    print("Message successfully sent and added to array")
} catch User.UserInitError.easyPassword{
    print("Password has include at least 8 symbols")
} catch User.UserInitError.wrongEmailFormat(let provided){
    print("Entered email \(provided) doesn't include '@'")
} catch User.UserInitError.wrongPhoneNumberFormat(let provided){
    print("Wrong phone number type: \(provided)")
} catch User.UserInitError.existingUsername{
    print("This username is taken, please try another")
} catch User.UserInitError.emptyName{
    print("Name can not be empty")
} catch User.UserInitError.usernameWithSpaces{
    print("Username can not include spaces")
} catch Chats.Message.MessageError.emptyMessage{
    print("Error: Message is empty")
} catch Chats.Message.MessageError.longText {
    print("Error: Text is too long")
} catch Chats.Message.MessageError.hardVideo {
    print("Error video is too hard")
} catch Chats.Message.MessageError.userIsBlocked{
    print("Error: User is blocked")
} catch Chats.Message.MessageError.longVideoCircle{
    print("Error: Video circle is longer than 60 seconds")
} catch {
    print("Unknown error: \(error)")
}


