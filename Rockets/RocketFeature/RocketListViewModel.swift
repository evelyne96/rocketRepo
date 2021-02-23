//
//  RocketViewModel.swift
//  Rockets
//
//  Created by Suto, Evelyne on 21/02/2021.
//

import Foundation
import CoreData

class RocketListViewModel: ObservableObject {
    private let rocketAPI: RocketAPIClient
    private let cacheAPI: RocketCacheClient
    private let pendingOperations: PendingImageOperations
    
    @Published var rocketVMs: [RocketViewModel]
    
    init(rocketAPI: RocketAPIClient, cacheAPI: RocketCacheClient) {
        self.rocketAPI = rocketAPI
        self.cacheAPI = cacheAPI
        self.rocketVMs = []
        self.pendingOperations = PendingImageOperations()
    }
    
    func fetchRocketsData() {
        let (cachedRockets, lastModified) = self.cacheAPI.fetchRockets()
        
        rocketAPI.fetchRockets(lastModified: lastModified, progressCallback: {_ in }) { [weak self] result in
            switch result {
            case .success(let rockets):
                self?.cacheAPI.deleteCache()
                self?.cacheAPI.cacheRockets(rockets: rockets, timestamp: Date())
                self?.rocketVMs = rockets.map { RocketViewModel(rocket: $0) }
                self?.rocketVMs.forEach { self?.fetchImage(for: $0) }
            case .failure(_):
                self?.rocketVMs = cachedRockets.map { RocketViewModel(rocket: $0) }
            }
        }
    }
    
    private func fetchImage(for rocketVM: RocketViewModel) {
        guard let url = rocketVM.imageURL else { return }
        rocketVM.imageDownloadstate = .inProgress
        let op = ImageDownloadOperation(url: url) { [weak rocketVM] result in
            switch result {
            case .success(let image):
                rocketVM?.image = image
                rocketVM?.imageDownloadstate = .downloaded
            // TODO: cache data
            case .failure(_):
                // TODO: call for cached data
                break
            }
        }
        
        pendingOperations.imageDownloadQueue.addOperation(op)
    }
}
