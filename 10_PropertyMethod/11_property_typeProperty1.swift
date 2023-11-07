class AClass {
    static var typeProperty: Int = 0

    var instanceProperty: Int = 0 {
        didSet {                                            // instanceProperty의 값이 변하면 실행될 프로퍼티 옵저버
            Self.typeProperty = instanceProperty + 100      // instanceProperty의 값이 변하면 자기 클래스의 typeProperty의 값을 instanceProperty + 100으로 설정
        }
    }

    static var typeComputedProperty: Int {
        get {
            return typeProperty
        }
        set {
            typeProperty = newValue
        }
    }
}

AClass.typeProperty = 123

let classInstance: AClass = AClass()
classInstance.instanceProperty = 100

print(AClass.typeProperty)
print(AClass.typeComputedProperty)