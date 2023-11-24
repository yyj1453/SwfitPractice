// 데이터 수신 프로토콜
protocol Receiveable {
    func received(data: Any, from: Sendable)
}
extension Receiveable {
    // 데이터 수신 메소드
    func received(data: Any, from: Sendable) {
        // self: 프로토콜을 받은 클래스를 통해 만들어진 인스턴스
        print("\(self) received \(data) from \(from)")
    }
}

// 데이터 송신 프로토콜
protocol Sendable {
    var from: Sendable { get }
    var to: Receiveable? { get }

    func send(data: Any)

    static func isSendableInstance(_ instance: Any) -> Bool
}
extension Sendable {
    // 데이터 송신자 프로퍼티
    var from: Sendable {
        // self: 프로토콜을 받은 클래스를 통해 만들어진 인스턴스
        return self
    }

    // 데이터 송신 메소드
    func send(data: Any) {
        // to 프로퍼티에 Receiveable프로토콜을 준수하는 인스턴스가 부여 되지 않는다면 else문 실행 (수신자가 연결)
        guard let receiver: Receiveable = self.to else {
            print("Message ha no receiver")
            return
        }
        // receiver(수신자)를 통해 received 메소드 호출
        receiver.received(data: data, from: self.from)
    }

    // 데이터 전송이 가능한지 불가능한지 판단
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}

class Message: Sendable, Receiveable {
    // 프로토콜에서 요구된 남은 프로퍼티 구현
    var to: Receiveable?
}

class Mail: Sendable, Receiveable {
    // 프로토콜에서 요구된 남은 프로퍼티 구현
    var to: Receiveable?
}

// Message의 인스턴스 생성 (Sendable, Receiveable 프로토콜 준수)
let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

// Sendable 프로토콜의 send 메소드가 호출 되었지만 수신자 연결이 안되어있음
myPhoneMessage.send(data: "Hello")

// 수신자 연결
myPhoneMessage.to = yourPhoneMessage
// 데이터 정상 출력 가능
myPhoneMessage.send(data: "Hello")

// Mail의 인스턴스 생성 (Sendable, Receiveable 프로토콜 준수)
let myMail: Mail = Mail()
let yourMail: Mail = Mail()

// Sendable 프로토콜의 send 메소드가 호출 되었지만 수신자 연결이 안되어있음
myMail.send(data: "Hi")

// 수신자 연결
myMail.to = yourMail
// 데이터 정상 출력 가능
myMail.send(data: "Hi")

// 수신자로 Message의 인스턴스를 연결해도 Receiveable 프로토콜을 준수하고 있으므로 연결 가능
myMail.to = myPhoneMessage
// 데이터 정상 출력
myMail.send(data: "Bye")

// "Hello"라는 문자열을 Sendable 프로토콜로 캐스팅을 할 수 없음
print(Message.isSendableInstance("Hello"))

// myPhoneMessage는 수신자로 yourPhoneMessage가 연결되어 Sendable 프로토콜을 준수함
print(Message.isSendableInstance(myPhoneMessage))

// yourPhoneMessage는 수신자가 연결되지 않아 Sendable 프로토콜을 준수하지 않음
print(Message.isSendableInstance(yourPhoneMessage))

print(Mail.isSendableInstance(myPhoneMessage))

// myMail은 수신자로 yourMail이 연결되어 있음
print(Mail.isSendableInstance(myMail))