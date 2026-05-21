//
//  File.swift
//  SpotifyLayoutStudyCase
//
//  Created by Késia Silva Viana on 19/05/26.
//

import SwiftUI

struct CoverView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("capaAlbum-indie")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 220, height: 220)
                .cornerRadius(4)

            Text("Indie Pop")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
                .padding(12)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}
