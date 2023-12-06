class Department {
    var name: String
    var subjects: [Subject] = []
    init(name: String) {
        self.name = name
    }
}

class Subject {
    var name: String
    unowned var department: Department
    unowned var nextSubject: Subject? // unowned 키워드를 사용하면 참조 타입이 아닌 값 타입인 옵셔널도 참조 관리가 가능
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextSubject = nil
    }
}

let department = Department(name: "Computer Science") // Department 참조 횟수: 1, Subject 참조 횟수: 0

let intro = Subject(name: "Computer Architecture", in: department) // Department 참조 횟수: 1, Subject 참조 횟수: 1
let intermediate = Subject(name: "Swift Language", in: department) // Department 참조 횟수: 1, Subject 참조 횟수: 2
let advanced = Subject(name: "iOS App Programming", in: department) // Department 참조 횟수: 1, Subject 참조 횟수: 3

intro.nextSubject = intermediate // Department 참조 횟수: 1, Subject 참조 횟수: 4
intermediate.nextSubject = advanced // Department 참조 횟수: 1, Subject 참조 횟수: 5
department.subjects = [intro, intermediate, advanced] // Department 참조 횟수: 1, Subject 참조 횟수: 8 (intro, intermediate, advanced를 통해 1번씩 호출)