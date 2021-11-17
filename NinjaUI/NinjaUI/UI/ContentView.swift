//
//  ContentView.swift
//  NinjaUI
//
//  Created by Luis Luna on 11/16/21.
//

import NinjaKit
import SwiftUI

/// Root content view
struct ContentView: View {
    
    @StateObject var viewModel = SignUpViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                SignUpView(viewModel: viewModel)
                
                if viewModel.loading {
                    ProgressView()
                        .progressViewStyle(DefaultProgressViewStyle())
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
