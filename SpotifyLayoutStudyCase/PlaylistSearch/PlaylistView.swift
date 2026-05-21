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
        Track(title: "Easy", artist: "Troye Sivan", imageName: "musica1"),
        Track(title: "chance with you", artist: "mehro", imageName: "musica2"),
        Track(title: "Nirvana", artist: "The Beach", imageName: "musica3"),
        Track(title: "Running", artist: "Alvvays", imageName: "musica4"),
        Track(title: "Comfort Crowd", artist: "Conan Gray", imageName: "musica5"),
    ]

    var body: some View {
        ZStack(alignment: .bottom) {

            // Fundo base escuro
            Color(white: 0.08).ignoresSafeArea()

            // Gradiente marrom no topo (cor extraída da capa)
            VStack(spacing: 0) {
                LinearGradient(
                    colors: [
                        Color(red: 0.35, green: 0.22, blue: 0.10), // marrom da capa
                        Color(white: 0.08)                          // fundo escuro
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 480) // cobre a área da capa + infos
                .ignoresSafeArea(edges: .top)

                Spacer()
            }

            // Conteúdo
            VStack(spacing: 0) {
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
                        Spacer().frame(height: 64)
                    }
                }
                MiniPlayerView()
            }
        }
        .preferredColorScheme(.dark)
    }
}
