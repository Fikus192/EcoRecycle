//
//  TermsAndConditionsView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 03/10/2023.
//

import SwiftUI

struct TermsAndConditionsView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Zasady i Warunki Korzystania z Aplikacji Mobilnej 'EcoRecycle'")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                Text("§1 Akceptacja Warunków Korzystania")
                    .fontWeight(.semibold)
                Text(term_one)
                Spacer()
                Text("§2 Informacje o Aplikacji")
                    .fontWeight(.semibold)
                Text(term_two)
                Spacer()
                Text("§3 Warunki Użytkowania")
                    .fontWeight(.semibold)
                Text(term_three)
                Spacer()
                Text("§4 Odpowiedzialność")
                    .fontWeight(.semibold)
                Text(term_four)
                Spacer()
                Text("§5 Zakończenie Korzystania z Aplikacji")
                    .fontWeight(.semibold)
                Text(term_five)
                Spacer()
                Text("§6 Postanowienia Końcowe")
                    .fontWeight(.semibold)
                Text(term_six)
                Spacer()
                
                Spacer()
            }
            .padding()
        }
    }
    
    @State private var term_one: String =
"""
Korzystając z aplikacji mobilnej "EcoRecycle", zgadzasz się przestrzegać poniższych zasad i warunków. Jeśli nie zgadzasz się z tymi warunkami, prosimy o niekorzystanie z naszej aplikacji.
"""
    
    @State private var term_two: String =
"""
Aplikacja mobilna "EcoRecycle" została stworzona przez Mateusza Ratajczak i ma na celu ułatwienie procesu recyklingu i dbania o środowisko.
"""
    
    @State private var term_three: String =
"""
1. Rejestracja: Aby korzystać z pełni funkcji aplikacji, może być konieczna rejestracja. Wszystkie dane podane podczas rejestracji muszą być dokładne i aktualne.
2. Ograniczenia Wiekowe: Aplikacja "EcoRecycle" jest przeznaczona wyłącznie dla osób, które ukończyły 13 lat. Osoby niepełnoletnie muszą korzystać z aplikacji pod nadzorem dorosłych.
3. Zakazane Zachowania: Nie wolno używać aplikacji "EcoRecycle" w celu naruszania praw innych osób, propagowania nienawiści, publikowania treści nieodpowiednich lub niezgodnych z prawem.
4. Prywatność i Bezpieczeństwo: Zachęcamy do przeczytania naszej Polityki Prywatności, która reguluje, jak gromadzimy, przetwarzamy i przechowujemy Twoje dane osobowe.
5. Zmiany w Aplikacji: Deweloper zastrzega sobie prawo do wprowadzania zmian w aplikacji, jej funkcjach i warunkach korzystania w dowolnym momencie.
"""
    
    @State private var term_four: String =
"""
1. Ograniczenie Odpowiedzialności: Deweloper nie ponosi odpowiedzialności za wszelkie straty lub szkody wynikłe z korzystania z aplikacji "EcoRecycle".
2. Kontakt z Nami: W przypadku pytań lub problemów związanych z aplikacją, prosimy o kontakt za pomocą dostępnych środków komunikacji podanej na naszej stronie internetowej lub w aplikacji.
"""
    
    @State private var term_five: String =
"""
Możesz zakończyć korzystanie z aplikacji "EcoRecycle" w dowolnym momencie. Deweloper zastrzega sobie prawo do zablokowania dostępu do aplikacji w przypadku naruszenia niniejszych warunków.
"""
    
    @State private var term_six: String =
"""
1. Zmiany w Warunkach Korzystania: Deweloper może zmieniać te warunki w dowolnym momencie, publikując ich aktualną wersję na stronie internetowej lub w aplikacji.
2. Podstawa Prawna: Warunki korzystania z aplikacji "EcoRecycle" są regulowane przepisami prawa polskiego.
3. Rozstrzyganie Sporów: Wszelkie spory wynikłe z korzystania z aplikacji będą rozstrzygane na drodze mediacji lub postępowania sądowego zgodnie z przepisami prawa.
4. Aktualność Warunków: Niniejsze Warunki Korzystania obowiązują od dnia opublikowania i mogą ulec zmianie w przyszłości.

Przeczytaj te Warunki Korzystania uważnie przed rozpoczęciem korzystania z aplikacji "EcoRecycle". Korzystając z aplikacji, akceptujesz te warunki i zobowiązujesz się do ich przestrzegania.
"""
    
}

#Preview {
    TermsAndConditionsView()
}
