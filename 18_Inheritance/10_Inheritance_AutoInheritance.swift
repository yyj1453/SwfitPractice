print("● 지정 생성자 자동상속 ●")

class Person1 {
    var name1: String

    init(name1: String) {
        self.name1 = name1
    }

    convenience init() {
        self.init(name1: "Unknown1")
    }
}

class Student1: Person1 {
    var major1: String = "Swift1"
}

let youngjin1_1: Person1 = Person1(name1: "youngjin1_1")
let youngjin1_2: Student1 = Student1(name1: "youngjin1_2")
print(youngjin1_1.name1)
print(youngjin1_2.name1)

let youngjin1_3: Person1 = Person1()
let youngjin1_4: Student1 = Student1()
print(youngjin1_3.name1)
print(youngjin1_4.name1)

print("------------------------------------------------")

print("● 편의 생성자 자동상속 1 ●")

class Person2 {
    var name2: String

    init(name2: String) {
        self.name2 = name2
    }

    convenience init() {
        self.init(name2: "Unknown2")
    }
}

class Student2: Person2 {
    var major2: String

    override init(name2: String) {
        self.major2 = "Unknown2"
        super.init(name2: name2)
    }

    init(name2: String, major2: String) {
        self.major2 = major2
        super.init(name2: name2)
    }
}

let youngjin2_1: Person2 = Person2()
let youngjin2_2: Student2 = Student2()
print(youngjin2_1.name2)
print(youngjin2_2.name2)

print("------------------------------------------------")

print("● 편의 생성자 자동상속 2 ●")

class Person3 {
    var name3: String

    init(name3: String) {
        self.name3 = name3
    }

    convenience init() {
        self.init(name3: "Unknown3")
    }
}

class Student3: Person3 {
    var major3: String

    convenience init(major3: String) {
        self.init()
        self.major3 = major3
    }

    override convenience init(name3: String) {
        self.init(name3: name3, major3: "Unknown3")
    }

    init(name3: String, major3: String) {
        self.major3 = major3
        super.init(name3: name3)
    }
}

let youngjin3_1: Person3 = Person3()
let youngjin3_2: Student3 = Student3(major3: "Swift")
print(youngjin3_1.name3)
print(youngjin3_2.name3)
print(youngjin3_2.major3)

print("------------------------------------------------")

print("● 편의 생성자 자동상속 3 ●")

class Person4 {
    var name4: String

    init(name4: String) {
        self.name4 = name4
    }

    convenience init() {
        self.init(name4: "Unknown4")
    }
}

class Student4: Person4 {
    var major4: String

    convenience init(major4: String) {
        self.init()
        self.major4 = major4
    }

    // 지정, 편의 상관없이 전달인자가 같다면 같은 생성자로 인식
    override convenience init(name4: String) {
        self.init(name4: name4, major4: "Unknown4")
    }

    init(name4: String, major4: String) {
        self.major4 = major4
        super.init(name4: name4)
    }
}

class UniversityStudent4: Student4 {
    var grade4: String = "A+"
    var description4: String {
        return "\(self.name4) \(self.major4) \(self.grade4)"
    }

    convenience init(name4: String, major4: String, grade4: String) {
        self.init(name4: name4, major4: major4)
        self.grade4 = grade4
    }
}

let youngjin4_1: UniversityStudent4 = UniversityStudent4()
print(youngjin4_1.description4)

let youngjin4_2: UniversityStudent4 = UniversityStudent4(name4: "youngjin4_2")
print(youngjin4_2.description4)

let youngjin4_3: UniversityStudent4 = UniversityStudent4(name4: "youngjin4_3", major4: "Programming")
print(youngjin4_3.description4)

let youngjin4_4: UniversityStudent4 = UniversityStudent4(name4: "youngjin4_4", major4: "Computer", grade4: "C")
print(youngjin4_4.description4)