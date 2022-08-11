

import Foundation

extension String {
    func localized(key: String) -> String {
        NSLocalizedString(key,
                          tableName: "Localizable",
                          bundle: .main,
                          value: self,
                          comment: self)
    }
}
