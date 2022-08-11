


import UIKit

//protocol Delegate {
//    func replaceValue(value: Int, index: Int)
//}

@available(iOS 13, *)
class LightViewController: UIViewController {
    
    var id: Int?
        
    var viewModel = LightControllerViewModel()
    
//    var delegate: Delegate?
    
    //MARK: - ViewController Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLightViewController()
        setupConstraints()
//        if let topItem = self.navigationController?.navigationBar.topItem {
//           topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: #selector(navFunc))
//        }
    }
    
//    @objc private func navFunc() {
    //        let newIntensivity = NSString(string: intensivityLabel.text!).intValue
    //
    //        delegate?.replaceValue(value: Int(newIntensivity))
    //    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //let newIntensivity = NSString(string: intensivityLabel.text!).intValue
        viewModel.replaceValue(value: intensivityLabel.text!)
       // delegate?.replaceValue(value: Int(newIntensivity), index: id! - 1)
    }

    //MARK: - Private
    
    
    private var statusButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(statusButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let intensivityLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        label.font = label.font.withSize(Constants.shared.bigText)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let intensivitySlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(intensivityChandes), for: .valueChanged)
        slider.tintColor = UIColor(displayP3Red: 0.337, green: 0.337, blue: 0.337, alpha: 1)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let lightNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        label.font = label.font.withSize(Constants.shared.largeText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupLightViewController() {
        view.addSubview(statusButton)
        view.addSubview(intensivityLabel)
        view.addSubview(intensivitySlider)
        view.addSubview(lightNameLabel)
    }
    
    private func setupConstraints() {
        let intensivityLabelConstraints = [
            intensivityLabel.topAnchor.constraint(equalTo: lightNameLabel.bottomAnchor, constant: Constants.shared.lightBasicConstraint),
            intensivityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let statusButtonConstraints = [
            statusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusButton.topAnchor.constraint(equalTo: intensivitySlider.bottomAnchor, constant: Constants.shared.lightBasicConstraint),
            statusButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.shared.lightBasicConstraint),
            statusButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.shared.lightBasicConstraint),
            statusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.shared.lightBasicConstraint)
        ]
        
        let intensivitySliderConstraints = [
            intensivitySlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            intensivitySlider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            intensivitySlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.shared.verticalPositionSliderLenght)
            //??
        ]
        
        let lightNameLabelConstraints = [
            lightNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.shared.lightBasicConstraint),
            lightNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        NSLayoutConstraint.activate(statusButtonConstraints)
        NSLayoutConstraint.activate(intensivityLabelConstraints)
        NSLayoutConstraint.activate(intensivitySliderConstraints)
        NSLayoutConstraint.activate(lightNameLabelConstraints)
    }

    
    @objc func statusButtonPressed(sender: UIButton) {
        if sender.currentImage == UIImage(named: "DeviceLightOffIcon") {
            sender.setImage(UIImage(named:"DeviceLightOnIcon"), for: .normal)
            intensivitySlider.isEnabled = true
        }
        else if sender.currentImage == UIImage(named: "DeviceLightOnIcon"){
            sender.setImage( UIImage(named:"DeviceLightOffIcon"), for: .normal)
            intensivitySlider.isEnabled = false
            intensivitySlider.value = 0
            intensivityLabel.text = "0"
        }
    }
    
    @objc func intensivityChandes() {
        let intensivityValue = Int(intensivitySlider.value)
        intensivityLabel.text = String(intensivityValue)
    }
    
    
    //MARK: - Public
    
    public func setupLightInfoPage(with data: Device) {
        self.id = data.id
        intensivitySlider.value = Float(data.intensity!)
        lightNameLabel.text = data.deviceName
        intensivityLabel.text = "\(data.intensity ?? 0)"
        if data.intensity == 0 {
            statusButton.setImage(UIImage(named: "DeviceLightOffIcon"), for: .normal)
            intensivitySlider.isEnabled = false
        } else {
            statusButton.setImage(UIImage(named: "DeviceLightOnIcon"), for: .normal)
        }
        DispatchQueue.main.async {
            self.view.reloadInputViews()
        }
    }
}
