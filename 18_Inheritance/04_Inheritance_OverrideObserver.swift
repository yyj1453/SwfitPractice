class Person {
    var name: String = ""
    var age: Int = 0 {
        didSet {
            print("Person age : \(self.age)")
        }
    }
    var koreanAge: Int {
        return self.age + 1
    }
    var fullName: String {
        get {
            return self.name
        }
        set {
            self.name = newValue
        }
    }
}

// 변수를 오버라이드 하면 변수의 옵저버 또한 오버라이드 가능
class Student: Person {
    var grade: String = "F"
    override var age: Int {
        didSet {
            print("Student age : \(self.age)")
        }
    }
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        set {
            self.age = newValue - 1
        }
        // didSet { }
    }
    override var fullName: String {
        didSet {
            print("Full Nmae: \(self.fullName)")
        }
    }
}

let youngjin1: Person = Person()
youngjin1.name = "youngjin1"
youngjin1.age = 24
youngjin1.fullName = "Yoon Youngjin1"
print(youngjin1.koreanAge)

let youngjin2: Student = Student()
youngjin2.name = "youngjin2"
youngjin2.age = 25
youngjin2.koreanAge = 15
youngjin2.fullName = "Yoon Youngjin2"
print(youngjin2.koreanAge)