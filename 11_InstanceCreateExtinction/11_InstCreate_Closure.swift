struct Student {
    var name: String?
    var number: Int?
}

class SchoolClass {
    var students: [Student] = {
        var arr: [Student] = [Student]()

        for num in 1...15 {
            var student: Student = Student(name: nil, number: num)
            arr.append(student)
        }
        return arr
    }()
}

let myClass: SchoolClass = SchoolClass()
print(myClass.student.count)