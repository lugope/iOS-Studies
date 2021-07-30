//
//  MovieDetailView.swift
//  MyMovies
//
//  Created by Lucas on 12/05/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    @State private var details = Bundle.main.decode(MovieDetails.self, from: "details.json")
    
    @State private var credits = Bundle.main.decode(Credits.self, from: "credits.json", keyDecodingStrategy: .convertFromSnakeCase)
    
    @State private var showingAllCast = false
    
    var displayedCast: [CastMember] {
        if showingAllCast {
            return credits.cast
        } else {
            return Array(credits.cast.prefix(5))
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                //Movie Image, revenue, runtime
                VStack(alignment: .leading, spacing: 0){
                    if let path = movie.backdropPath {
                        WebImage(url: URL(string: "https://image.tmdb.org/t/p/w1280\(path)"))
                            .placeholder {
                                Color.gray.frame(maxHeight: 200)
                            }
                            .resizable()
                            .scaledToFill()
                            .frame(maxHeight: 200)
                    }
                    
                    HStack(spacing: 20) {
                        Text("Revenue: $\(details.revenue)")
                        Text("\(details.runtime) minutes")
                    }
                    .foregroundColor(.white)
                    .font(Font.caption.bold())
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                }
                
                //List Genres
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 5) {
                        ForEach(movie.genres) { genre in
                            Text(genre.name)
                                .foregroundColor(.white)
                                .padding(.horizontal, 3)
                                .padding(.vertical, 3)
                                .background(Color(genre.color))
                                .clipShape(Capsule())
                        }
                    }
                    .padding(.horizontal, 10)
                }
                
                //Overview Text
                Text(movie.overview)
                    .padding([.horizontal, .bottom])
                
                //List of cast
                Group{
                    Text("Cast").font(.title)
                    
                    VStack(alignment: .leading){
                        ForEach(displayedCast) { castMember in
                            Text("\(castMember.name)").bold()
                            Text("as \(castMember.character)")
                        }
                    }
                    
                    if showingAllCast == false {
                        Button("Show all") {
                            withAnimation{
                                showingAllCast.toggle()
                            }
                        }
                        .padding(.vertical)
                    }
                }
                .padding(.horizontal, 10)

            }
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MovieDetailView(movie: Movie.example)
        }
    }
}
