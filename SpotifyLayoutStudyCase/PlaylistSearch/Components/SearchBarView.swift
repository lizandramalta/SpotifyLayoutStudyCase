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
                    .foregroundStyle(Color.white)
                    .accessibilityHidden(true)
                Text("Find in playlist")
                    .foregroundStyle(Color.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
            .background(Color(white: 1.0).opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .accessibilityElement(children: .combine)
            .accessibilityLabel("Buscar na playlist")
            .accessibilityAddTraits(.isSearchField)

            SwiftUI.Button("Sort") {}
                .buttonStyle(.plain)
                .foregroundStyle(.white)
                .accessibilityLabel("Ordenar faixas")
        }
        .padding(.horizontal, 16)
        .font(.body)
    }
}
