class AClass {
    static func staticTypeMethod() {
        print("AClass staticTypeMethod")
    }

    class func classTypeMethod() {
        print("AClass classTypeMethod")
    }
}

class BClass: AClass {
    /*
    override static func staticTypeMethod() {}          // 정적 메소드는 오버라이드(재정의) 불가능
    */
    override class func classTypeMethod() {
        print("BClass classTypeMethod")
    }
}

AClass.staticTypeMethod()
AClass.classTypeMethod()
BClass.classTypeMethod()