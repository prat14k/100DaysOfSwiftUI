//
//  ITunesSongFetchUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 21/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ITunesSongFetchUIView: View {

    @State private var results = [Result]()

    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading, spacing: 5) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .onAppear { self.loadData() }
    }

    func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song")
        else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data,
                    let decodedData = try? JSONDecoder().decode(Response.self, from: data)
            else {
                print("Response data not fetched; Error: \(error?.localizedDescription ?? "Unkonwn")")
                return
            }
            DispatchQueue.main.async {
                self.results = decodedData.results
            }
        }.resume()
    }
}

struct ITunesSongFetchUIView_Previews: PreviewProvider {
    static var previews: some View {
        ITunesSongFetchUIView()
    }
}
