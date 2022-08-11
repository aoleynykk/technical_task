

import UIKit

class UserHeaderView: UIView {
    //Halvetica
    
    private let userAddressLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        label.font = label.font.withSize(Constants.shared.mediumText)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        label.font = label.font.withSize(Constants.shared.bigText)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person.crop.circle")
        return imageView
    }()
    
    private let userExactAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "Street & Postal code"
        label.textColor = UIColor(displayP3Red: 0.337, green: 0.337, blue: 0.337, alpha: 1)
        label.font = label.font.withSize(Constants.shared.smallText)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func setupConstraints() {
        let userNameLabelConstraints = [
            userNameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 16),
            userNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        let userAddressLabelConstraints = [
            userAddressLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 8),
            userAddressLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        let userExactAddressLabelConstraints = [
            userExactAddressLabel.topAnchor.constraint(equalTo: userAddressLabel.bottomAnchor, constant: 8),
            userExactAddressLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(userNameLabelConstraints)
        NSLayoutConstraint.activate(userAddressLabelConstraints)
        NSLayoutConstraint.activate(userExactAddressLabelConstraints)
    }
    
    private func setupUserHeader() {
        addSubview(userImage)
        addSubview(userNameLabel)
        addSubview(userAddressLabel)
        addSubview(userExactAddressLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUserHeader()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userImage.frame = CGRect(x: bounds.width/4, y: 0, width: bounds.height/2, height: bounds.width/2)
        userImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupHeader(with userInfo: User) {
        self.userNameLabel.text = "\(userInfo.firstName) \(userInfo.lastName)"
        self.userAddressLabel.text = "\(userInfo.address.country) \(userInfo.address.city)"
        self.userExactAddressLabel.text = "\(userInfo.address.street) \(userInfo.address.streetCode), \(userInfo.address.postalCode)"
    }
}
