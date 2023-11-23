import Foundation  // objc 속성을 사용하려면 애플의 Foundation 프레임워크를 사용해야함

// @objc 속성이 부여되어 있어야 선택적 요구를 할 수 있는 프로토콜이 됨
@objc protocol Moveable {
    func walk()
    // 선택적 요구사항에는 @objc와 optional 키워드가 붙어 있어야함
    @objc optional func fly()
}

class Tiger: NSOject, Moveable {
    func walk() {
        print("Tiger walks")
    }
}

class Bird: NSOject, Moveable {
    func walk() {
        print("Bird walks")
    }
    func fly() {
        print("Bird flys")
    }
}

let tiger: Tiger = Tiger()
let bird: Bird = Bird()

tiger.walk()
bird.walk()
bird.fly()

var moveableInstance: Moveable = tiger
moveableInstance.fly?()

moveableInstance = bird
moveableInstance.fly?()