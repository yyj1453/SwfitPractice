struct Student {
    var name: String
    var number: Int
}

class School {
    var number: Int = 0
    var students: [Student] = [Student]()

    func addStudent(name: String) {
        let student: Student = Student(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }

    func addStudents(names: String...) {
        for name in names {
            self.addStudent(name: name)
        }
    }

    // 첫 번째 서브스크립트 (학생 번호를 통해 학생 정보 조회 및 수정)
    subscript(index: Int) -> Student? {
        // 학생 정보 읽기(조회) 부분
        get {
            // 찾고자 하는 학생의 번호가 학생 총 인원보다 작을때만 조회
            if index < self.number {
                return self.students[index]
            }
            // 그외에는 nil값 반환
            return nil
        }

        // 학생 정보 설정(수정) 부분 (set뒤에는 (newValue)가 생략되어 있음 (암시적 명시))
        set {
            // 새롭게 입력받은 값이 학생의 정보가 아닐경우 서브스크립트 종료
            guard var newStudent: Student = newValue else {
                return
            }
            
            // 첫 번째 서브스크립트가 사용되면서 입력된 index를 학생번호로 사용
            var number: Int = index

            // 입력된 학생 번호의 값이 총 인원수 보다 많을 경우 (학생 정보 수정이 아닌 추가)
            if index > self.number {
                // 입력된 학생번호의 값을 총 인원수와 같은 값으로 변경
                number = self.number
                // 총 인원수 1 증가
                self.number += 1
            }

            // 새롭게 입력된 학생정보의 번호를 index값으로 변경
            newStudent.number = number
            // 해당 객체를 알맞는 배열의 위치에 변경 또는 추가
            self.students[number] = newStudent
        }
    }

    // 두 번째 서브스크립트 (학생 이름를 통해 학생 번호 조회 및 수정)
    subscript(name: String) -> Int? {
        // 학생 번호 읽기(조회) 부분
        get {
            // 학생들 배열에서 전달인자로 받은 이름과 같은 학생들만 필터링 -> 그중에 첫 번째 학생의 번호 반환
            return self.students.filter{ $0.name == name }.first?.number
            // 굳이 first를 사용하는 이유: 필터링까지 완료된 것은 아무리 하나라도 배열 형태, 그러나 반환값은 배열 형태가 아니여야 하므로 first 사용
        }

        // 학생 번호 설정(수정) 부분
        set {
            // 입력받은 값이 숫자가 아닐경우 서브스크립트 종료
            guard var number: Int = newValue else {
                return
            }

            // 입력받은 번호가 학생 총 인원수 보다 많을 경우
            if number > self.number {
                // 입력받은 값 수정
                number = self.number
                // 총 인원수 1 증가
                self.number += 1
            }
            
            // 전달인자로 받은 이름과 newValue였던 번호로 새로운 newStudent객체 생성
            let newStudent: Student = Student(name: name, number: number)
            // 해당 객체를 알맞는 배열의 위치에 변경 또는 추가
            self.students[number] = newStudent
        }
    }

    // 세 번째 서브 스크립트 (학생 이름과 번호를 통해 학생 정보 조회)
    subscript(name: String, number: Int) -> Student? {
        // 학생들 배열에서 전달인자로 받은 이름과 번호가 같은 학생들만 필터링 -> 그중에 첫 번째 학생의 정보 반환
        return self.students.filter{ $0.name == name && $0.number == number }.first
    }
}

// School 클래스의 인스턴스(객체) 생성
let highSchool: School = School()
// addStudents 메소드를 사용해 여러명의 학생들을 한번에 추가
highSchool.addStudents(names: "YoungJin1", "YoungJin2", "YoungJin3", "YoungJin4", "YoungJin5")

// 만들어진 학생들 배열에서 두번쨰 학생의 정보를 새로운 객체에 복사 (첫 번째 서브스크립트 사용)
let aStudent: Student? = highSchool[1]
print("\(aStudent?.number) \(aStudent?.name)")

// 두 번째 서브스크립트를 사용해 학생 번호 조회
print(highSchool["YoungJin1"])
print(highSchool["youngJin6"]) // nil

// 첫 번째 서브스크립트를 사용해 첫번째 학생 정보 변경(수정)
highSchool[0] = Student(name: "YoungJin7", number: 0)

// 두 번째 서브스크립트를 사용해 학생 추가 및 번호 설정
highSchool["YoungJin8"] = 1

// 두 번째 서브스크립트를 사용해 학생 번호 조회
print(highSchool["YoungJin2"]) // nil (index = 1인 두번째 학생은 YoungJin8로 대체되어 YoungJin2의 정보는 사라짐)
print(highSchool["YoungJin8"])

// 세 번째 서브스크립트를 사용해 학생 정보 조회
print(highSchool["YoungJin4", 3])
print(highSchool["YoungJin9", 3]) // nil ("YoungJin9" 라는 학생은 없음)