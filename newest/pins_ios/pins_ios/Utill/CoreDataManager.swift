//
//  CoreDataManager.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/20.
//

import UIKit

import UIKit
import CoreData

enum CoreDataName: String {
    case recentResearch = "RecentResearchTerm"
}

class CoreDataManager {
    static let shared: CoreDataManager = CoreDataManager()
    
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    private lazy var context = appDelegate?.persistentContainer.viewContext
    
    // MARK: - 해당 정보를 저장한다
    func saveRecentSearch(term: String, index: Int16, type: Int16, completion: @escaping (Bool) -> Void) {
        guard let context = self.context,
              let entity = NSEntityDescription.entity(forEntityName: CoreDataName.recentResearch.rawValue, in: context)
        else { return }
        
        guard let recentTerms = NSManagedObject(entity: entity, insertInto: context) as? RecentResearchTerm else { return }
        
        recentTerms.term = term
        recentTerms.index = index
        recentTerms.type = type
        
        do {
            try context.save()
            completion(true)
        } catch {
            print(error.localizedDescription)
            completion(false)
        }
    }
    
    // MARK: - 해당 정보를 가져온다.
    func getUsers(ascending: Bool = false) -> [RecentResearchTerm]{
        var models: [RecentResearchTerm] = [RecentResearchTerm]()
        
        if let context = context {
            let idSort: NSSortDescriptor = NSSortDescriptor(key: "index", ascending: ascending)
            let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest<NSManagedObject>(entityName: CoreDataName.recentResearch.rawValue)
            fetchRequest.sortDescriptors = [idSort]
            
            do{
                if let fetchResult: [RecentResearchTerm] = try context.fetch(fetchRequest) as? [RecentResearchTerm] {
                    models = fetchResult
                }
            } catch let error as NSError {
                print("Could not fetch: \(error), \(error.userInfo)")
            }
        }
        return models
    }
    // MARK: - 해당 정보를 삭제한다.
    func deleteUser(id: Int16, onSuccess: @escaping ((Bool) -> Void)) {
        let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest<NSManagedObject>(entityName: CoreDataName.recentResearch.rawValue)
        do {
            if let results: [RecentResearchTerm] = try context!.fetch(fetchRequest) as? [RecentResearchTerm] {
                if results.count != 0 {
                    context?.delete(results[0])
                }
            }
        } catch let error as NSError {
            print("Could not fatch🥺: \(error), \(error.userInfo)")
            onSuccess(false)
        }
        contextSave { success in
            onSuccess(success)
        }
    }
}

extension CoreDataManager {
    fileprivate func filteredRequest(id: Int16) -> NSFetchRequest<NSFetchRequestResult> {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
            = NSFetchRequest<NSFetchRequestResult>(entityName: CoreDataName.recentResearch.rawValue)
        fetchRequest.predicate = NSPredicate(format: "index = %@", NSNumber(value: id))
        return fetchRequest
    }
    
    fileprivate func contextSave(onSuccess: ((Bool) -> Void)) {
        do {
            try context?.save()
            onSuccess(true)
        } catch let error as NSError {
            print("Could not save🥶: \(error), \(error.userInfo)")
            onSuccess(false)
        }
    }
}
