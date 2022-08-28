//
//  PicsumViewModel.swift
//  Picsum
//
//  Created by Admin on 26/08/22.
//

import Foundation
import Combine

class PicsumViewModel: ObservableObject {

    private var cancellables = Set<AnyCancellable>()
    @Published var picusmData: [PicsumModel] = []
    private let baseURL = "https://picsum.photos/v2/list"
    weak var delegate: ReloadGalleryDataDelegate?
    var selectedZoomIndex = -1
    
    func getHomeData() {
        NetworkManager.shared.getData(baseUrl: baseURL, type: PicsumModel.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("Error is \(err)")
                case .finished:
                    print("Finished")
                }
            }
            receiveValue: { [weak self] picusmData in
                self?.picusmData = picusmData
                self?.delegate?.reloadGalleryData()
            }
            .store(in: &cancellables)
        }
}
