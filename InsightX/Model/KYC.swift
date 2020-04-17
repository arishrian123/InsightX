import Foundation

struct KYC: Codable, Identifiable, Hashable {
    
let id = UUID()
    
var ClientID = "",
FirstName = "",
LastName = "",
ResidentialAddress = "",
DateOfBirth = "",
GovernmentDocumentAttached = "",
PEPCheck = "",
MailingAddress = "",
TransitAccountNumber = "",
TransitAccountHolder = "",
SourceOfWealth = "",
ClientKnowledge = "",
PaperMailing = "",
KYCCheck = ""
    
}
