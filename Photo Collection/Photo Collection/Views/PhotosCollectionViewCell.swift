//
//  PhotoCollectionViewCell.swift
//  Photo Collection
//
//  Created by Michael Stoffer on 5/16/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var photoLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            self.updateViews()
        }
    }
    
    private func updateViews() {
        guard let photo = self.photo else { return }
        
        self.photoImageView.image = UIImage(data: photo.imageData)
        self.photoLabel.text = photo.title
    }
}
