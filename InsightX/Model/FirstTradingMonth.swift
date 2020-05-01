import Foundation

struct FirstTradingMonth: Codable, Identifiable, Hashable {
    
    let id = UUID()
    
    var portfolioID: String,
    dateOfTransaction: String,
    securityID: String,
    quantity: Int,
    type: String
    
}
