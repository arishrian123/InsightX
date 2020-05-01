import Foundation

struct SecondTradingMonth: Codable, Identifiable, Hashable {
    
    let id = UUID()
    
    var portfolioID: String,
    dateOfTransaction: String,
    firstSecurityID: String,
    firstSecurityQuantity: Int,
    secondSecurityID: String,
    secondSecurityQuantity: Int,
    firstTransactionType: String,
    secondTransactionType: String
    
}
