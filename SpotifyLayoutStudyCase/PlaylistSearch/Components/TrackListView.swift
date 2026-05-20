//
//  TrackListView.swift
//  SpotifyLayoutStudyCase
//
//  Created by Késia Silva Viana on 20/05/26.
//

import Foundation
import SwiftUI

struct Track: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let imageName: String
}

struct TrackRowView: View {
    let track: Track

    var body: some View {
        HStack(spacing: 12) {
            Image(track.imageName)
                .resizable()
                .frame(width: 48, height: 48)
                .cornerRadius(4)

            VStack(alignment: .leading, spacing: 2) {
                Text(track.title)
                    .font(.body)
                    .foregroundStyle(.white)
                Text(track.artist)
                    .font(.footnote)
                    .foregroundStyle(Color(white: 0.6))
            }
            // Empurra o botão para a direita mesmo com texto longo
            .frame(maxWidth: .infinity, alignment: .leading)

            SwiftUI.Button { } label: {
                Image(systemName: "ellipsis")
                    .foregroundStyle(Color(white: 0.6))
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 6)
        // Fundo transparente para não sobrepor o background da tela
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}

struct TrackListView: View {
    let tracks: [Track]

    var body: some View {
        // LazyVStack dentro de ScrollView = sem altura fixa, cresce conforme o conteúdo
        // Não precisa do hack de tableViewHeightConstraint do UIKit!
        LazyVStack(spacing: 0) {
            ForEach(tracks) { track in
                TrackRowView(track: track)
            }
        }
    }
}
