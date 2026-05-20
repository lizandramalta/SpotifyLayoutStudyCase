//
//  PlaylistView.swift
//  SpotifyLayoutStudyCase
//
//  Created by Késia Silva Viana on 20/05/26.
//

import Foundation
import SwiftUI

struct PlaylistView: View {

    private let tracks: [Track] = [
        Track(title: "Easy", artist: "Troye Sivan"),
        Track(title: "chance with you", artist: "mehro"),
        Track(title: "Nirvana", artist: "The Beach"),
        Track(title: "Running", artist: "Alvvays"),
        Track(title: "Comfort Crowd", artist: "Conan Gray"),
    ]

    var body: some View {
        ZStack(alignment: .bottom) {

            // Fundo escuro cobrindo tudo, inclusive atrás da status bar
            Color(white: 0.08).ignoresSafeArea()

            VStack(spacing: 0) {
                // ScrollView carrega todos os fragmentos acima
                ScrollView {
                    VStack(spacing: 0) {
                        SearchBarView()
                            .padding(.top, 16)

                        CoverView()
                            .padding(.top, 16)

                        PlaylistInfoView()
                            .padding(.top, 12)

                        TrackListView(tracks: tracks)
                            .padding(.top, 12)

                        // Espaço no final para o conteúdo não ficar atrás do mini player
                        Spacer().frame(height: 64)
                    }
                }

                // Mini player fixo no rodapé, fora do scroll
                MiniPlayerView()
            }
        }
        // Barra de status com ícones claros (igual ao Spotify)
        .preferredColorScheme(.dark)
    }
}
