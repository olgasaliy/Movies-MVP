//
//  FavoriteRepository.swift
//  MoviesNew
//
//  Created by Olga Saliy on 9/3/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import CoreData

class FavoriteRepository {
    
    private let container: CoreDataConteiner
    
    init(_ container: CoreDataConteiner) {
        self.container = container
    }
    
    func fetchAll() -> [MovieDetails] {
        do {
            return try container.viewContext
                .fetch(CDMovieDetails.fetchRequest())
                .compactMap { $0.asMappable() }
            
        } catch {
            print(error.localizedDescription)
        }
        
        return []
    }
    
    func fetch(by name: String) -> [MovieDetails] {
        do {
            let fetchRequest: NSFetchRequest = CDMovieDetails.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "title contains[c] %@", name)
            let fetchedResults = try container.viewContext.fetch(fetchRequest)
            return fetchedResults.compactMap { $0.asMappable() }
        } catch {
            print(error.localizedDescription)
        }
        
        return []
    }
    
    private func fetchManagedObject(by id: Int) -> CDMovieDetails? {
        do {
            let fetchRequest: NSFetchRequest = CDMovieDetails.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %f", Double(id))
            let fetchedResults = try container.viewContext.fetch(fetchRequest)
            if let movie = fetchedResults.first {
                return movie
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    func fetch(by id: Int) -> MovieDetails? {
        return fetchManagedObject(by: id)?.asMappable()
    }
    
    func contains(movie: MovieDetails) -> Bool {
        return fetch(by: movie.id) != nil
    }
    
    func add(_ movie: MovieDetails) {
        let context = container.writeContext
        container.writeContext.perform {
            _ = movie.asManagedObject(with: context)
            context.saveOrRollback()
        }
    }
    
    func remove(_ movie: MovieDetails) {
        guard let managedObject = fetchManagedObject(by: movie.id) else {
            return
        }
        container.viewContext.delete(managedObject)
        container.viewContext.saveOrRollback()
    }
    
    
}
