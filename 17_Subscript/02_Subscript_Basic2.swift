// 학생의 정보를 담을 구조체 Student 생성
struct Student {
    var name: String
    var number: Int
}

// 학교의 정보를 담을 클래스 School 생성
class School {
    // 학생의 번호이자 인원수를 담을 변수생성
    var number: Int = 0

    // 학생들의 정보를 담을 Student배열 생성
    var students: [Student] = [Student]()

    // 학생 한명한명을 추가하는 함수 생성
    func addStudent(name: String) {
        // 구조체를 통해 생성된 학생 한명의 정보를 인스턴스(객체) student로 생성
        let student: Student = Student(name: name, number: self.number)
        // 만들어진 인스턴스(객체) student를 School클래스의 멤버변수인 students에 추가
        self.students.append(student)
        // 학생 인원수 1증가
        self.number += 1
    }

    // 학생들을 한번에 여러명을 추가하기 위한 함수 생성
    func addStudents(names: String...) {
        // 입력받은 이름들을 순회하면서 반복
        for name in names {
            // addStudent 함수를 통해 학생 추가
            self.addStudent(name: name)
        }
    }

    // 이미 저장된 학생의 정보를 불러올 서브스크립트 생성
    // 입력한 index의 값이 학생 총인원보다 많을 수 있으므로 반환 타입은 옵셔널로 설정
    subscript(index: Int = 0) -> Student? {
        // index의 값이 학생 총인원보다 적을때만 학생 정보 반환
        if index < self.number {
            return self.students[index]
        }
        return nil
    }
}

// School의 인스턴스(객체)생성
let highSchool: School = School()

// addStudents를 통해 한번에 여러명의 학생들 추가
highSchool.addStudents(names: "YoungJin1", "YoungJin2", "YoungJin3", "YoungJin4", "YoungJin5")

// School클래스에 선언해 놓은 서브스크립트를 통해 학생 한명 호출 (index 값으로는 1입력)
let aStudent: Student? = highSchool[1]

// number는 0부터 시작이므로 YoungJin2 호출
print("\(aStudent?.number) \(aStudent?.name)")

// index값을 입력하지 않으면 서브스크립트를 생성할 때 설정된 기본값으로 index값이 입력됨 (index 값으로 0입력)
// 첫번째 학생인 YoungJin1 호출
print(highSchool[]?.name)