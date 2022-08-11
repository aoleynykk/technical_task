

import UIKit

@available(iOS 13, *)
class HeaterViewController: UIViewController {
    
    var completionHandler: ((Int?) -> ())?
    
    var viewModel = HeaterControllerViewModel()

    //MARK: - ViewController Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViewController()
        setupConstraints()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let value = NSString(string: temperatureLabel.text!).intValue
        completionHandler?(Int(value))
    }
    
    //MARK: - Private
    
    private let statusButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(statusButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        label.font = label.font.withSize(Constants.shared.bigText)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let temperatureSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 7
        slider.maximumValue = 28
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(temperatureChandes), for: .valueChanged)
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
    
    private func setupViewController() {
        view.addSubview(statusButton)
        view.addSubview(temperatureLabel)
        view.addSubview(temperatureSlider)
        view.addSubview(lightNameLabel)
    }
    
    private func setupConstraints() {
        let temperatureLabelConstraints = [
            temperatureLabel.topAnchor.constraint(equalTo: lightNameLabel.bottomAnchor, constant: Constants.shared.lightBasicConstraint),
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let statusButtonConstraints = [
            statusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusButton.topAnchor.constraint(equalTo: temperatureSlider.bottomAnchor, constant: Constants.shared.lightBasicConstraint),
            statusButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.shared.lightBasicConstraint),
            statusButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.shared.lightBasicConstraint),
            statusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.shared.lightBasicConstraint)
        ]
        
        let temperatureSliderConstraints = [
            temperatureSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatureSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            temperatureSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.shared.verticalPositionSliderLenght)
            //??
        ]
        
        let lightNameLabelConstraints = [
            lightNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.shared.lightBasicConstraint),
            lightNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        NSLayoutConstraint.activate(statusButtonConstraints)
        NSLayoutConstraint.activate(temperatureLabelConstraints)
        NSLayoutConstraint.activate(temperatureSliderConstraints)
        NSLayoutConstraint.activate(lightNameLabelConstraints)
    }

    
    @objc func statusButtonPressed(sender: UIButton) {
        if sender.currentImage == UIImage(named: "DeviceHeaterOffIcon") {
            sender.setImage(UIImage(named:"DeviceHeaterOnIcon"), for: .normal)
            temperatureSlider.isEnabled = true
        }
        else if sender.currentImage == UIImage(named: "DeviceHeaterOnIcon"){
            sender.setImage( UIImage(named:"DeviceHeaterOffIcon"), for: .normal)
            temperatureSlider.isEnabled = false
        }
    }
    
    @objc func temperatureChandes() {
        //let temperatureValue = Float(temperatureSlider.value)
        let temperatureValue = roundf(temperatureSlider.value / 0.5) * 0.5
        temperatureLabel.text = String(temperatureValue)
    }
    
    
    //MARK: - Public
    
    public func setupHeaterInfoPage(with data: Device) {
        temperatureSlider.value = Float(data.temperature!)
        lightNameLabel.text = data.deviceName
        temperatureLabel.text = "\(data.temperature ?? 0)"
        if data.mode == "OFF" {
            statusButton.setImage(UIImage(named: "DeviceHeaterOffIcon"), for: .normal)
            temperatureSlider.isEnabled = false
        } else if data.mode == "ON" {
            statusButton.setImage(UIImage(named: "DeviceHeaterOnIcon"), for: .normal)
        }
    }
}
