//
//  PreviewProvider.swift
//  Crypto
//
//  Created by Soufiane Benkhaldoun on 15/01/2022.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {}
    
    let homeVM = HomeViewModel()
    
    let stat1 = StatisticsModel(title: "Market Cap", value: "$12.34Bn", percentageChange: 25.34)
    let stat2 = StatisticsModel(title: "Total Volume", value: "$1.23Tn")
    let stat3 = StatisticsModel(title: "Market Cap", value: "$12.34Bn", percentageChange: -25.34)
    
    let coin = CoinModel(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        currentPrice: 43375,
        marketCap: 821100347405,
        marketCapRank: 1,
        fullyDilutedValutation: 910875836056,
        totalVolume: 14846257715,
        high24H: 43594,
        low24H: 42586,
        priceChange24H: 435.66,
        priceChangePercentage24H: 1.0146,
        marketCapChange24H: 8259250841,
        marketCapChangePercentage24H: 1.0161,
        circulatingSupply: 18930250,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 69045,
        athChangePercentage: -36.86135,
        athDate: "2021-11-10T14:24:11.849Z",
        atl: 67.81,
        atlChangePercentage: 64189.30787,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2022-01-15T18:10:02.376Z",
        sparklineIn7D: SparklineIn7D(price: [
            40999.24260500303,
            40655.24908589081,
            40739.225396627015,
            41040.3613698119,
            42240.08706720382,
            42003.66945857541,
            41756.66232397826,
            42000.240211691154,
            41733.04713333396,
            42241.227639919394,
            41927.7407403526,
            42161.6998622604,
            41826.91765809273,
            41990.9082749726,
            41915.90493234757,
            41816.651397806745,
            41573.21912616642,
            41717.4189645261,
            41940.925016294445,
            41870.91178181394,
            41558.21781001086,
            41697.62145515702,
            41699.74767272069,
            42259.3531251793,
            42126.082987655245,
            42187.10149327908,
            42755.76334790146,
            42425.779919715664,
            42385.96034409413,
            42218.57126578665,
            41862.3609856517,
            41722.052179742655,
            41908.46943784095,
            42097.52849018815,
            42093.09713354394,
            42409.43949411891,
            42040.80237211051,
            41984.114573677936,
            42089.717024449346,
            41877.300794403345,
            41907.306643042524,
            41895.43847707444,
            41592.68513813869,
            41043.49854788218,
            40896.51770007245,
            40683.26965807297,
            40897.01826082547,
            41903.97717897294,
            41325.58695675088,
            41795.35404441451,
            41346.75755547179,
            41698.06528069751,
            41853.7126324314,
            41656.505042558805,
            41890.545239659165,
            41808.46520197215,
            42105.84704855687,
            42306.74186075323,
            42311.23662781285,
            42364.41551602892,
            42130.68177026306,
            42135.106775957975,
            42243.851002932126,
            41945.14058742656,
            42049.451722500395,
            41740.46854333929,
            41977.97404052251,
            41915.61971398387,
            41741.98689268442,
            41639.209139319355,
            41628.0329959911,
            43026.634910880945,
            42496.08715199643,
            42847.00401898649,
            43161.26720258187,
            42805.11267846471,
            42758.81667143197,
            42836.282931337686,
            42811.149099488095,
            42736.150332354366,
            42690.185587975626,
            42590.282253812686,
            42691.535020841184,
            42650.881859577625,
            42819.939667867315,
            42726.12283691961,
            42648.50740945896,
            42703.84164196805,
            42820.60036227033,
            42893.65433215027,
            43178.3020044094,
            43286.3461468275,
            44142.95617046611,
            43954.05064468909,
            43537.75551153419,
            43714.08929251948,
            43946.62531700104,
            43643.559182658464,
            43830.018518688914,
            44079.045729932375,
            43851.179214070566,
            43933.94798971295,
            43981.87732717414,
            43702.3823096264,
            43585.47818629988,
            43628.98833147167,
            43545.54886489405,
            43692.499996266684,
            43743.26864684281,
            43705.251773803444,
            43754.37515992663,
            43920.6078574499,
            43890.03403522622,
            43880.251837517484,
            43680.55986683123,
            43816.41969175357,
            43991.10705362516,
            44046.08436602141,
            42979.593359374114,
            43324.93335811952,
            42817.17658254182,
            42743.748516695814,
            42724.89581260096,
            42720.94616556062,
            42899.81519999951,
            42641.77574380057,
            42608.41001195019,
            42822.3410626846,
            42630.730370044825,
            42827.69538217487,
            42780.31638262786,
            42727.79226823351,
            42894.38226108194,
            42899.36778267711,
            42638.96747016387,
            42574.67989666804,
            42644.981834357044,
            42086.466454609246,
            42024.69661257974,
            42271.47151393987,
            42203.4285747024,
            43396.856151091495,
            43094.85541933739,
            43318.02949176713,
            42937.290331282704,
            43093.48998490977,
            43254.93326852252,
            43167.941146500394,
            43494.76826815796,
            43433.83319474636,
            43191.97077835075,
            43204.25614289687,
            43008.05726400687,
            43149.46797893759,
            43018.88169344696,
            43002.59260903966,
            43143.71368441771,
            43169.33853917334,
            43106.31841360756,
            43089.40095195211,
            43038.46408581668,
            43194.632756373794,
            43049.23746683092,
            42669.96652910112,
            43142.38806679312,
            43333.255381162264,
            43495.44513376632,
            43448.40684692052
          ]),
        priceChangePercentage24HInCurrency: 1.0145965414293552,
        currentHoldings: 1.5)
}
