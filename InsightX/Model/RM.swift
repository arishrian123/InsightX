import Foundation

struct RM: Identifiable {
    
    let id = UUID()
    var email: String
    var password: String
    
    
    func validation() -> Bool {
        
        var check: Bool
        
        if(email.count == 21 && password.count >= 6)
        {
            check = true
            return check
        }
        else {
            check = false
            return check
        }
    }

}
