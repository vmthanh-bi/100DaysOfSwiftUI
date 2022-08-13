//
//  DetailView.swift
//  Bookworm
//
//  Created by Tony Vu on 11/9/21.
//

import CoreData
import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.book.genre ?? "Fantasy")
                        .frame(maxWidth: geometry.size.width)
                    
                    Text(self.book.genre?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                }
                
                Text(self.book.author ?? "Unkown author")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                Divider()
                    .frame(maxWidth: 0.7 * geometry.size.width)
                
                Text(self.book.review ?? "No review")
                    .padding(.bottom)
                
                Text("Added at \(formatDate(self.book.date))")
                    .foregroundColor(.secondary)
                    .font(.caption)
                
                RatingView(rating: .constant(Int(self.book.rating)))
                    .font(.largeTitle)
                
                Spacer()
            }
        }
        .navigationBarTitle(Text(book.title ?? "Unknown Book"), displayMode: .inline)
        .alert(isPresented: $showingDeleteAlert) {
            Alert(title: Text("Delete book"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete")) {
                    self.deleteBook()
                }, secondaryButton: .cancel()
            )
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    self.showingDeleteAlert = true
                }) {
                    Image(systemName: "trash")
                }
            }
        }
    }
    
    func deleteBook() {
        moc.delete(book)
        
        try? self.moc.save()
        self.dismiss()
    }
    
    func formatDate(_ date: Date?) -> String {
        guard let formatingDate = date else {
            return "Unknown date"
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm, d MMM y."
        
        return formatter.string(from: formatingDate)
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book."
        book.date = Date.now
        
        return NavigationView {
            DetailView(book: book)
        }
    }
}
