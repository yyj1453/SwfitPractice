let youngjin = ("youngjin", 24, "Male")

switch youngjin {
    // youngjin 튜플의 값들이 자동으로 (name, age, gender) 형태의 튜플에 바인딩이 됨
    case let (name, age, gender):
        print("Name: \(name), Age: \(age), Gender: \(gender)")
}

switch youngjin {
    case (let name, let age, let gender):
        print("Name: \(name), Age: \(age), Gender: \(gender)")
}

switch youngjin {
    // 두 번째 값을 무시함 나머지 값만 바인딩
    case (let name, _, let gender):
        print("Name: \(name), Gender: \(gender)")
}