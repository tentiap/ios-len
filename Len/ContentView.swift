//
//  ContentView.swift
//  Len
//
//  Created by Putri on 14/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText = ""
    @State var messages: [String] = ["Halo, ada yang bisa saya bantu?"]

    var body: some View {
        VStack {
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    if message.contains("[USER]") {
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")

                        HStack {
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(Color.white)
                                .background(Color.blue.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    } else {
                        HStack {
                            Text(message)
                                .padding()
                                .background(Color.gray.opacity(0.15))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                }.rotationEffect(.degrees(180))
            }
            .rotationEffect(.degrees(180))
            .background(Color.gray.opacity(0.1))

            HStack {
                TextField("Masukkan pesan", text: $inputText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        sendMessage(message: inputText)
                    }

                Button {
                    sendMessage(message: inputText)
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .font(.system(size: 26))
                .padding(.horizontal, 10)
            }
            .padding()
        }
    }

    func sendMessage(message: String) {
        messages.append("[USER]" + message)
        self.inputText = ""

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            messages.append(getBotResponse(message: message))
        }
    }
}

#Preview {
    ContentView()
}
