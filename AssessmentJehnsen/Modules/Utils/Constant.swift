//
//  Constant.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 02/05/22.
//

import Foundation

struct Constant {
    static var shared = Constant()
    
    let supportedLanguages = ["en", "id"]
    private var currentLanguage = UserDefaultManager.shared.getLanguage()
    
    func getCurrentLanguage() -> String {
        return currentLanguage
    }
    
    mutating func saveLanguage(language: String) {
        if supportedLanguages.contains(language) {
            UserDefaultManager.shared.saveLanguage(language: language)
            currentLanguage = language
        }
    }
    
    
}
