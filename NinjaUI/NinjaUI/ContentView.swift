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
    var body: some View {
        NavigationView {
            SignUpView(viewModel: SignUpViewModel())            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
