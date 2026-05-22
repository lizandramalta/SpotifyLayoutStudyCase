import SwiftUI

// Unificamos os itens para que possam dividir o mesmo Grid
enum GridElement: Identifiable {
    case podcast(Podcast)
    case category(Card)
    
    var id: String {
        switch self {
        case .podcast(let p): return p.title
        case .category(let c): return c.text
        }
    }
}

struct ChoosePodcastsView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass

    let columns = [
        GridItem(.flexible(), spacing: 12, alignment: .top),
        GridItem(.flexible(), spacing: 12, alignment: .top),
        GridItem(.flexible(), spacing: 12, alignment: .top)
    ]
    
    let items: [GridElement] = [
        .podcast(Podcast(title: "Rotten Mango", image: Image("rotten_mango"))),
        .podcast(Podcast(title: "Last Podcast on The Left", image: Image("last_podcast"))),
        .category(Card(text: "More in True crime", color: Color("myPink"))),
        
        .podcast(Podcast(title: "The Joe Rogan Experience", image: Image("joe_experience"))),
        .podcast(Podcast(title: "Gee Thanks", image: Image("gee_thanks"))),
        .category(Card(text: "More in Comedy", color: Color("myRed"))),
        
        .podcast(Podcast(title: "Distractible", image: Image("distractible"))),
        .podcast(Podcast(title: "My Brother, My Brother And Me", image: Image("my_brother"))),
        .category(Card(text: "More in Stories", color: Color("myGreen"))),
        
        .podcast(Podcast(title: "Call Her Daddy", image: Image("daddy"))),
        .podcast(Podcast(title: "Relationship Psych", image: Image("relationship"))),
        .category(Card(text: "More in Relationships", color: Color("myBlue")))
    ]
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
       
                Text("Now choose some\npodcasts.")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
               
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    Text("Search")
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .padding(.horizontal)
                .padding(.bottom, 20)
        
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(items) { item in
                            switch item {
                            case .podcast(let podcast):
                                PodcastCardView(podcast: podcast)
                            case .category(let card):
                                if card.text.isEmpty {
                                    Color.clear
                                } else {
                                    CardColorView(card: card)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            

            VStack {
                Spacer()
                if verticalSizeClass == .regular {
                    SwiftUI.Button(action: {
                        
                    }) {
                        Text("Done")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 40)
                            .background(Color.white)
                            .clipShape(Capsule())
                    }
                    .padding(.bottom, 30)
                }
            }
            
        }
    }
}

#Preview {
    ChoosePodcastsView()
}
