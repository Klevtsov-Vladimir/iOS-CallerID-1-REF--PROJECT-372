import Foundation

class LineReader {
    let path: String
    
    fileprivate let file: UnsafeMutablePointer<FILE>!
    
    init?(path: String) {
        self.path = path
        
        file = fopen(path, "r")
        
        guard file != nil else { return nil }
        
    }
    
    var nextLine: String? {
        var line:UnsafeMutablePointer<CChar>? = nil
        var linecap:Int = 0
        defer { free(line) }
        return getline(&line, &linecap, file) > 0 ? String(cString: line!) : nil
    }
    
    deinit {
        fclose(file)
    }
}