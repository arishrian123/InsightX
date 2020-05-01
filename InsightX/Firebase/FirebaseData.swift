

import Firebase
import FirebaseFirestore

let clientDBCollection = Firestore.firestore().collection("clients")
let portfoliosDBCollection = Firestore.firestore().collection("portfolios")
let firstTMDBCollection = Firestore.firestore().collection("firstTradingMonth")
let secondTMDBCollection = Firestore.firestore().collection("secondTradingMonth")
let thirdTMDBCollection = Firestore.firestore().collection("thirdTradingMonth")
let securitiesDBCollection = Firestore.firestore().collection("securities")
let KYCDBCollection = Firestore.firestore().collection("KYC")

let firebaseData = FirebaseData()

class FirebaseData: ObservableObject {
    
    @Published var clientData = [Client]()
    @Published var portfolioData = [Portfolio]()
    @Published var securitiesData = [Securities]()
    @Published var KYCData = [KYC]()
    @Published var firstTradingMonthData = [FirstTradingMonth]()
    @Published var secondTradingMonthData = [SecondTradingMonth]()
    @Published var thirdTradingMonthData = [ThirdTradingMonth]()
    
    init() {
        readClientData()
        readPortfolioData()
        readSecuritiesData()
        readKYCData()
        readFirstTradingMonthData()
        readSecondTradingMonthData()
        readThirdTradingMonthData()
    }
    
    
    
    // Reference link: https://firebase.google.com/docs/firestore/manage-data/add-data
//    func createData(msg1:String) {
//        // To create or overwrite a single document
//        dbCollection.document().setData(["id" : dbCollection.document().documentID,"testText":msg1]) { (err) in
//            if err != nil {
//                print((err?.localizedDescription)!)
//                return
//            }else {
//                print("create data success")
//            }
//        }
//    }
    
    // Reference link : https://firebase.google.com/docs/firestore/query-data/listen
    func readPortfolioData(){
        portfoliosDBCollection.addSnapshotListener { (documentSnapshot, err) in
                    if err != nil {
                        print((err?.localizedDescription)!)
                        return
                    }else {
                        print("read data success")
                    }
                    
                    documentSnapshot!.documentChanges.forEach { diff in
                        // Real time create from server
                        if (diff.type == .added) {
                            
                            let portfolioData = Portfolio(CustomerID: diff.document.documentID , Currency: diff.document.get("Curency") as! String, FeeCode: diff.document.get("FeeCode") as! String, InitialValue: diff.document.get("InitialValue") as! String, STATUS: diff.document.get("STATUS") as! String, AccType: diff.document.get("Type") as! String)
                            
                            self.portfolioData.append(portfolioData)
                        }
                        
                        // Real time modify from server
        //                if (diff.type == .modified) {
        //                    self.data = self.data.map { (eachData) -> ThreadDataType in
        //                        var data = eachData
        //                        if data.id == diff.document.documentID {
        //                            data.msg = diff.document.get("testText") as! String
        //                            return data
        //                        }else {
        //                            return eachData
        //                        }
        //                    }
        //                }
                    }
                }
    }
    
    func readSecuritiesData(){
        securitiesDBCollection.addSnapshotListener { (documentSnapshot, err) in
                    if err != nil {
                        print((err?.localizedDescription)!)
                        return
                    }else {
                        print("read data success")
                    }
                    
                    documentSnapshot!.documentChanges.forEach { diff in
                        // Real time create from server
                        if (diff.type == .added) {
                            
                            let securitiesData = Securities(Company: diff.document.get("Company") as? String ?? "", Currency: diff.document.get("Currency") as? String ?? "", Price1: diff.document.get("Price1") as? Int ?? 0, Price1Date: diff.document.get("Price1Date") as? String ?? "", Price2: diff.document.get("Price2") as? Int ?? 0, Price2Date: diff.document.get("Price2Date") as? String ?? "", Price3: diff.document.get("Price3") as? Int ?? 0, Price3Date: diff.document.get("Price3Date") as? String ?? "", Price4: diff.document.get("Price4") as? Int ?? 0, Price4Date: diff.document.get("Price4Date") as? String ?? "", Price5: diff.document.get("Price5") as? Int ?? 0, Price5Date: diff.document.get("Price5Date") as? String ?? "", ShortDescription: diff.document.get("ShortDescription") as? String ?? "")
                            
                            self.securitiesData.append(securitiesData)
                        }
                        
                        // Real time modify from server
        //                if (diff.type == .modified) {
        //                    self.data = self.data.map { (eachData) -> ThreadDataType in
        //                        var data = eachData
        //                        if data.id == diff.document.documentID {
        //                            data.msg = diff.document.get("testText") as! String
        //                            return data
        //                        }else {
        //                            return eachData
        //                        }
        //                    }
        //                }
                    }
                }
    }
    
