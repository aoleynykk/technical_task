


import UIKit

@available(iOS 13, *)
class RollerShutterViewController: UIViewController {
    
    var completionHandler: ((Int?) -> ())?
    
    var viewModel = RollerShutterControllerViewModel()
    
    //MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupRollerShutterController()
        setupConstraints()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let value = NSString(string: positionLabel.text!).intValue
        completionHandler?(Int(value))
    }
    
    //MARK: - Private
    
    private let positionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        label.font = label.font.withSize(Constants.shared.bigText)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let positionSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.isContinuous = true
        slider.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        slider.frame.size = CGSize(width: Constants.screenWidth(), height: 50)
        slider.tintColor = UIColor(displayP3Red: 0.337, green: 0.337, blue: 0.337, alpha: 1)
        slider.addTarget(self, action: #selector(positionChanges), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    @objc func positionChanges() {
        let positionValue = Int(positionSlider.value)
        positionLabel.text = String(positionValue)
    }
    
    private let rollerShutterNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        label.font = label.font.withSize(Constants.shared.largeText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupRollerShutterController() {
        view.addSubview(positionLabel)
        view.addSubview(positionSlider)
        view.addSubview(rollerShutterNameLabel)
    }
    
    private func setupConstraints() {
        let positionLabelConstraints = [
            positionLabel.topAnchor.constraint(equalTo: positionSlider.bottomAnchor, constant: Constants.screenWidth()/3),
            positionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        
        let positionSliderConstraints = [
            positionSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            positionSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            positionSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.screenWidth()/6)
        ]
        
        let rollerShutterNameLabelConstraints = [
            rollerShutterNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.screenWidth()/4),
            rollerShutterNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollerShutterNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            rollerShutterNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
            
        ]
        NSLayoutConstraint.activate(positionLabelConstraints)
        NSLayoutConstraint.activate(positionSliderConstraints)
        NSLayoutConstraint.activate(rollerShutterNameLabelConstraints)
    }
    
    //MARK: - Public
    
    public func setupRollerShutterInfoPage(with data: Device) {
        self.rollerShutterNameLabel.text = data.deviceName
        self.positionSlider.value = Float(data.position!)
        self.positionLabel.text = String(data.position!)
    }
}



