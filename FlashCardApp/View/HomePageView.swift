//
//  ContentView.swift
//  FlashCardApp
//
//  Created by Jay Zisch on 2021/01/05.
//

import SwiftUI
import CoreData

struct HomePageView: View {
    
    @EnvironmentObject var flashCardStorage: FlashCardStorage

    var body: some View {
        List {
            ForEach(flashCardStorage.flashCards) { item in
                FlashCardView(card: item)
            }
            .onDelete(perform: deleteItems)
        }
        .toolbar {
            #if os(iOS)
            ToolbarItem(placement: ToolbarItemPlacement.bottomBar) {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
            //EditButton()
            #endif
//            Button(action: addItem, label: {
//                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
//            })
            
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
      
        offsets.map { flashCardStorage.flashCards[$0] }
        
    }
    
    private func addItem() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                HomePageView()//environment(\.flashCardStorage, FlashCardStorage())
            }
        }
    }
}
