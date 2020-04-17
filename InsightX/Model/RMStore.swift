import Combine

class RMStore: ObservableObject {
    
    @Published var cred = [
        "1957":"123456",
        "1917":"323456",
        "1997":"103456",
        "1907":"123156",
        "1958":"123956",
        "1951":"123450"].map{ RM(email: $0, password: $1) }
   
}


