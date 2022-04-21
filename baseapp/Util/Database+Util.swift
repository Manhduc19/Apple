//
//  Database+Util.swift
//  sticker
//
//  Created by Alex on 25/11/2021.
//

import Foundation
import RealmSwift

let realmObject = try! Realm()

class DNRealm: NSObject {

    static let shared = DNRealm()

    func retrieveAllDataForObject(_ T : Object.Type) -> [Object] {

        var objects = [Object]()
        for result in realmObject.objects(T) {
            objects.append(result)
        }
        return objects
    }

    func deleteAllDataForObject(_ T : Object.Type) {

        self.delete(self.retrieveAllDataForObject(T))
    }

    func replaceAllDataForObject(_ T : Object.Type, with objects : [Object]) {

        deleteAllDataForObject(T)
        add(objects)
    }

    func add(_ objects : [Object], completion : @escaping() -> ()) {

        try! realmObject.write{
            print("Write object")
            realmObject.add(objects)
            completion()
        }
    }

    func add(_ objects : [Object]) {

        try! realmObject.write{
            print("Write object")
            realmObject.add(objects)
        }
    }

    func update(_ block: @escaping ()->Void) {
        try! realmObject.write(block)
    }

    func delete(_ objects : [Object]) {
        try! realmObject.write{
            realmObject.delete(objects)
        }
    }
}
