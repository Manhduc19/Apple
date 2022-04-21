//
//  File+Util.swift
//  sticker
//
//  Created by Alex on 27/11/2021.
//

import FCFileManager
import Foundation

class FileUtil: NSObject {
    static let userDir: String = "userDatas"
    
    static func config() {
        // Create folder images
        FCFileManager.createDirectories(forPath: userDir)
    }

    static func listImagePathInFolder() -> [String] {
        let paths = FCFileManager.listFilesInDirectory(atPath: userDir, withExtension: "jpg") as! [String]
        log.debug("Paths: \(paths)", context: nil)
        
        let sortedFiles = paths.sorted(by: {
            ($0 as NSString).deletingPathExtension.compare(($1 as NSString).deletingPathExtension, options: .numeric) == .orderedAscending
        })
        return sortedFiles.reversed()
    }
    
    static func save(image: UIImage, complete: @escaping () -> Void) {
        let imageCounter = DefaultsUtil.getImageCounter()
        let imageName = "sticker\(imageCounter)" + ".jpg"
        let imagePath = userDir + "/" + imageName
        let status = FCFileManager.createFile(atPath: imagePath)
        log.debug("Tạo image file: \(status)", context: nil)
        let imageURL = FCFileManager.urlForItem(atPath: imagePath)!
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            do {
                try imageData.write(to: imageURL)
                log.debug("Lưu ảnh thành công", context: nil)
            } catch let e {
                log.debug("Lỗi lưu ảnh: \(e)", context: nil)
            }
        }
    }
}
