class Company {
    let name: String

    var ceo: CEO!

    init(name: String, ceoName: String) {
        self.name = name
        self.ceo = CEO(name: ceoName, company: self)
    }

    func introduce() {
        print("\(name)의 CEO는 \(ceo.name)입니다.")
    }
}

class CEO {
    let name: String

    unowned let company: Company

    init(name: String, company: Company) {
        self.name = name
        self.company = company
    }

    func introduce() {
        print("\(name)는 \(company.name)의 CEO입니다")
    }
}

let company: Company = Company(name: "영진회사", ceoName: "윤영진") // Company 참조 횟수: 1, CEO 참조 횟수: 1
company.introduce()
company.ceo.introduce()