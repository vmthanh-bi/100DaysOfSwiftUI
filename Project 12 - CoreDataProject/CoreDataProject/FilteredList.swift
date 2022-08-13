//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Tony Vu on 11/16/21.
//

import CoreData
import SwiftUI

enum Predicates: String {
    case beginsWith = "BEGINSWITH"
    case endsWith = "ENDSWITH"
    case equals = "=="
    case contains = "CONTAINS"
    case like = "LIKE"
    case matches = "MATCHES"
    case beginsWithIgnoreCase = "BEGINSWITH[c]"
    case endsWithIgnoreCase = "ENDSWITH[c]"
    case containsIgnoreCase = "CONTAINS[c]"
    case likeIgnoreCase = "LIKE[c]"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(descriptorArray: [NSSortDescriptor], predicate: Predicates, filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: descriptorArray, predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}
