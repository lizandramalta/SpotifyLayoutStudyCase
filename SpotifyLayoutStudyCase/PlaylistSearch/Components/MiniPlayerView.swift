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
            Image("musica1")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 40, height: 40)
                .cornerRadius(4)
                .padding(.leading, 8)
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 2) {
                Text("Easy")
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(.white)
                Text("Troye Sivan")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .accessibilityElement(children: .combine)
            .accessibilityLabel("Tocando agora: Easy, de Troye Sivan")

            Spacer()

            Image("bluetooth")
                .accessibilityLabel("Conectado via Bluetooth")

            SwiftUI.Button { } label: {
                Image(systemName: "pause.fill")
                    .foregroundStyle(.white)
                    .imageScale(.large)
            }
            .accessibilityLabel("Pausar")
            .padding(.trailing, 16)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .background(Color(red: 0.1, green: 0.1, blue: 0.35))
        .accessibilityElement(children: .contain)
    }
}
