class Person {
    // Person이라는 데이터타입 안에 Job이라는 데이터 타입 구현
    enum Job {
        case jobless, programmer, student
    }
    var job: Job = .jobless
}

class Student: Person {
    // Student이라는 데이터 타입안에 School이라는 데이터 타입 구현
    enum School {
        case elementary, middle, high
    }

    var school: School

    init(school: School) {
        self.school = school
        super.init()
        self.job = .student
    }
}

let personJob: Person.Job = .jobless
let studentJob: Student.Job = .student

let student: Student = Student(school: .middle)
print(student.job)
print(student.school)