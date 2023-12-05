protocol SelfPrintable {
    func printSelf()
}

struct Person: SelfPrintable { }

extension Int :SelfPrintable { }
extension UInt :SelfPrintable { }
extension String :SelfPrintable { }
extension Double :SelfPrintable { }

// Self는 SelfPrintable을 준수하는 인스턴스를 의미함
extension SelfPrintable where Self: FixedWidthInteger, Self: SignedInteger {
    func printSelf() {
        print("FixedWidthInteger와 SignedInteger을 준수하면서 SelfPrintable을 준수하는 타입 \(type(of: self))")
    }
}

extension SelfPrintable where Self: CustomStringConvertible {
    func printSelf() {
        print("CustomStringConvertible을 준수하면서 SelfPrintable을 준수하는 타입 \(type(of: self))")
    }
}

extension SelfPrintable {
    func printSelf() {
        print("그 외 SelfPrintable을 준수하는 타입 \(type(of: self))")
    }
}

Int(-8).printSelf()
UInt(8).printSelf()
String("youngjin").printSelf()
Double(8.0).printSelf()
Person().printSelf()