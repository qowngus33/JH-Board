//
//  DataManager.swift
//  JHBoard
//
//  Created by 배주현 on 2022/01/07.
//

import Foundation
import CoreData

class DataManager {
    static let shared = DataManager()
    private init() {
        //Singleton 싱글톤
    }
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var memoList = [Memo]()
    
    func fetchMemo() {
        //fetch: 데이터를 데이터베이스에서 가져오는 것
        let request: NSFetchRequest<Memo> = Memo.fetchRequest()
        
        let sortByDateDesc = NSSortDescriptor(key: "insertDate",ascending: false)
        request.sortDescriptors = [sortByDateDesc]
        //메모를 날짜 순으로 가져옴
        
        do {
            memoList = try mainContext.fetch(request)
            //가져온 데이터를 메모리스트에 저장
        } catch {
            print(error)
        }
        
    }
    
    func addNewMemo (_ memo: String?) {
        let newMemo = Memo(context: mainContext)
        newMemo.content = memo
        newMemo.insertDate = Date()
        
        saveContext()
    }
    
    
    
    
    func deleteMemo(_ memo: Memo?) {
        if let memo = memo {
            mainContext.delete(memo)
            saveContext()
        }
    }
    
    
    
    
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "JHBoard")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()


    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
