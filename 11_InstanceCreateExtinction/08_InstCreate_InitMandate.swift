enum Student {
    case elementary, middle, high
    case none

    init() {
        self = .none
    }

    init(koreanAge: Int) {
        switch koreanAge {
            case 8...13:
                self = .elementary
            case 14...16:
                self = .middle
            case 17...19:
                self = .high
            default:
                self = .none
        }
    }

    init(bornAt: Int, currentYear: Int) {
        self.init(koreanAge: currentYear - bornAt + 1)          // 초기화 내부에서 다른 초기화를 호출가능 (초기화 위임)
    }
}

var younger: Student = Student(koreanAge: 16)
print(younger)

younger = Student(bornAt: 1998, currentYear: 2016)
print(younger)