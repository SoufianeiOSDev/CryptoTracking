//
//  SettingsView.swift
//  Crypto
//
//  Created by Soufiane Benkhaldoun on 18/01/2022.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    let policyPrivacy = URL(string: "https://cryptotrack-privacypolicy.blogspot.com/2022/01/privacy-policy.html")!
    let termsCondition = URL(string: "https://cryptotrack-termscondition.blogspot.com/2022/01/crypto-track-terms-condition.html")!
    let linkedinURL = URL(string: "https://www.linkedin.com/in/soufiane-benkhaldoun-1b1671228/")!
    let twitterURL = URL(string: "https://twitter.com/Soufiane__S")!
    let coingeckoURL = URL(string: "https://coingecko.com")!
    let personalURL = URL(string: "https://www.soufianebenkhaldoun.com")!
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                List {
                    firstSection
                    coingeckoSection
                    developerSection
                    applicationSection
                }
            }
            .font(.headline)
            .tint(.blue)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    private var firstSection: some View {
            Section {
                VStack (alignment: .leading) {
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                    Text("This is a mobile app which packs a nice set of features, User can view 250+ Crypto coins, with the most important information, and add them into a virtual portfolio with a nice UI. This app uses MVVM Architecture, Combine and Core Data.")
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(Color.theme.accent)
                        .frame(height: 140)
                }
                .padding(.vertical)
                // Link Project page
                Link("View website", destination: personalURL)
            } header: {
                Text("Crypto tracker")
            }
    }
    
    private var coingeckoSection: some View {
            Section {
                VStack (alignment: .leading) {
                    Image("coingecko")
                        .resizable()
                        .frame(height: 70)
                        .frame( maxWidth: 250)
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                    Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be delayed.")
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(Color.theme.accent)
                        .frame(height: 100)
                }
                .padding(.vertical)
                Link("Visit CoinGecko", destination: coingeckoURL)
            } header: {
                Text("CoinGecko")
            }
    }
    
    private var developerSection: some View {
            Section {
                VStack (alignment: .leading) {
                    Image("myImage")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                    Text("This App was developed by Soufiane Benkhaldoun. It uses SwiftUI and is written 100% in Swift. The project benefits from multi-threading, publishers/subscribers and data persistance.")
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(Color.theme.accent)
                        .frame(height: 100)
                }
                .padding(.vertical)
                Link("My Porftolio", destination: personalURL)
                Link("LinkedIn", destination: linkedinURL)
            } header: {
                Text("Developer")
            }
    }
    
    private var applicationSection: some View {
            Section {
                Link("Terms of Service", destination: termsCondition)
                Link("Privacy Policy", destination: policyPrivacy)
            }
    }
}
