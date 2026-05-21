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

            // Ícone Spotify
            HStack(spacing: 6) {
                Image("Logo") // seu asset, ou use o símbolo abaixo
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Spotify")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.white)
            }

            // Likes e duração
            Text("1,629,592 likes • 6h 48m")
                .font(.footnote)
                .foregroundStyle(Color(white: 0.6))

            // Linha de ações: ícones à esquerda, play à direita
            HStack {
                HStack(spacing: 24) {
                    SwiftUI.Button { } label: {
                        Image(systemName: "heart")
                    }
                    SwiftUI.Button { } label: {
                        Image(systemName: "arrow.down.circle")
                    }
                    SwiftUI.Button { } label: {
                        Image(systemName: "ellipsis")
                    }
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
            }
        }
        .padding(.horizontal, 16)
    }
}
