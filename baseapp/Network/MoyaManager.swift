//
//  MoyaManager.swift
//  baseapp
//
//  Created by Alex on 05/01/2022.
//

import Foundation
import Moya

let provider = MoyaProvider<Target>(plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter)))])

enum Target {
    case plantIdentify(image: UIImage)  // plant
    case bugIdentify(image: UIImage)   // Bug
}

extension Target: TargetType {
    var baseURL: URL {
        switch self {
        case .plantIdentify:
            return URL(string: "http://plant.aitools.fun")!
        case .bugIdentify:
            return URL(string: "http://objectdetector.aitools.fun")!
        }
    }

    var path: String {
        switch self {
        case .plantIdentify:
            return "/apiv2/detectplant"
        case .bugIdentify:
            return "/apiv2/detectinsect"
        }
    }

    var method: Moya.Method {
        return .post
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        return .uploadMultipart(multipartBody!)
    }

    var headers: [String: String]? {
      return nil
    }

    var parameters: [String: Any]? {
      return nil
    }

    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.queryString
    }

    // put files in MultipartFormData Arry
    var multipartBody: [Moya.MultipartFormData]? {
        switch self {
        case .plantIdentify( let image):
            let imageName = UUID().uuidString + ".jpg"
            let mimeType: String = "image/jpg"
            let imageData = image.jpegData(compressionQuality: 1.0)!
            let imageProvider = Moya.MultipartFormData(provider: .data(imageData),
                                                       name: "image",
                                                       fileName: imageName,
                                                       mimeType: mimeType)
            return [imageProvider]
        case .bugIdentify(let image):
            let imageName = UUID().uuidString + ".jpg"
            let mimeType: String = "image/jpg"
            let imageData = image.jpegData(compressionQuality: 1.0)!
            let imageProvider = Moya.MultipartFormData(provider: .data(imageData),
                                                       name: "image",
                                                       fileName: imageName,
                                                       mimeType: mimeType)
            return [imageProvider]
        }
    }

    var localLocation: URL {
        return assetDir
    }

    var downloadDestination: DownloadDestination {
        return { _, _ in (self.localLocation, .removePreviousFile) }
    }
}

private func JSONResponseDataFormatter(data: Data) -> String {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
    } catch {
        return String(data: data, encoding: .utf8) ?? ""
    }
}

private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

private let assetDir: URL = {
    let directoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return directoryURLs.first ?? URL(fileURLWithPath: NSTemporaryDirectory())
}()

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

// MARK: - Response Handlers

extension Moya.Response {
    func mapNSArray() throws -> NSArray {
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}
