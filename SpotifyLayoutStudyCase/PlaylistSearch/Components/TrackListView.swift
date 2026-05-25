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
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 2) {
                Text(track.title)
                    .font(.body)
                    .foregroundStyle(.white)
                Text(track.artist)
                    .font(.footnote)
                    .foregroundStyle(Color(white: 0.6))
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            SwiftUI.Button { } label: {
                Image(systemName: "ellipsis")
                    .foregroundStyle(Color(white: 0.6))
            }
            .accessibilityLabel("Mais opções para \(track.title)")
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 6)
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
        .accessibilityElement(children: .contain)
        .accessibilityLabel("\(track.title), \(track.artist)")
        .accessibilityHint("Toque duas vezes para reproduzir")
    }
}

struct TrackListView: View {
    let tracks: [Track]

    var body: some View {
        LazyVStack(spacing: 0) {
            ForEach(Array(tracks.enumerated()), id: \.element.id) { index, track in
                TrackRowView(track: track)
                    .accessibilityLabel("\(track.title), \(track.artist), faixa \(index + 1) de \(tracks.count)")
            }
        }
        .accessibilityLabel("Lista de faixas")
    }
}
