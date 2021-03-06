//
//  PrayerDetailViewModel.swift
//  PropositoClient
//
//  Created by Matheus Silva on 01/02/20.
//  Copyright © 2020 Matheus Gois. All rights reserved.
//

import UIKit

class PrayerDetailViewModel {
    var name: String
    var subject: String
    var date: String
    var hours: String
    var image: UIImage
    var repetition: String
    var notification: String
    var actions: Actions?
    init(prayer: Prayer) {
        name = prayer.name != "" ? prayer.name : "Sem título"
        subject = prayer.subject != "" ? prayer.subject : "Sem assunto"
        date = prayer.date.getFormattedDate()
        hours = prayer.date.getFormattedHours()
        if prayer.repetition, let whenRepeat = prayer.whenRepeat {
            repetition = whenRepeat.capitalizingFirstLetter()
        } else {
            repetition = "Não se repete"
        }
        notification = prayer.notification ? "Ativadas" : "Desativadas"
        let nameImage = prayer.image.split(separator: "_")
        let newName = "person_ilustration_\(nameImage[1])"
        image = UIImage(named: newName)! //REMAKE
    }
}
