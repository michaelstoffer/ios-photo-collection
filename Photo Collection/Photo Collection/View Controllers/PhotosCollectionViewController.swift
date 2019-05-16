//
//  PhotoCollectionViewController.swift
//  Photo Collection
//
//  Created by Michael Stoffer on 5/16/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    // MARK: - IBOutlets and Variables
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setTheme()
        collectionView.reloadData()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToEditPhoto" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else { return }

            let cell = sender as? PhotosCollectionViewCell

            photoDetailVC.photo = cell?.photo
            photoDetailVC.photoController = self.photoController
            photoDetailVC.themeHelper = self.themeHelper
        } else if segue.identifier == "ToAddPhoto" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else { return }

            photoDetailVC.photoController = self.photoController
            photoDetailVC.themeHelper = self.themeHelper
        } else if segue.identifier == "ToThemeSelection" {
            guard let themeSelectionVC = segue.destination as? ThemeSelectionViewController else { return }

            themeSelectionVC.themeHelper = self.themeHelper
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
    
        let photo = self.photoController.photos[indexPath.row]
        cell.photo = photo
        cell.photoImageView.image = UIImage(data: photo.imageData)
        cell.photoLabel.text = photo.title
    
        return cell
    }

    func setTheme() {
        guard let preference = self.themeHelper.themePreference else { return }
        
        if preference == "Dark" {
            collectionView.backgroundColor = .darkGray
        } else {
            collectionView.backgroundColor = .blue
        }
    }
}
