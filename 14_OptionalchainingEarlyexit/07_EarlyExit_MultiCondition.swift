func enterClub(name: String?, age: Int?) {
    // 여러 조건일때 쉼표(,) 대신 AND연산자(&&)를 사용해도 됨
    guard let name: String = name, let age: Int = age, age > 19, name.isEmpty == false else {
        print("You are too ypung to enter the club")
        return
    }
    print("Welcome \(name)")
}