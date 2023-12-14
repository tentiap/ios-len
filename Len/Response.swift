//
//  Response.swift
//  Len
//
//  Created by Putri on 14/12/23.
//

import Foundation

func getBotResponse(message: String) -> String {
    let tempMessage = message.lowercased()

    if tempMessage.contains("Halo") {
        return "Halo, ada yang bisa saya bantu?"
    } else if tempMessage.contains("Apa kabar?") {
        return "Baik. Bagaimana dengan anda?"
    } else if tempMessage.contains("Terima kasih") {
        return "Semoga harimu menyenangkan"
    } else {
        return "Maaf, bisa diulangi sekali lagi?"
    }
}
