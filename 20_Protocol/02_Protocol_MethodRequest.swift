// 데이터를 받을 수 있는지 판단하는 프로토콜
protocol Receiveable {
    // 받는 데이터 형태는 Any타입, 보낸사람의 형태는 Sendable 프로토콜을 준수
    func received(data: Any, from: Sendable)
}

// 데이터를 보낼 수 있는지 판단하는 프로토콜
protocol Sendable {
    // from은 Sendable 프로토콜을 따르는 인스턴스 형태
    var from: Sendable { get }
    // to는 Receiveable 프로토콜을 따르는 인스턴스 형태 (nil값 허용)
    var to: Receiveable? { get }

    // 보내는 데이터 형태는 Any 타입
    func send(data: Any)

    // 정적메소드 선언, 전달인자는 Any 타입, 반환타입은 Bool 형태
    static func isSendableInstance(_ instance: Any) -> Bool
}

// 클래스 Message 생성 (Sendable, Receiveable 프로토콜 준수(수신, 발신이 가능))
class Message: Sendable, Receiveable {
    // 발신자는 발신(Sendable) 프로토콜을 준수
    var from: Sendable {
        // Message의 인스턴스를 생성하고 from 프로퍼티를 호출하면 그 인스턴스 자체를 반환
        return self
    }
    // 수신자는 수신(Receiveable) 프로토콜을 준수
    var to: Receiveable?

    // Message 클래스는 Sencable 프로토콜을 준수하므로 요구된 매소드 또한 구현해야함
    func send(data: Any) {
        // Message 클래스를 통해 만들어진 인스턴스의 수신자가 없을 때 
        guard let receiver: Receiveable = self.to else {
            print("Message has no receiver")
            return
        }
        // 수신 가능한 인스턴스의 received 메소드 호출
        receiver.received(data: data, from: self.from)
    }

    // Message 클래스는 Receiveable 프로토콜을 준수하므로 요구된 매소드 또한 구현해야함
    func received(data: Any, from: Sendable) {
        print("Message received \(data) from \(from)")
    }

    // Message 클래스는 Sencable 프로토콜을 준수하므로 요구된 매소드 또한 구현해야함
    class func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}

class Mail: Sendable, Receiveable {
    var from: Sendable {
        return self
    }

    var to: Receiveable?

    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            print("Mail has no receiver")
            return
        }
        receiver.received(data: data, from: self.from)
    }

    func received(data: Any, from: Sendable) {
        print("Mail received \(data) from \(from)")
    }

    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}

let myPhoneMassage: Message = Message()
let yourPhoneMessage: Message = Message()

// myPhoneMessage 인스턴스의 수신자가 정해지지 않음
myPhoneMassage.send(data: "Hello")

// 수신자를 yourPhoneMessage로 연결
myPhoneMassage.to = yourPhoneMessage
// 수신자가 제대로 연결되었으므로 데이터 출력
myPhoneMassage.send(data: "Hello")

let myMail: Mail = Mail()
let yourMail: Mail = Mail()

myMail.send(data: "Hi")

myMail.to = yourMail
myMail.send(data: "Hi")

myMail.to = myPhoneMassage
myMail.send(data: "Bye")

print(Message.isSendableInstance("Hello"))

print(Message.isSendableInstance(myPhoneMassage))

print(Message.isSendableInstance(yourPhoneMessage))
print(Mail.isSendableInstance(myPhoneMassage))
print(Mail.isSendableInstance(myMail))