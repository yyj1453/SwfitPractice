class Person {
    var name: String = ""
    var age: Int = 0

    var koreanAge: Int {
        return self.age + 1
    }

    var introduction: String {
        return "이름: \(name), 나이: \(age)"
    }
}

class Student: Person {
    var grade: String = "F"
    
    override var introduction: String {
        return super.introduction + " " + "학점: \(self.grade)"
    }

    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        set {
            self.age = newValue - 1
        }
    }
}

let youngjin1: Person = Person()
youngjin1.name = "youngjin1"
youngjin1.age = 23
//youngjin1.koreanAge = 24
print(youngjin1.introduction)
print(youngjin1.koreanAge)

let youngjin2: Student = Student()
youngjin2.name = "youngjin2"
youngjin2.age = 22
youngjin2.koreanAge = 23
print(youngjin2.introduction)
print(youngjin2.koreanAge)