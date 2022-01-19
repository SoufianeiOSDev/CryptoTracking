//
//  CoinDetailDataService.swift
//  Crypto
//
//  Created by Soufiane Benkhaldoun on 18/01/2022.
//

import Foundation
import Combine

class CoinDetailDataService {
    
    @Published var coinDetail: CoinDetailModel? = nil
    
    var coinDetailSubscription: AnyCancellable?
    
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinsDetails()
    }
    
    func getCoinsDetails() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false")  else { return }
        
        coinDetailSubscription = networkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: networkingManager.handleCompletion, receiveValue: { [weak self] returndCoinDetails in
                self?.coinDetail = returndCoinDetails
                self?.coinDetailSubscription?.cancel()
            })
    }
}

