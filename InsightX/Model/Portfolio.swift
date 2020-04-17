import Foundation

struct Portfolio: Codable, Identifiable, Hashable {
    
let id = UUID()
    
var CustomerID = 0,
Currency = "",
FeeCode = "",
InitialValue = "",
STATUS = "",
AccType = ""
    
}
