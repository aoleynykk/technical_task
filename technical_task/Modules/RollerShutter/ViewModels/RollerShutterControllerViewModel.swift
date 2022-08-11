


import Foundation

class RollerShutterControllerViewModel {
    
    var callback: ((Int)->())?
    
    func replaceValue(value: String){
        let newPosition = NSString(string: value).intValue
        self.callback?(Int(newPosition))
    }
    
}
