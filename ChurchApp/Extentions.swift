
import Foundation

// more info about regex:
// https://emailregex.com/regular-expressions-cheat-sheet/

extension String{
    
    enum validityType{
        case age
        //case email
    }
    
    enum Regex: String {
        case age = "[0-9]{2,2}"
    }
    func isValid(_ validityType: validityType) -> Bool{
        let format = "SELF MATCHES %@"
        var regex = ""
        
        
        switch validityType {
        case .age:
            regex = Regex.age.rawValue
            
        }
        return NSPredicate(format: format, regex).evaluate(with: self)
        
    }
    
    
}
