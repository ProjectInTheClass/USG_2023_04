//
//  Onboarding_Netfulix.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/02/23.
//

import SwiftUI

struct Onboarding_Netfulix: View {
    var body: some View {
        HStack {
            Text("NETFULIX")
                .font(.title.bold())
                .foregroundColor(.red)
            Spacer()
            Text("개인 정보")
                .foregroundColor(.white)
                .bold()
            Text("고객 센터")
                .foregroundColor(.white)
                .bold()
        }
        .padding()
    }
}

struct Onboarding_Netfulix_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_Netfulix()
    }
}