    func readKYCData(){
        KYCDBCollection.addSnapshotListener { (documentSnapshot, err) in
                    if err != nil {
                        print((err?.localizedDescription)!)
                        return
                    }else {
                        print("read data success")
                    }
                    
                    documentSnapshot!.documentChanges.forEach { diff in
                        // Real time create from server
                        if (diff.type == .added) {
                            
                            let KYCData = KYC(ClientID: diff.document.documentID, FirstName: diff.document.get("FirstName") as? String ?? "", LastName: diff.document.get("LastName") as? String ?? "", ResidentialAddress: diff.document.get("ResidentialAddress") as? String ?? "", DateOfBirth: diff.document.get("DateOfBirth") as? String ?? "", GovernmentDocumentAttached: diff.document.get("GovernmentDocumentattached") as? String ?? "", PEPCheck: diff.document.get("PEPcheck") as? String ?? "", MailingAddress: diff.document.get("MailingAddress") as? String ?? "", TransitAccountNumber: diff.document.get("TransitAccountNumber") as? String ?? "", TransitAccountHolder: diff.document.get("TransitAccountHolder") as? String ?? "", SourceOfWealth: diff.document.get("ResidentialAddress") as? String ?? "", ClientKnowledge: diff.document.get("ClientKnowledge") as? String ?? "", PaperMailing: diff.document.get("PaperMailing") as? String ?? "", KYCCheck: diff.document.get("KYCCheck") as? String ?? "")
                            
                            self.KYCData.append(KYCData)
                            
                        }
                        
                        // Real time modify from server
        //                if (diff.type == .modified) {
        //                    self.data = self.data.map { (eachData) -> ThreadDataType in
        //                        var data = eachData
        //                        if data.id == diff.document.documentID {
        //                            data.msg = diff.document.get("testText") as! String
        //                            return data
        //                        }else {
        //                            return eachData
        //                        }
        //                    }
        //                }
                    }
                }
    }
    
    func readClientData() {
        clientDBCollection.addSnapshotListener { (documentSnapshot, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("read data success")
            }
            
            documentSnapshot!.documentChanges.forEach { diff in
                // Real time create from server
                if (diff.type == .added) {
                    
                    let clientData = Client(Birthday: diff.document.get("Birthday") as! String, CustomerStatus: diff.document.get("CustomerStatus") as! String, Domicile: diff.document.get("Domicile") as! String, InternetBankingService: diff.document.get("InternetBankingService") as! String, LanguageOfReporting: diff.document.get("LanguageOfReporting") as! String, Name: diff.document.get("Name") as! String, Nationality: diff.document.get("Nationality") as! String, RMID: diff.document.get("RMID") as! Int, ReportingCurrency: diff.document.get("ReportingCurrency") as! String, Sector: diff.document.get("Sector") as! String, Surname: diff.document.get("Surname") as! String, CustomerID: diff.document.documentID)
                    
                    self.clientData.append(clientData)
                }
                
                // Real time modify from server
//                if (diff.type == .modified) {
//                    self.data = self.data.map { (eachData) -> ThreadDataType in
//                        var data = eachData
//                        if data.id == diff.document.documentID {
//                            data.msg = diff.document.get("testText") as! String
//                            return data
//                        }else {
//                            return eachData
//                        }
//                    }
//                }
            }
        }
    }
    
