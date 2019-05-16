//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Michael Stoffer on 5/16/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        self.themeHelper?.setThemePreferenceToDark()
        view.backgroundColor = .darkGray
        dismiss(animated: true, completion: nil)
    }

    @IBAction func selectBlueTheme(_ sender: UIButton) {
        self.themeHelper?.setThemePreferenceToBlue()
        view.backgroundColor = .blue
        dismiss(animated: true, completion: nil)
    }
}
