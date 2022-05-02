//
//  UIImageView+Ext.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 23/04/22.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension UIViewController {
    func popupAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: UIAlertController.Style.alert)

            let cancelAction = UIAlertAction(title: "OK",
                                             style: .cancel, handler: nil)

            alert.addAction(cancelAction)

            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            let attributedString = try NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
            let range = NSRange(location: 0, length: attributedString.length)
            attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 15), range: range)
            return attributedString
        } catch {
            return NSAttributedString()
        }
    }
    
    func localized() -> String {
        let flags = Constant.shared.getCurrentLanguage()
        let path = Bundle.main.path(forResource: flags, ofType: "lproj")
        let bundle = Bundle(path: path!)
        let localizedString = NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
        return localizedString
    }
}

extension Float {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
    
    var currencyString: String {
        let formatter = NumberFormatter()
        let identifier = Constant.shared.getCurrentLanguage() == "en" ? "en_US" : "id_ID"
        let locale = Locale(identifier: identifier)
        formatter.locale = locale
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: self as NSNumber) {
            return "\(formattedTipAmount)"
        } else {
            return ""
        }
    }
}

extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, withJSONObject object: Any, options opt: JSONSerialization.WritingOptions = []) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: object, options: opt)
        return try decode(T.self, from: data)
    }
}


