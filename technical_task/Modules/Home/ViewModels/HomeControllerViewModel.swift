


import Foundation

class HomeControllerViewModel {
    
    var userInfo: User?
    
    var devices: [Device] = []
    
    func request(completion: @escaping(()->())) {
        NetworkManager.shared.requstInfo(model: Model.self) { result in
            self.userInfo = result.user
            self.devices = result.devices
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
