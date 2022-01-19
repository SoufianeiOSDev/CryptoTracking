//
//  HomeView.swift
//  Crypto
//
//  Created by Soufiane Benkhaldoun on 15/01/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    @State private var showPortfolio: Bool = false // Animate right
    @State private var showPortfolioView: Bool = false // show sheet
    @State private var showSettingsView: Bool = false  // show sheet
    @State private var selectedCoin: CoinModel? = nil
    @State private var showDetailView: Bool = false
    @State private var animate: Bool = false
    
    var body: some View {
        // Background layer
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView) {
                    PortfolioView()
                        .environmentObject(vm)
                }
            // Content layer
            VStack {
                header
                HomeStatsView(showPortfolio: $showPortfolio)
                SearchBarView(searchText: $vm.searchText)
                columnTitles
                
                if !showPortfolio {
                    allCoinsList
                    .transition(.move(edge: .leading))
                }
                if showPortfolio {
                    ZStack (alignment: .top) {
                        if vm.portfolioCoins.isEmpty && vm.searchText.isEmpty {
                           portfolioEmptyText
                        } else {
                            allPortfolioCoinsList
                        }
                    }
                    .transition(.move(edge: .trailing))
                }
                    Spacer(minLength: 0)
            }
            .sheet(isPresented: $showSettingsView) {
                SettingsView()
            }
        }
        .background(
            NavigationLink(
                destination: DetailLoadingView(coin: $selectedCoin),
                isActive: $showDetailView,
                label: { EmptyView() }
            )
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
        .previewInterfaceOrientation(.portrait)
    }
}

extension HomeView {
    
    private var header: some View {
            HStack {
                CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                    .animation(.none, value: showPortfolio)
                    .onTapGesture {
                        if showPortfolio {
                            showPortfolioView.toggle()
                        } else {
                            showSettingsView.toggle()
                        }
                    }
                    .background(
                        CircleButtonAnimationView(animate: $showPortfolio)
                    )
                Spacer()
                Text(showPortfolio ? "Portfolio" : "Live Prices")
                    .foregroundColor(Color.theme.accent)
                    .font(.system(size: 20, weight: .semibold, design: .rounded ))
                    .animation(.none, value: showPortfolio)
                Spacer()
                CircleButtonView(iconName: "chevron.right")
                    .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showPortfolio.toggle()
                        }
                    }
            }
            .padding(.horizontal)
    }
    
    private var columnTitles: some View {
        HStack {
            HStack (spacing: 4) {
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOptions == .rank || vm.sortOptions == .rankRevesed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOptions == .rank ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortOptions = vm.sortOptions == .rank ? .rankRevesed : .rank
                }
            }
            
            Spacer()
            if showPortfolio {
                HStack (spacing: 4) {
                    Text("Holdings")
                    Image(systemName: "chevron.down")
                        .opacity((vm.sortOptions == .holdings || vm.sortOptions == .holdingsReversed) ? 1.0 : 0.0)
                        .rotationEffect(Angle(degrees: vm.sortOptions == .holdings ? 0 : 180))
                }
                .onTapGesture {
                    withAnimation(.default) {
                        vm.sortOptions = vm.sortOptions == .holdings ? .holdingsReversed : .holdings
                    }
                }
            }
            HStack (spacing: 4) {
                Text("Price")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOptions == .price || vm.sortOptions == .priceReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOptions == .price ? 0 : 180))
            }
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortOptions = vm.sortOptions == .price ? .priceReversed : .price
                }
            }
            
            Button {
                withAnimation(.linear(duration: 2.0)) {
                    vm.reloadData()
                }
            } label: {
                Image(systemName: "goforward")
            }
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)

        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal, 50)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                .onTapGesture {
                    segue(coin: coin)
                }
                .listRowBackground(Color.theme.background)
            }
        }
        .refreshable {
            vm.reloadData()
        }
    }
    
    private var allPortfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                    CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .onTapGesture {
                        segue(coin: coin)
                    }
            }
        }
        .refreshable {
            vm.reloadData()
        }
    }
    
    private var portfolioEmptyText: some View {
        VStack (spacing: 20) {
            Image(systemName: "exclamationmark.circle.fill")
                .font(.system(size: 20))
            Text("You haven't added any coins to your portfolio yet. Click the plus button or below to get started!")
                .multilineTextAlignment(.center)
            Button {
                showPortfolioView.toggle()
            } label: {
                CircleButtonView(iconName: "plus")
                    .scaleEffect(animate ? 1.3 : 1.0)
                    .shadow(color: Color.theme.accent,
                            radius: animate ? 30 : 10,
                            x: 0,
                            y: animate ? 10 : 0)
            }
        }
        .onAppear(perform: addAnimation)
        .font(.callout)
        .foregroundColor(Color.theme.secondaryText)
        .padding(50)
    }
    
    private func segue(coin: CoinModel) {
        selectedCoin = coin
        showDetailView.toggle()
    }
    
    private func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}