    func readFirstTradingMonthData() {
            firstTMDBCollection.addSnapshotListener { (documentSnapshot, err) in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }else {
                    print("read data success")
                }
                
                documentSnapshot!.documentChanges.forEach { diff in
                    // Real time create from server
                    if (diff.type == .added) {
                        
                        let firstTradingMonthData = FirstTradingMonth(portfolioID: diff.document.documentID, dateOfTransaction: diff.document.get("DateOfTransaction") as! String, securityID: diff.document.get("Security ID1") as! String, quantity: diff.document.get("Security1Amount") as! Int, type: diff.document.get("TypeOfTransaction") as! String)
                        
                        self.firstTradingMonthData.append(firstTradingMonthData)
                    }
                    
                    // Real time modify from server
    //                if (diff.type == .modified) {
    //                    self.data = self.data.map { (eachData) -> ThreadDataType in
    //                        var data = eachData
    //                        if data.id == diff.document.documentID {
    //                            data.msg = diff.document.get("testText") as! String
    //                            return data
    //                        }else {
    //                            return eachData
    //                        }
    //                    }
    //                }
                }
            }
        }
    
    func readSecondTradingMonthData() {
            secondTMDBCollection.addSnapshotListener { (documentSnapshot, err) in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }else {
                    print("read data success")
                }
                
                documentSnapshot!.documentChanges.forEach { diff in
                    // Real time create from server
                    if (diff.type == .added) {
                        
                        let secondTradingMonthData = SecondTradingMonth(portfolioID: diff.document.documentID, dateOfTransaction: diff.document.get("Date2OfTransactions") as! String, firstSecurityID: diff.document.get("SecurityID21") as! String, firstSecurityQuantity: diff.document.get("Security21Amount") as! Int, secondSecurityID: diff.document.get("SecurityID22") as! String, secondSecurityQuantity: diff.document.get("SecurityAmount222") as! Int, firstTransactionType: diff.document.get("TransactionType") as! String, secondTransactionType: diff.document.get("Transaction22Type") as! String)
                        
                        self.secondTradingMonthData.append(secondTradingMonthData)
                    }
                    
                    // Real time modify from server
    //                if (diff.type == .modified) {
    //                    self.data = self.data.map { (eachData) -> ThreadDataType in
    //                        var data = eachData
    //                        if data.id == diff.document.documentID {
    //                            data.msg = diff.document.get("testText") as! String
    //                            return data
    //                        }else {
    //                            return eachData
    //                        }
    //                    }
    //                }
                }
            }
        }
    
    func readThirdTradingMonthData() {
            thirdTMDBCollection.addSnapshotListener { (documentSnapshot, err) in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }else {
                    print("read data success")
                }
                
                documentSnapshot!.documentChanges.forEach { diff in
                    // Real time create from server
                    if (diff.type == .added) {
                        
                        let thirdTradingMonthData = ThirdTradingMonth(portfolioID: diff.document.documentID, dateOfTransaction: diff.document.get("Date3OfTransactions") as! String, firstSecurityID: diff.document.get("SecurityID31") as! String, firstSecurityQuantity: diff.document.get("Security31Amount") as! Int, secondSecurityID: diff.document.get("SecurityID32") as! String, secondSecurityQuantity: diff.document.get("SecurityAmount3222") as! Int, firstTransactionType: diff.document.get("Transaction31Type") as! String, secondTransactionType: diff.document.get("Transaction32Type") as! String)
                        
                        self.thirdTradingMonthData.append(thirdTradingMonthData)
                    }
                    
                    // Real time modify from server
    //                if (diff.type == .modified) {
    //                    self.data = self.data.map { (eachData) -> ThreadDataType in
    //                        var data = eachData
    //                        if data.id == diff.document.documentID {
    //                            data.msg = diff.document.get("testText") as! String
    //                            return data
    //                        }else {
    //                            return eachData
    //                        }
    //                    }
    //                }
                }
            }
        }
    
    //Reference link: https://firebase.google.com/docs/firestore/manage-data/delete-data
//    func deleteData(datas: FirebaseData ,index: IndexSet) {
//        let id = datas.data[index.first!].id
//        dbCollection.document(id).delete { (err) in
//            if err != nil {
//                print((err?.localizedDescription)!)
//                return
//            }else {
//                print("delete data success")
//            }
//            datas.data.remove(atOffsets:index)
//        }
//    }
    
    // Reference link: https://firebase.google.com/docs/firestore/manage-data/add-data
//    func updateData(id: String, txt: String) {
//        dbCollection.document(id).updateData(["testText":txt]) { (err) in
//            if err != nil {
//                print((err?.localizedDescription)!)
//                return
//            }else {
//                print("update data success")
//            }
//        }
//    }
}
