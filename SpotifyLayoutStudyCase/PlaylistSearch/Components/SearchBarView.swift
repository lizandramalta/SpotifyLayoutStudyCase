//
//  SearcherBar.swift
//  SpotifyLayoutStudyCase
//
//  Created by Késia Silva Viana on 19/05/26.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        HStack(spacing: 8) {
            HStack(spacing: 6) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.secondary)
                Text("Find in playlist")
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .background(Color(white: 0.2))
            .clipShape(RoundedRectangle(cornerRadius: 6))

            SwiftUI.Button("Sort") {}
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 16)
        // Dynamic Type: o .body já escala com o tamanho de fonte do sistema
        .font(.body)
    }
}
