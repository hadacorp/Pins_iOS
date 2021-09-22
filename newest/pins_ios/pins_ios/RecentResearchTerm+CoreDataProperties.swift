//
//  RecentResearchTerm+CoreDataProperties.swift
//  
//
//  Created by judongseok on 2021/09/20.
//
//

import Foundation
import CoreData


extension RecentResearchTerm {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecentResearchTerm> {
        return NSFetchRequest<RecentResearchTerm>(entityName: "RecentResearchTerm")
    }

    @NSManaged public var index: Int16
    @NSManaged public var term: String?
    @NSManaged public var type: Int16
}
