enum School: Int {
    // 첫 번째 케이스의 rawValue만 설정하면 나머지 케이스는 rawValue값이 순차적으로 증가하는 값을 가짐
    case elementary = 1, middle, high, university

    static subscript(level: Int) -> School? {
        return Self(rawValue: level)
        // return School(rawValue: level)과 같은 표현
    }
}

// level로 2가 들어갔으므로 열거형 School의 두 번째 요소를 불러옴 
// 세 번째가 아닌 두 번째 요소를 불러오는 이유는 elementary의 값이 1로 설정되어있기 때문
let school: School? = School[2]
print(school) // School.middle