//
//  MarketDataService.swift
//  Crypto
//
//  Created by Soufiane Benkhaldoun on 16/01/2022.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData: MarketDataModel? = nil
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global")  else { return }
        
        marketDataSubscription = networkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: networkingManager.handleCompletion, receiveValue: { [weak self] returndGlobalData in
                self?.marketData = returndGlobalData.data
                self?.marketDataSubscription?.cancel()
            })
    }
}
