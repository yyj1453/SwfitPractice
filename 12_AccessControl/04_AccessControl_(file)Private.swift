public struct SomeType {
    private var privateVariable = 0
    fileprivate var fileprivateVariable = 0
}

extension SomeType {
    public func publicMethod() {
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }

    private func privateMethod() {
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }

    fileprivate func fileprivateMethod() {
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }
}

struct AnotherType {
    var someInstance: SomeType = SomeType()

    mutating func someMethod() {
        // public 접근수준에는 어디서든 접근 가능
        self.someInstance.publicMethod()

        // 같은 파일안에 있는 코드이므로 fileprivate 접근수준 요소에 접근 가능
        self.someInstance.fileprivateVariable = 100
        self.someInstance.fileprivateMethod()

        // 다른 타입 내부의 코드이므로 private 요소에 접근 불가! 오류!
        // self.someInstance.privateVariable = 100
        // self.someInstance.privateMethod()
    }
}

var anotherInstance = AnotherType()
anotherInstance.someMethod()