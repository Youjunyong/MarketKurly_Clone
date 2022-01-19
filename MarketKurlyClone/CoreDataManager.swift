//
//  CoreDataManager.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/18.
//


import CoreData


class UserDataManager{
    static let shared = UserDataManager()
    private init(){
       
    }
    
    var is_init: Bool = false
    var didReload: Bool = false
    
    var registerInfo : [String: String] = [
        "id": "",
        "pw": "",
        "name": "",
        "email": "",
        "phone": "",
        "address": "",
        "postcode": ""
    ]
    var token: String?
    var id = "0"
    var userName: String?
    var isSignIn: Bool = false
    var address: String?
    var postcode: String?
    
    var level: String?
    var coupon: Int = 1
    var point: Int = 500
    var bookmark: Int = 0
    
}

//class CoreDataManager{
//  static let shared = CoreDataManager()
//
//  private init(){
//  }
//  var mainContext : NSManagedObjectContext{
//    return persistentContainer.viewContext
//
//  }
//    var infoList = [Info]()
//
//    func fetchInfo() {
//        let request : NSFetchRequest<Info> = Info.fetchRequest()
////        let sortByDateDesc = NSSortDescriptor(key : "date", ascending : false)
////        request.sortDescriptors = [sortByDateDesc]
//        do{
//            try infoList = mainContext.fetch(request)
//        }catch{
//            print(error)
//        }
//      }
//
//    func addNewInfo(_ info: [String:String]){
//
//      let newRecord = Record(context : mainContext)
//        newRecord.image = img
//        newRecord.date = Date()
//        newRecord.celebrityValue = record["celebrityValue"]
//        newRecord.celebrityConfidence = record["celebrityConfidence"]
//        newRecord.faceGenderValue = record["genderValue"]
//        newRecord.faceGenderConfidence = record["genderConfidence"]
//        newRecord.faceAgeValue = record["ageValue"]
//        newRecord.faceAgeConfidence = record["ageConfidence"]
//        newRecord.facePoseConfidence = record["poseConfidence"]
//        newRecord.facePoseValue = record["poseValue"]
//        newRecord.faceEmotionValue = record["emotionValue"]
//        newRecord.faceEmotionConfidence = record["emotionConfidence"]
//
////                let container = NSPersistentContainer(name: "FindSimilarCelebrities")
////                  print(container.persistentStoreDescriptions.first?.url)
//        saveContext()
//        fetchRecord()
//    }
//
//    func delRecord(_ record: Info?){
//        if let record = record{
//
////            let index = memoList.firstIndex(of: memo)
//
//            mainContext.delete(record)
//            saveContext()
//            fetchRecord()
//        }
//
//
//    }
//
//
//
//    lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "MarketKurlyClone")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//
//    // MARK: - Core Data Saving support
//    func saveContext () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
//}
