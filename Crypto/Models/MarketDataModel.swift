//
//  MarketDataModel.swift
//  Crypto
//
//  Created by Soufiane Benkhaldoun on 16/01/2022.
//

import Foundation

//JSON data:
/*
 
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
 "data": {
   "active_cryptocurrencies": 12479,
   "upcoming_icos": 0,
   "ongoing_icos": 50,
   "ended_icos": 3375,
   "markets": 720,
   "total_market_cap": {
     "btc": 51072230.492489405,
     "eth": 658394077.9371654,
     "ltc": 15032133620.280552,
     "bch": 5656202556.440445,
     "bnb": 4382954741.322184,
     "eos": 751628078313.8348,
     "xrp": 2824581680760.5166,
     "xlm": 8505052379868.255,
     "link": 85425695768.32726,
     "dot": 79306409057.48044,
     "yfi": 65395523.71373147,
     "usd": 2200903854467.7397,
     "aed": 8083893446613.767,
     "ars": 228583981547704.3,
     "aud": 3051927347874.78,
     "bdt": 189040350798098.3,
     "bhd": 829826588384.6617,
     "bmd": 2200903854467.7397,
     "brl": 12181782744093.484,
     "cad": 2758051660706.9756,
     "chf": 2009638706802.9294,
     "clp": 1804102898545751,
     "cny": 13981461825891.775,
     "czk": 47249884309255.21,
     "dkk": 14347925523083.74,
     "eur": 1927811302397.6748,
     "gbp": 1609437354425.7888,
     "hkd": 17132110716158.717,
     "huf": 687461122558417.1,
     "idr": 31504948269971150,
     "ils": 6843188921253.945,
     "inr": 163210776457873.44,
     "jpy": 251233165171461.38,
     "krw": 2619647821818770,
     "kwd": 664496891740.902,
     "lkr": 446381795494472.1,
     "mmk": 3912140099073072.5,
     "mxn": 44657967876002.71,
     "myr": 9196476755893.434,
     "ngn": 911812457867439.4,
     "nok": 19297458968857.49,
     "nzd": 3229351011198.844,
     "php": 112957976728678.33,
     "pkr": 387689213964492.44,
     "pln": 8746295077885.211,
     "rub": 168026023955870.62,
     "sar": 8258891713890.2,
     "sek": 19819370304386.73,
     "sgd": 2965733350222.262,
     "thb": 73016407155857.11,
     "try": 29745215593131.508,
     "twd": 60641503902149.79,
     "uah": 61542384470571.79,
     "vef": 220376502947.85455,
     "vnd": 50004535573507060,
     "zar": 33844399022077.637,
     "xdr": 1564968092046.2683,
     "xag": 95856163654.98055,
     "xau": 1210761228.4197905,
     "bits": 51072230492489.41,
     "sats": 5107223049248940
   },
   "total_volume": {
     "btc": 1640907.8744393757,
     "eth": 21153648.79413722,
     "ltc": 482969828.99093527,
     "bch": 181729037.96814096,
     "bnb": 140820654.96247742,
     "eos": 24149178926.81977,
     "xrp": 90751437273.50494,
     "xlm": 273260190284.76773,
     "link": 2744655863.1568804,
     "dot": 2548048320.2132173,
     "yfi": 2101103.2567048236,
     "usd": 70713192489.4329,
     "aed": 259728707455.37756,
     "ars": 7344211358606.95,
     "aud": 98055862629.3219,
     "bdt": 6073707712002.095,
     "bhd": 26661631383.02328,
     "bmd": 70713192489.4329,
     "brl": 391390449109.7619,
     "cad": 88613883602.1704,
     "chf": 64568003922.523705,
     "clp": 57964311015513.05,
     "cny": 449212626608.3718,
     "czk": 1518099101640.1409,
     "dkk": 460986797437.01605,
     "eur": 61938958138.95913,
     "gbp": 51709870566.2077,
     "hkd": 550440329486.8076,
     "huf": 22087548526844.348,
     "idr": 1012227529549610.8,
     "ils": 219865913019.27216,
     "inr": 5243825180544.512,
     "jpy": 8071910607287.93,
     "krw": 84167084492472.34,
     "kwd": 21349727076.409645,
     "lkr": 14341872210593.629,
     "mmk": 125693775904756.69,
     "mxn": 1434823003373.0347,
     "myr": 295475074817.09485,
     "ngn": 29295768516447.14,
     "nok": 620011150351.5724,
     "nzd": 103756335928.6651,
     "php": 3629244928358.5884,
     "pkr": 12456128857013.607,
     "pln": 281011115572.5371,
     "rub": 5398535038732.516,
     "sar": 265351254816.5972,
     "sek": 636779723252.5552,
     "sgd": 95286521871.8583,
     "thb": 2345955841559.28,
     "try": 955688796494.6859,
     "twd": 1948360592661.3499,
     "uah": 1977305128750.6924,
     "vef": 7080511963.966909,
     "vnd": 1606603733359916,
     "zar": 1087392117506.2534,
     "xdr": 50281110511.95871,
     "xag": 3079778036.6796007,
     "xau": 38900741.45228675,
     "bits": 1640907874439.3757,
     "sats": 164090787443937.56
   },
   "market_cap_percentage": {
     "btc": 37.06796460549307,
     "eth": 18.100179301204857,
     "bnb": 3.8360760367229947,
     "usdt": 3.5752047556924293,
     "sol": 2.11847446113745,
     "usdc": 2.0704556713290025,
     "ada": 2.0372354843039644,
     "xrp": 1.687476973771972,
     "luna": 1.3914887577226285,
     "dot": 1.3548902142970851
   },
   "market_cap_change_percentage_24h_usd": -0.24799783813918824,
   "updated_at": 1642366377
 }
}
 
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
            if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
                return "$" + item.value.formattedWithAbbreviations()
            }
            return ""
        }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
}


