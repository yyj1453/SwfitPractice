let names: [String] = ["wizplan", "eric", "yagom", "jenny"]

let revered1: [String] = names.sorted() { (first: String, second: Stirng) -> Bool in
    return first > second
}

let revered2: [String] = names.sorted { (first: String, second: String) -> Bool in
    return first > second
}

func doSomething(do: (String) -> Void,
                onSuccess: (Any) -> Void,
                onFailure: (Error) -> Void) {
        // do something..
}

doSomething { (someString: String) in
        // do closure
} onSuccess: { (result: Any) in 
        // success closure
} onFailure: { (error: Error) in 
        // failure closure
}