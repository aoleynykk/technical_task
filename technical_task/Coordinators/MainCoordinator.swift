


import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var mainControllerViewModel = HomeControllerViewModel()
    
    var navigationController = UINavigationController()
    
    func start() {
        let initialViewController = HomeViewController()
        initialViewController.coordinator = self
        navigationController.pushViewController(initialViewController, animated: true)
    }

   
    func showLightDetail(light: Device/* index: Int, devices: [Device] *//*competition: @escaping (Int, Int) -> ()*/) {
        let lightDetailViewController = LightViewController()
        lightDetailViewController.setupLightInfoPage(with: light)
        navigationController.pushViewController(lightDetailViewController, animated: true)
    }
    
    func showRollerShuttertDetail(of rollerShutter: Device) {
        let rollerShutterDetailViewController = RollerShutterViewController()
        rollerShutterDetailViewController.setupRollerShutterInfoPage(with: rollerShutter)
        navigationController.pushViewController(rollerShutterDetailViewController, animated: true)
    }
    
    func showHeaterDetail(of heater: Device) {
        let heaterDetailViewController = HeaterViewController()
        heaterDetailViewController.setupHeaterInfoPage(with: heater)
        navigationController.pushViewController(heaterDetailViewController, animated: true)
    }
}

