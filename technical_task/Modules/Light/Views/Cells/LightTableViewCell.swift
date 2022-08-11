

import UIKit

class LightTableViewCell: UITableViewCell {
    
    static let identifier = "LightTableViewCell"
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLightCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    //MARK: - Private
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        label.font = label.font.withSize(Constants.shared.mediumText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private let intensivityLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(displayP3Red: 0.337, green: 0.337, blue: 0.337, alpha: 1)
        label.font = label.font.withSize(Constants.shared.mediumText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let productTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Light".localized(key: "Light")
        label.textColor = UIColor(displayP3Red: 0.337, green: 0.337, blue: 0.337, alpha: 1)
        label.font = label.font.withSize(Constants.shared.smallText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let deviceNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        label.font = label.font.withSize(Constants.shared.mediumText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func setupLightCell() {
        contentView.addSubview(statusLabel)
        contentView.addSubview(deviceNameLabel)
        contentView.addSubview(productTypeLabel)
        contentView.addSubview(intensivityLabel)
    }
    
    private func setupConstraints() {
        let statusLabelConstraints = [
            statusLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            statusLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8)
        ]
        
        let intensivityLabelConstaints = [
            intensivityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            intensivityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ]
        
        let deviceNameLabelConstraints = [
            deviceNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            deviceNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8)
        ]
        
        let productTypeLabelConstraints = [
            productTypeLabel.topAnchor.constraint(equalTo: deviceNameLabel.bottomAnchor, constant: 4),
            productTypeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8)
        ]
        NSLayoutConstraint.activate(statusLabelConstraints)
        NSLayoutConstraint.activate(deviceNameLabelConstraints)
        NSLayoutConstraint.activate(productTypeLabelConstraints)
        NSLayoutConstraint.activate(intensivityLabelConstaints)
    }
    
    //MARK: - Public
    
    public func setupLightCell(with data: Device) {
        intensivityLabel.text = String(data.intensity!)
        deviceNameLabel.text = data.deviceName
//        productTypeLabel.text = data.productType.rawValue
        if data.intensity == 0 {
            statusLabel.text = "OFF"
        } else {
            statusLabel.text = "ON"
        }
        DispatchQueue.main.async {
            self.contentView.reloadInputViews()
        }
    }
}
