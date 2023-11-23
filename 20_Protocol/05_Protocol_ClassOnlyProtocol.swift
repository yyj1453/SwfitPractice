protocol Readable {
    func read()
}

protocol Writeable {
    func write()
}

protocol ReadSpeakable: Readable {
    func speak()
}

protocol ReadWriteSpeakable: Readable, Writeable {
    func speak()
}

// 상속받을 프로토콜들 앞에 class 키워드를 이용하면 클래스 전용 프로토콜로 만들 수 있음
protocol ClassOnlyProtocol: class, Readable, Writeable {
    func speak()
}

class SomeClass1: ReadWriteSpeakable {
    func read() {
        print("Read")
    }
    func write() {
        print("Write")
    }
    func speak() {
        print("Speak")
    }
}

class SomeClass2: ClassOnlyProtocol {
    func read() {
        print("Read")
    }
    func write() {
        print("Write")
    }
    func speak() {
        print("Speak")
    }
}
/*
struct SomeStruct: ClassOnlyProtocol {
    func read() {
        print("Read")
    }
    func write() {
        print("Write")
    }
    func speak() {
        print("Speak")
    }
}
*/
var someInstance: SomeClass2 = SomeClass2()
someInstance.read()