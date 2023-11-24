protocol SelfPrintable {
    func printSelf()
}
extension SelfPrintable where Self: Container {
    func printSelf() {
        print(items)
    }
}

protocol Container: SelfPrintable {
    associatedtype ItemType

    var items: [ItemType] { get set }
    var count: Int { get }

    mutating func append(item: ItemType)
    subscript(i: Int) -> ItemType { get }
}
extension Container {
    mutating func append(item: ItemType) {
        items.append(item)
    }
    
    var count: Int {
        return items.count
    }

    subscript(i: Int) -> ItemType {
        return items[i]
    }
}

protocol Popable: Container {
    mutating func pop() -> ItemType?
    mutating func push(_ item: ItemType)
}
extension Popable {
    mutating func pop() -> ItemType? {
        return items.removeLast()
    }

    mutating func push(_ item: ItemType) {
        self.append(item: item)
    }
}

struct Stack<Element>: Popable {
    var items: [Element] = [Element]()

    // 전달인자로 (요소를 받아 Bool타입 값을 반환하는 함수)를 includeElement라는 이름으로 받아 Stack<Element>의 인스턴스 형태로 반환
    func filter(includeElement: (Element) -> Bool) -> Stack<Element> {
        // 필터링 된 배열을 담을 인스턴스 생성
        var filteredStack: Stack<ItemType> = Stack<ItemType>()

        for item in items {
            // Element로 item을 받아옴, 반환값이 Bool값이 true 라면 코드 실행
            if includeElement(item) {
                // 조건에 부합하는 item만 배열에 추가
                filteredStack.items.append(item)
            }
        }

        return filteredStack
    }
}

var myIntStack: Stack<Int> = Stack<Int>()
myIntStack.push(1)
myIntStack.push(5)
myIntStack.push(2)

// filter 메소드의 전달인자 includElement로 (item: Int) -> Bool in return item < 5 가 쓰임
let filteredStack: Stack<Int> = myIntStack.filter { (item: Int) -> Bool in 
    return item < 5
}
filteredStack.printSelf()