//
//  PlaylistInfoView.swift
//  SpotifyLayoutStudyCase
//
//  Created by Késia Silva Viana on 20/05/26.
//

import Foundation
import SwiftUI

struct PlaylistInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            // Descrição
            Text("New and approved indie pop. Cover: No Rome")
                .font(.footnote)
                .foregroundStyle(Color(white: 0.6))
                .accessibilityLabel("Descrição: New and approved indie pop. Capa: No Rome")

            // Ícone Spotify
            HStack(spacing: 6) {
                Image("Logo")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .accessibilityHidden(true)
                Text("Spotify")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.white)
            }
            .accessibilityElement(children: .combine)
            .accessibilityLabel("Playlist criada pelo Spotify")

            Text("1,629,592 likes • 6h 48m")
                .font(.footnote)
                .foregroundStyle(Color(white: 0.6))
                .accessibilityLabel("1 milhão 629 mil 592 curtidas, duração 6 horas e 48 minutos")

            HStack {
                HStack(spacing: 24) {
                    SwiftUI.Button { } label: {
                        Image(systemName: "heart")
                    }
                    .accessibilityLabel("Curtir playlist")

                    SwiftUI.Button { } label: {
                        Image(systemName: "arrow.down.circle")
                    }
                    .accessibilityLabel("Baixar playlist")

                    SwiftUI.Button { } label: {
                        Image(systemName: "ellipsis")
                    }
                    .accessibilityLabel("Mais opções")
                }
                .foregroundStyle(Color(white: 0.6))
                .imageScale(.large)

                Spacer()

                // Botão play verde redondo
                SwiftUI.Button { } label: {
                    Image(systemName: "play.fill")
                        .font(.title2.weight(.bold))
                        .foregroundStyle(.black)
                        .frame(width: 56, height: 56)
                        .background(Color(red: 0.12, green: 0.73, blue: 0.32))
                        .clipShape(Circle())
                }
                .accessibilityLabel("Reproduzir playlist")
                .accessibilityAddTraits(.isButton)
            }
        }
        .padding(.horizontal, 16)
    }
}
