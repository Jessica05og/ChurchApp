
import Foundation
import UIKit

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


extension UIViewController{
    func setupBackButton(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .done, target: self, action: #selector(backTapped))
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
    }
    
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: false)
    }
}


