//
//  MiniPlayerView.swift
//  SpotifyLayoutStudyCase
//
//  Created by Késia Silva Viana on 20/05/26.
//

import Foundation
import SwiftUI

struct MiniPlayerView: View {
    var body: some View {
        HStack {
            // Thumbnail
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(white: 0.3))
                .frame(width: 40, height: 40)
                .padding(.leading, 8)

            VStack(alignment: .leading, spacing: 2) {
                Text("Easy")
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(.white)
                Text("Troye Sivan")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            // Ícone Bluetooth
            Image(systemName: "bluetooth")
                .foregroundStyle(.secondary)

            SwiftUI.Button { } label: {
                Image(systemName: "pause.fill")
                    .foregroundStyle(.white)
                    .imageScale(.large)
            }
            .padding(.trailing, 16)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .background(Color(red: 0.1, green: 0.1, blue: 0.35))
    }
}
