//
//  AdCustomError.swift
//  ironad
//
//  Created by Alex on 20/10/2021.
//

import Foundation

enum AdCustomError: Error {
    case unknownJSON
    case mapperJSON
}


extension AdCustomError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unknownJSON:
            return "Bạn chưa cấu hình JSON trên remote config"
        case .mapperJSON:
            return "Map JSON xảy ra lỗi. Vui lòng kiểm tra AdRemoteModel"
        }
    }
}
