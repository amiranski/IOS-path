import UIKit

@MainActor class Telegram {
    private static var allUsers = 0
    private static var allUsernames: [String] = []
    private static var allIDs: [String] = []
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
                status: .recently,
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
    init?(id: String, name: String, phoneNumber: String, settings: UserSettings){
        self.id = id
        self.name = name
        self.phoneNumber = phoneNumber
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
        var messageLong: Int?
        let senderId: String
        var replyToMessageId: String?
        enum MessageStatus: Int {
            case sent = 1
            case recieved = 2
            case read = 3
        }
        var messageStatus: MessageStatus
    }
    var messages: [Message] = []
    
    init(chatType: ChatType, id: String){
        self.chatType = chatType
        self.id = id
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
