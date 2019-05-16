//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Michael Stoffer on 5/16/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import Foundation

class PhotoController {
    private (set) var photos: [Photo] = []
    
    func createPhoto(withImageData imageData: Data, withTitle title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func updatePhoto(withPhoto photo: Photo, withImageData imageData: Data, withTitle title: String) {
        guard let i = photos.firstIndex(of: photo) else { return }
        photos[i].imageData = imageData
        photos[i].title = title
    }
}
