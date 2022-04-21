//
//  DatabaseManager.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 15/04/2022.
//

import Foundation
import Realm
import RealmSwift

class DatabaseManager: NSObject {
    
    let realm = try! Realm()
    
    static let shared = DatabaseManager()
    
    func createImage(plantbugModel: ItemModel) {
        let plantbugImage : [String] = plantbugModel.images
        let model = PlantBugModel.init()
        model.image = plantbugModel.image
        model.date = plantbugModel.date
        model.confidence = plantbugModel.confidence
        model.myDescription = plantbugModel.getDesc()
        model.name = plantbugModel.name
        model.wiki = plantbugModel.wiki_link
        if let commonName = plantbugModel.commonName.first {
            model.commonname = commonName
        }
        model.gallery.append(objectsIn: plantbugImage)

        try! realm .write {
            realm.add(model)
        }
        print("Luu Thanh Cong history ")
    }
    
    func listHistoryImage() -> [PlantBugModel] {
        let images = realm.objects(PlantBugModel.self)
        var arrs = [PlantBugModel]()
        for i in images {
            arrs.append(i)
        }
        return arrs.sorted(by: {$0.date > $1.date})
    }
    
    func createdCollectionModel(collectionModel: ItemModel) {
        let collectionImage : [String] = collectionModel.images
        let model = CollectionModel.init()
        model.image = collectionModel.image
        model.date = collectionModel.date
        model.confidence = collectionModel.confidence
        model.myDescription = collectionModel.getDesc()
        model.name = collectionModel.name
        model.wiki = collectionModel.wiki_link
        if let commonName = collectionModel.commonName.first {
            model.commonname = commonName
        }
        model.gallery.append(objectsIn: collectionImage)
        
        try! realm .write {
            realm.add(model)
        }
        print("Luu Thanh Cong plant Collection")
    }
    
    func getCollectionImages() -> [CollectionModel] {
        let images = realm.objects(CollectionModel.self)
        
        var collectionArrs = [CollectionModel]()
        for i in images {
            collectionArrs.append(i)
        }
        return collectionArrs.sorted(by: {$0.date > $1.date})
    }
    // bug
    func createBugModel(bugModel : ItemModel) {
        let bugModelImage : [String] = bugModel.images
        let model = BugModel.init()
        model.image = bugModel.image
        model.date = bugModel.date
        model.confidence = bugModel.confidence
        model.myDescription = bugModel.getDesc()
        model.name = bugModel.name
        model.wiki = bugModel.wiki_link
        model.gallery.append(objectsIn: bugModelImage)
        try! realm .write {
            realm.add(model)
        }
        print("Luu Thanh Cong bug collection")
    }
    func getBugImages() -> [BugModel]{
        let images = realm.objects(BugModel.self)
        var bugArrs = [BugModel]()
        for i in images {
            bugArrs.append(i)
        }
        return bugArrs.sorted(by: {$0.date > $1.date} )
    }
    
    
    
    
    // Xoa lich su
    func deleteHistory(id id: String, complete: @escaping () -> Void) {
        // Buoc 1: Minh phai tim duoc realm object co trung id vs id truyen vao
        if let plantbugToDelete = realm.object(ofType: PlantBugModel.self, forPrimaryKey: id) {
            // Buoc 2
            try! realm.write {
                realm.delete(plantbugToDelete)
                complete()
            }
        }
    }
    // xoa collection
    func deletePlant(id id: String, complete: @escaping () -> Void) {
        if let plantbugCollectionToDelete = realm.object(ofType: CollectionModel.self, forPrimaryKey: id) {
            try! realm.write({
                realm.delete(plantbugCollectionToDelete)
                complete()
            })
        }
    }
    
    // delete Bug
    func deleteBug(id id: String, complete: @escaping () -> Void) {
        if let BugToDelete = realm.object(ofType: BugModel.self, forPrimaryKey: id) {
            try! realm.write({
                realm.delete( BugToDelete)
                complete()
            })
        }
    }
    
}
