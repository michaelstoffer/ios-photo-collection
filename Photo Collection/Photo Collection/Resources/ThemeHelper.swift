//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Michael Stoffer on 5/16/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit
import Foundation

class ThemeHelper {
    init() {
        if self.themePreference == nil {
            self.setThemePreferenceToDark()
        }
    }
    
    let themePreferenceKey = "themePreferenceKey"
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere(withColor color: UIColor) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(color, forKey: themePreferenceKey)
    }
}
