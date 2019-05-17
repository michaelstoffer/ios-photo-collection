//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Michael Stoffer on 5/16/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import Foundation

class PhotoController {
    
    init() {
        self.loadFromPersistentStore()
    }

    private (set) var photos: [Photo] = []
    
    private var photoFileURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documentsDirectory.appendingPathComponent("photos.plist")
    }
    
    func createPhoto(withImageData imageData: Data, withTitle title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        self.saveToPersistentStore()
    }
    
    func updatePhoto(withPhoto photo: Photo, withImageData imageData: Data, withTitle title: String) {
        guard let i = photos.firstIndex(of: photo) else { return }
        photos[i].imageData = imageData
        photos[i].title = title
        self.saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        guard let url = self.photoFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(self.photos)
            try data.write(to: url)
        } catch {
            NSLog("Error saving photos data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = self.photoFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            self.photos = try decoder.decode([Photo].self, from: data)
        } catch {
            NSLog("Error loading photos data: \(error)")
        }
    }
}
