


import Foundation

class HeaterControllerViewModel {
    
    var callback: ((Int)->())?
    
    func replaceValue(value: String){
        let newTemperature = NSString(string: value).intValue
        self.callback?(Int(newTemperature))
    }
}
