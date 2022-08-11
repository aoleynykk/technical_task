

import Foundation

class LightControllerViewModel {
    
    var callback: ((Int)->())?
    
    func replaceValue(value: String){
        let newIntensivity = NSString(string: value).intValue
        self.callback?(Int(newIntensivity))
    }
}
