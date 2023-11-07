class FileManager {
    var fileName: String

    init(fileName: String) {
        self.fileName = fileName
    }

    func openFile() {
        print("Open File: \(self.fileName)")
    }

    func modifyFile() {
        print("Modify File: \(self.fileName)")
    }

    func writeFile() {
        print("Write File: \(self.fileName)")
    }

    func closeFile() {
        print("CLose File: \(self.fileName)")
    }

    deinit {
        print("Deinit instance")
        self.writeFile()
        self.closeFile()
    }
}

var fileManager: FileManager? = FileManager(fileName: "abc.txt")

if let manager: FileManager = fileManager {
    manager.openFile()
    manager.modifyFile()
}

fileManager = nil