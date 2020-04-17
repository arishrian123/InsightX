import Firebase

class FirestoreTask{
    
    var db = Firestore.firestore()
    
     func getCollection() {
        // [START get_collection]
        db.collection("clients").whereField("RMID", isEqualTo: 1957).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    
                }
            }
        }
    }
    
}


