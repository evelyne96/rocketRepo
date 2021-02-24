//
//  CacheDataLoader.swift
//  Rockets
//
//  Created by Suto, Evelyne on 23/02/2021.
//

import CoreData
import Foundation


protocol RocketCacheClient: class {
    func deleteCache()
    func cacheRockets(rockets: [Rocket], timestamp: Date)
    func fetchRockets() -> (rockets: [Rocket], timestamp: Date)
}

// TODO: Error handling???
// TODO: Image caching
class RocketCacheDataLoader {
    private var rocketEntityName = "Rocket"
    private var moc: NSManagedObjectContext {
        return  persistentContainer.viewContext // TODO: Use background context instead + cache client should support background cache
    }
    
    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RocketModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
}

extension RocketCacheDataLoader: RocketCacheClient {
    func cacheRockets(rockets: [Rocket], timestamp: Date) {
        createRocketFeed(rockets, timestamp)
        try? moc.save()
    }
    
    func deleteCache() {
        guard let feed = retrieveRocketFeed() else { return }
        moc.delete(feed)
        try? moc.save()
    }
    
    func fetchRockets() -> (rockets: [Rocket], timestamp: Date) {
        guard let feed = retrieveRocketFeed(),
              let rocketMOs = feed.rockets,
              let timestamp = feed.timestamp else { return ([], Date()) }
        let rockets = rocketMOs.compactMap{ $0 as? RocketMO }.compactMap{ RocketMappingUtils.mapToRocket(rocketMO: $0) }
        
        return (rockets, timestamp)
    }
    
    private func createRocketFeed(_ feed: [Rocket], _ timestamp: Date?) {
        let rocketFeed = RocketFeedMO(context: moc)
        rocketFeed.timestamp = timestamp
        rocketFeed.rockets = NSSet(array: feed.map {
            let rocketMO = RocketMO(context: moc)
            return RocketMappingUtils.setRocketMOProperties(rocketMO: rocketMO, with: $0)
        })
    }
    
    private func retrieveRocketFeed() -> RocketFeedMO? {
        let request = RocketFeedMO.fetchRequestMO()
        return try? self.moc.fetch(request).first
    }
}
