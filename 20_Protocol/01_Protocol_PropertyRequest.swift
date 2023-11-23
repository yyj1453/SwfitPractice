protocol Sendable {
    var from: String { get }
    var to: String { get }
}

class Message: Sendable {
    var sender: String
    var from: String {
        return self.sender
    }
    var to: String

    init(sender: String, receiver: String) {
        self.sender = sender
        self.to = receiver
    }
}

class Mail: Sendable {
    var from: String
    var to: String

    init(sender: String, receiver: String) {
        self.from = sender
        self.to = receiver
    }
}