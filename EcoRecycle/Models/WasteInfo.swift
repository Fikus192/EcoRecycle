//
//  WasteInfo.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 12/01/2024.
//

import Foundation
import SwiftUI

struct WasteInfo {
    let canThrow: [String]
    let cannotThrow: [String]
    let remember: [String]
    
    static func info(for wasteType: Schedule.WasteType) -> WasteInfo? {
        switch wasteType {
        case .tworzywaSztuczne:
            return WasteInfo(
                canThrow: ["odkręcone i zgniecione plastikowe butelki po napojach", "nakrętki, o ile nie zbieramy ich osobno w ramach akcji dobroczynnych", "opakowania po chemii gospodarczej, kosmetykach (np. szamponach, proszkach, płynach do mycia naczyń itp.)", "plastikowe opakowania po produktach spożywczych", "plastikowe torebki, worki, reklamówki i inne folie", "plastikowe koszyczki po owocach i innych produktach", "aluminiowe puszki po napojach, sokach", "puszki z blachy stalowej po żywności (konserwy)", "złom żelazny i metale kolorowe", "metalowe kapsle z butelek, zakrętki słoików i innych pojemników", "folia aluminiowa", "kartoniki po mleku i napojach - wielomateriałowe odpady opakowaniowe"],
                cannotThrow: ["strzykawek, wenflonów i innych artykułów medycznych", "odpadów budowlanych i rozbiórkowych", "nie opróżnionych opakowań po lekach i farbach, lakierach i olejach", "zużytych baterii i akumulatorów", "zużytego sprzętu elektrycznego i elektronicznego", "innych odpadów komunalnych (w tym niebezpiecznych)"],
                remember: ["Pamiętaj o segregacji odpadów", "Przed wyrzuceniem butelki, puszki czy kartonu zgnieć go", "Pamiętaj o usuwaniu nakrętek"])
        case .szklo:
            return WasteInfo(
                canThrow: ["butelki i słoiki szklane po napojach i żywności", "butelki po napojach alkoholowych", "szklane opakowania po kosmetykach"],
                cannotThrow: ["szkła stołowego – żaroodpornego", "ceramiki, doniczek, fajansu i porcelany", "zniczy z zawartością wosku", "żarówek i świetlówek", "szkła kryształowego", "reflektorów", "nie opróżnionych opakowań po lekach, olejach, rozpuszczalnikach", "termometrów i strzykawek", "monitorów i lamp telewizyjnych", "szyb okiennych i zbrojonych", "szyb samochodowych", "luster i witraży", "innych odpadów komunalnych (w tym niebezpiecznych)"],
                remember: ["Pamiętaj aby szklane butelki wkładać w całości", "Nie wyrzucaj szkła, które zostało rozbite, takie szkło należy dostarczyć do punktu PSZOK w twojej okolicy"])
        case .papier:
            return WasteInfo(
                canThrow: ["opakowania z papieru lub tektury", "gazety i czasopisma", "katalogi, prospekty, foldery", "papier szkolny i biurowy", "książki i zeszyty", "torebki i worki papierowe", "papier pakowy"],
                cannotThrow: ["papieru mocno zabrudzonego czy zatłuszczonego", "papieru powlekanego folią i kalki", "kartonów po mleku i napojach", "pieluch jednorazowych i innych materiałów higienicznych", "worków po nawozach, cemencie i innych materiałach budowlanych", "tapet", "innych odpadów komunalnych (w tym niebezpiecznych)"],
                remember: ["Pamiętaj o zgniataniu opakowań", "Ręczniki papierowe, który ma w sobie specyficzny osad nie wrzucaj do niebieskiego pojemnika"])
        case .biodegradowalne:
            return WasteInfo(
                canThrow: ["gałęzie drzew i krzewów", "liście, kwiaty i skoszona trawa", "trociny i kora drzew", "owoce, warzywa itp.", "niezaimpregnowane drewno", "resztki jedzenia"],
                cannotThrow: ["kości zwierząt", "mięsa i padliny zwierząt", "oleju jadalnego", "drewna impregnowanego", "płyt wiórowych i MDF", "leków", "odchodów zwierząt", "popiołu z węgla kamiennego", "innych odpadów komunalnych (w tym niebezpiecznych)"],
                remember: ["Pamiętaj o kompostowaniu"])
        case .zmieszane:
            return WasteInfo(
                canThrow: ["Do pojemnika na odpady zmieszane należy wrzucać to, czego nie można odzyskać i co nie powinno trafić do pojemników na surowce wtórne."],
                cannotThrow: ["odpadów niebezpiecznych: baterii, akumulatorów, lekarstw, odpadów medycznych, świetlówek, opakowań po środkach ochrony roślin itp.", "elektrośmieci", "odpadów gabarytowych"],
                remember: ["Pamiętaj o zamykaniu worków"])
        case .popiol:
            return WasteInfo(
                canThrow: ["można wyrzucać popiół z kominka.", "można wyrzucać popiół po spaleniu drewna i węgla"],
                cannotThrow: ["nie można wyrzucać popiołu z substancjami chemicznymi.", "nie można wyrzucać popiołu z innymi materiałami selektywnymi jak i również zmieszanymi takich jak np. plastik"],
                remember: ["Pamiętaj o odpowiednim pakowaniu", "Pamiętaj o ostudzeniu popiołu przed wyrzuceniem"])
                
        }
    }
}
