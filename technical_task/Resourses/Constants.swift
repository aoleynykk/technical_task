


import Foundation
import UIKit

struct Constants {
    
    static let shared = Constants()
    
    private init() { }
    
    let urlString = "http://storage42.com/modulotest/data.json"
    
    static func screenHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    static func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    var verticalPositionSliderLenght = screenWidth()/30
    
    let lightBasicConstraint = screenWidth()/4
    
    let bigText = screenWidth()/15
    
    let largeText = screenWidth()/10
    
    let mediumText = screenWidth()/20
    
    let smallText = screenWidth()/25
    
}
