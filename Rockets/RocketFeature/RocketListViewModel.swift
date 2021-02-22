//
//  RocketViewModel.swift
//  Rockets
//
//  Created by Suto, Evelyne on 21/02/2021.
//

import Foundation

class RocketListViewModel: ObservableObject {
    private let rocketApiEndpoint = "https://api.spacexdata.com/v3/rockets"
    private let rocketAPI: RocketDataLoader
    private let pendingOperations: PendingImageOperations
    
    @Published var rockets: [RocketViewModel]
    
    init() {
        self.rockets = []
        self.rocketAPI = RocketDataLoader(url: URL(string: rocketApiEndpoint)!)
        self.pendingOperations = PendingImageOperations()
    }
    
    func fetchRocketsData() {
        rocketAPI.fetchRockets(lastModified: nil, progressCallback: {_ in }) { [weak self] result in
            switch result {
            case .success(let rockets):
                self?.rockets = rockets.map { RocketViewModel(rocket: $0) }
                self?.rockets.forEach { self?.fetchImage(for: $0) }
                // TODO: cache data
            case .failure(_):
                // TODO: call for cached data
                break
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
