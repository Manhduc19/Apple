//
//  File.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 15/04/2022.
//

import Foundation
import Foundation
import FCFileManager

func saveImage(image: UIImage, completion: @escaping (URL) -> Void) {
    let imagePath = UUID().uuidString + ".jpg"
    
    if let imageURL = FCFileManager.urlForItem(atPath: imagePath) {
        do {
            let imageData = image.jpegData(compressionQuality: 1.0)
            try imageData?.write(to: imageURL)
            completion(imageURL)
        } catch {
            print("Error")
        }
    }
}

func getImageFormDocumentDirectory(lastComponent: String) -> URL {
    return FCFileManager.urlForItem(atPath: lastComponent)
}
