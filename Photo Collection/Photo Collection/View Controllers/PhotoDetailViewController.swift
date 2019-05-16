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
        self.updateViews()
    }

    // MARK: - IBActions and Methods
    @IBAction func addPhoto(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        guard let image = self.photoImageView.image,
            let title = self.titleTextField.text,
            let imageData = image.pngData() else { return }
        
        if let photo = self.photo {
            self.photoController?.updatePhoto(withPhoto: photo, withImageData: imageData, withTitle: title)
        } else {
            self.photoController?.createPhoto(withImageData: imageData, withTitle: title)
        }
        navigationController?.popViewController(animated: true)
    }
    
    private func setTheme() {
        guard let preference = self.themeHelper?.themePreference else { return }
        
        if preference == "Dark" {
            view.backgroundColor = .darkGray
        } else {
            view.backgroundColor = .blue
        }
    }
    
    private func updateViews() {
        self.setTheme()
        
        if let photo = self.photo {
            navigationItem.title = "Update Photo"
            self.photoImageView.image = UIImage(data: photo.imageData)
            self.titleTextField.text = photo.title
        } else {
            navigationItem.title = "Add Photo"
        }
    }
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        self.photoImageView.image = image
    }
}

extension PhotoDetailViewController: UINavigationControllerDelegate {
    
}
