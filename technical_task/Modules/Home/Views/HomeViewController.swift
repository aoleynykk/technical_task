

import UIKit

@available(iOS 13, *)
class HomeViewController: UIViewController {
    
    var viewModel = HomeControllerViewModel()
    
    weak var coordinator: MainCoordinator?
    
    //MARK: - ViewController Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeTableView)
        homeTableView.delegate = self
        homeTableView.dataSource = self
        request()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeTableView.frame = view.bounds
    }
    
    //MARK: - Private
    
    private let homeTableView: UITableView = {
        let table = UITableView()
        table.register(LightTableViewCell.self, forCellReuseIdentifier: LightTableViewCell.identifier)
        table.register(RollerShutterTableViewCell.self, forCellReuseIdentifier: RollerShutterTableViewCell.identifier)
        table.register(HeaterTableViewCell.self, forCellReuseIdentifier: HeaterTableViewCell.identifier)
        return table
    }()
    
    private func request() {
        viewModel.request {
            self.homeTableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let headerView = UserHeaderView(frame: CGRect(x: 0, y: 0, width: Constants.screenWidth(), height: Constants.screenWidth()))
        headerView.setupHeader(with: viewModel.userInfo!)
        homeTableView.tableHeaderView = headerView
        switch viewModel.devices[indexPath.row].productType {
        case .light:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LightTableViewCell.identifier, for: indexPath) as? LightTableViewCell else { return UITableViewCell() }
            cell.setupLightCell(with: viewModel.devices[indexPath.row])
            return cell
        case .rollerShutter:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RollerShutterTableViewCell.identifier, for: indexPath) as? RollerShutterTableViewCell else { return UITableViewCell() }
            cell.setupRollerShutterCell(with: viewModel.devices[indexPath.row])
            return cell
        case .heater:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaterTableViewCell.identifier, for: indexPath) as? HeaterTableViewCell else { return UITableViewCell() }
            cell.setupHeaterCell(with: viewModel.devices[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch viewModel.devices[indexPath.row].productType {
        case .heater:
            let heater = viewModel.devices[indexPath.row]
            self.coordinator?.showHeaterDetail(of: heater)
        case .light:
            //WORKING CALLBACK
////            let infoController = LightViewController()
////            infoController.setupLightInfoPage(with: viewModel.devices[indexPath.row])
////            infoController.viewModel.callback = { intensivity in
////                self.viewModel.devices[indexPath.row].intensity = intensivity
////                DispatchQueue.main.async {
////                    self.homeTableView.reloadData()
////                }
////            }
////            self.navigationController?.pushViewController(infoController, animated: true)
////
            let light = viewModel.devices[indexPath.row]
//            coordinator?.showLightDetail(light: light, competition: { intensivity, index in
//                self.viewModel.devices[indexPath.row].intensity = intensivity
//                DispatchQueue.main.async {
//                    self.homeTableView.reloadData()
//                }
//            })
            self.coordinator?.showLightDetail(light: light)
        case .rollerShutter:
            let rollerShutter = viewModel.devices[indexPath.row]
            self.coordinator?.showRollerShuttertDetail(of: rollerShutter)
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.screenWidth()/2
    }
}





