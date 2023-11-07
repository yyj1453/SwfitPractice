struct CoordinatePoint {                                                // 지점을 수정해주는 구조체 생성
    var x: Int
    var y: Int
    func oppositePoint() -> Self {                                      // Coordinate 타입의 함수 oppositePoint() 생성
        return CoordinatePoint(x: -x, y: -y)                            // Coordinate 타입의 함수이기 때문에 같은 타입의 반환값을 반환
    }

    mutating func setOppositePoint(_ opposite: CoordinatePoint) {       // mutating은 구조체나 열거형의 프로퍼티를 수정할 수 있게하는 키워드, Coordinate 타입의 인스턴스를 파라미터로 받아옴
        x = -opposite.x
        y = -opposite.y
    }
}

var yagomPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)      // Coordinate의 인스턴스를 생성하면서 초기값 (10, 20)을 저장
print(yagomPosition)                                                    // 인스턴스인 yagomPosition의 정보를 출력
print(yagomPosition.oppositePoint())                                    // 인스턴스의 yagomPosition의 멤버함수인 oppositePoint()를 실행하고 반환값을 출력, yagomPosition의 멤버변수하고는 별개의 값

yagomPosition.setOppositePoint(CoordinatePoint(x: 15, y: 10))           // mutating 함수인 setOppositePoint()를 사용했기 때문에 yagomPosition의 멤버 변수 값이 바뀜
print(yagomPosition)                                                    // 인스턴스인 yagomPosition의 정보를 출력