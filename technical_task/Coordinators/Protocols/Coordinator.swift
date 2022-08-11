//
//  Coordinator.swift
//  technical_task
//
//  Created by Олександр Олійник on 07.08.2022.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get }
    
    func start()
    
}
