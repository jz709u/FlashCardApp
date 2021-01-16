//
//  FlashCardView.swift
//  FlashCardApp
//
//  Created by Jay Zisch on 2021/01/05.
//

import Foundation
import SwiftUI
import CoreData

class ObservableArray<T>: ObservableObject, ExpressibleByArrayLiteral {
    
    @Published var array: [T]
    init(array: [T] = [T]()) {
        self.array = array
    }
    init(repeating value: T, count: Int) {
        array = Array(repeating: value,
                      count: count)
    }
    required init(arrayLiteral elements: T...) {
        array = elements
    }
}

struct FlashCardView: View {
    var card: FlashCardVM
    
    @State var expanded = true
    
    var body: some View {
        VStack {
            ForEach(0..<card.questions.count) {
                QuestionItemView(questionType: card.questions[$0])
            }
        }
    }
    
    struct QuestionItemView: View {
        var questionType: QuestionType
        @ObservedObject var visibleHints: ObservableArray<Bool>
        init(questionType: QuestionType) {
            self.questionType = questionType
            visibleHints = ObservableArray(repeating: false, count: questionType.hints.count)
        }
        
        var body: some View {
            VStack(spacing:0) {
                TermView(textColor: .orange,
                         term: "Q",
                         definition: questionType.question,
                         visible: .constant(true))
                ForEach(0..<questionType.hints.count) {
                    TermView(textColor: .yellow,
                             term: "H",
                             definition: questionType.hints[$0].hint,
                             visible: $visibleHints.array[$0])
                }.padding(.leading, 20)
                ButtonsView().frame(minWidth: 0,
                                    idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,
                                    maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                                    minHeight: 50,
                                    maxHeight: 60,
                                    alignment: .center)
            }
        }
    }
    
    struct ButtonsView: View {
        
        var buttons = [(String,() -> Void)]()
        
        init(buttons: [(String, () -> Void)] = []) {
            self.buttons = buttons
            
        }
        
        var body: some View {
            GeometryReader { geometry in
                HStack(alignment: .center, spacing: 10) {
                    Button(action: {
                        
                    }, label: {
                        Text("A")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical, 5)
                    })
                    .frame(width: geometry.size.width / 4,
                            alignment: .center)
                    .background(RoundedRectangle(cornerSize: CGSize(width: 10,
                                                                     height: 10),
                                                  style: .circular)
                                    .foregroundColor(.green))
                    
                    Button(action: {
                        
                    }, label: {
                        Text("H")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical, 5)
                    })
                    .frame(width: geometry.size.width / 4,
                           alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(RoundedRectangle(cornerSize: CGSize(width: 10,
                                                                    height: 10),
                                                  style: .circular)
                                    .foregroundColor(.yellow))
                    
                }.frame(width: geometry.size.width,
                        height: geometry.size.height,
                        alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    struct TermView: View {
        
        let textColor: Color
        let term: String
        let definition: String
        
        @Binding var visible: Bool
        
        var body: some View {
            if visible {
                HStack(alignment: .top, spacing: 10) {
                    Text("\(term):")
                        .font(.headline)
                        .foregroundColor(textColor)
                    Text(definition)
                        .font(.body)
                        .lineLimit(3)
                        .foregroundColor(textColor)
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    print("tapped")
                }
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct FlashCardView_Previews: PreviewProvider {
    
    struct SingleAnswerVM: SingleAnswerType {
        var content: String
    }
    
    struct HintVM: HintType {
        var hint: String
    }

    static var card: FlashCardVM = {
        FlashCardVM(questions: [FlashCardQuestionVM(answer: SingleAnswerVM(content: "yes"),
                                                    hints: [HintVM(hint: "yes")],
                                                    question: "question 1")])
    }()

    static var previews: some View {
        Group {
            ScrollView {
                LazyVStack {
                    FlashCardView(card: card)
                }
            }
        }
    }

    init() { }
}

