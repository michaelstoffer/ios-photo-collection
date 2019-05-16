//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Michael Stoffer on 5/16/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    // MARK: - IBOutlets and Variables
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var titleTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - IBActions and Methods
    @IBAction func addPhoto(_ sender: UIButton) {
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
    }
}
