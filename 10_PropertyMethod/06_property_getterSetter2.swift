struct CoordinatePoint {
    var x: Int
    var y: Int

    var oppositePoint: CoordinatePoint {                                    // 좌표를 반전 시켜주는 연삼 메소드 생성
        get {                                                               // 무언가를 반환하는 메소드
            return CoordinatePoint(x: -x, y: -y)                            // CoordinatePoint 인스턴스를 반환, return 생략 가능
        }
        set {                                                               // 구조체나 열거형의 내부 속성값을 변환하는 메소드
            x = -newValue.x
            y = -newValue.y
        }
    }
}

var yagomPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)          // CoordinatePoint의 인스턴스인 yagomPosition 생성
print(yagomPosition)
print(yagomPosition.oppositePoint)                                          // oppositePoint 메소드가 실행되면서 get 메소드 적용
yagomPosition.oppositePoint = CoordinatePoint(x: 15, y: 10)                 // 값이 직접적으로 부여되면 set 메소드 부여
print(yagomPosition)