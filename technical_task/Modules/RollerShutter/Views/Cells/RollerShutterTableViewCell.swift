


import UIKit

class RollerShutterTableViewCell: UITableViewCell {

    static let identifier = "RollerShutterTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupRollerShutterCell()
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
    
    private let positionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(displayP3Red: 0.337, green: 0.337, blue: 0.337, alpha: 1)
        label.font = label.font.withSize(Constants.shared.mediumText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let productTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "RollerShutter".localized(key: "RollerShutter")
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
    
    private func setupRollerShutterCell() {
        contentView.addSubview(statusLabel)
        contentView.addSubview(productTypeLabel)
        contentView.addSubview(deviceNameLabel)
        contentView.addSubview(positionLabel)
    }
    
    private func setupConstraints() {
        let statusLabelConstraints = [
            statusLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            statusLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8)
        ]
        
        let deviceNameLabelConstraints = [
            deviceNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            deviceNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8)
        ]
        
        let positionLabelConstraints = [
            positionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            positionLabel.leftAnchor.constraint(equalTo: statusLabel.rightAnchor, constant: 4)
        ]
        
        let productTypeLabelConstraints = [
            productTypeLabel.topAnchor.constraint(equalTo: deviceNameLabel.bottomAnchor, constant: 4),
            productTypeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8)
        ]
        NSLayoutConstraint.activate(statusLabelConstraints)
        NSLayoutConstraint.activate(positionLabelConstraints)
        NSLayoutConstraint.activate(deviceNameLabelConstraints)
        NSLayoutConstraint.activate(productTypeLabelConstraints)
    }
    
    //MARK: - Public
    
    public func setupRollerShutterCell(with data: Device) {
        positionLabel.text = String(data.position!)
        deviceNameLabel.text = data.deviceName
//        productTypeLabel.text = data.productType.rawValue
        if data.position == 0 {
            self.positionLabel.isHidden = true
            self.statusLabel.text = "Closed".localized(key: "RollerShutterClosed")
        } else {
            self.positionLabel.isHidden = false
            self.statusLabel.text = "Opened at: ".localized(key: "RollerShutterOpened")
        }
    }
}
