//
//  PrivacyPolicyView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 29/09/2023.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Polityka Prywatności")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                Text("§1 Postanowienia ogólne")
                    .fontWeight(.semibold)
                Text(policy_one)
                Spacer()
                Text("§2 Dane zbierane automatycznie")
                    .fontWeight(.semibold)
                Text(policy_two)
                Spacer()
                Text("§3 Dane zbierane w celu nawiązania kontaktu")
                    .fontWeight(.semibold)
                Text(policy_three)
                Spacer()
                Text("§4 Zbieranie danych osobowych")
                    .fontWeight(.semibold)
                Text(policy_four)
                Spacer()
                Text("§5 Przetwarzanie danych osobowych")
                    .fontWeight(.semibold)
                Text(policy_five)
                Spacer()
                Text("§6 Prawa i obowiązki Administratora")
                    .fontWeight(.semibold)
                Text(policy_six)
                Spacer()
                Text("§7 Prawa i obowiązki Użytkownika")
                    .fontWeight(.semibold)
                Text(policy_seven)
                Spacer()
                
                
                Spacer()
                
            }
            .padding()
        }
    }
    
    @State private var policy_one: String = 
"""
1. Niniejsza Polityka Prywatności (zwana dalej „Polityką Prywatności”) określa sposób zbierania, przetwarzania i przechowywania danych osobowych koniecznych do realizacji usług świadczonych za pośrednictwem aplikacji mobilnej (zwanej dalej „Aplikacją”) przez dewelopera Mateusza Ratajczaka.
2. Użytkownik przyjmuje do wiadomości, że Administratorem danych osobowych jest deweloper Mateusz Ratajczak, z siedzibą w Tychach (zwany dalej „Administratorem”).
3. Użytkownikiem jest każda osoba fizyczna korzystająca z usług świadczonych za pośrednictwem Aplikacji.
4. Użytkownik przyjmuje do wiadomości, że udostępnianie przez niego danych osobowych jest dobrowolne. Udostępnianie Administratorowi danych osobowych przez Użytkownika następuje po zaakceptowaniu Polityki Prywatności podczas rejestracji w Aplikacji.
5. Dane osobowe, udostępniane przez Użytkownika, mogą być wykorzystywane przez Administratora do wysyłania Użytkownikowi informacji handlowych o nowościach i ofertach Administratora, wyłącznie w sytuacji gdy Użytkownik wyraził zgodę na otrzymywanie tego typu informacji.
6. Niniejszym Użytkownik akceptuje zasady zawarte w Polityce Prywatności.
"""
    
    @State private var policy_two: String =
"""
1. Administrator nie zbiera bez zgody Użytkownika danych osobowych, a wyłącznie dane nie posiadające takiego przymiotu, w szczególności dane demograficzne i dane dotyczące użytkowania Aplikacji. Zbieranie danych opisanych w zdaniu poprzednim odbywa się automatycznie (zwane dalej „dane zbierane automatycznie”).
2. Dane zbierane automatycznie nie umożliwiają jednoznacznej identyfikacji Użytkownika.
3. Dane zbierane automatycznie mogą służyć Administratorowi do poprawy jakości świadczonych usług, w szczególności w przypadku wystąpienia błędu Aplikacji. W sytuacji opisanej powyżej, dane zbierane automatycznie będą dotyczyły błędu Aplikacji, w tym stanu urządzenia mobilnego Użytkownika w chwili wystąpienia błędu, identyfikacji urządzenia mobilnego Użytkownika,
fizycznej lokalizacji urządzenia mobilnego Użytkownika w chwili wystąpienia błędu.
4. Nie ma możliwości zmiany bądź usunięcia danych zbieranych automatycznie.
"""
    
    @State private var policy_three: String =
"""
1. W przypadkach kontaktowania się Użytkownika z Administratorem, określonych w Regulaminie, Administrator będzie wymagał podania przez Użytkownika: imienia, nazwiska oraz adresu e-mail, (zwane dalej: „dane zbierane w celu nawiązania kontaktu”).
2. Podanie przez Użytkownika danych zbieranych w celu nawiązania kontaktu jest dobrowolne, jednakże stanowić będzie wyłączną podstawę nawiązania kontaktu zwrotnego Administratora z Użytkownikiem oraz umożliwi Administratorowi weryfikację Użytkownika.
3. Dane zbierane w celu nawiązania kontaktu będą wykorzystywane wyłącznie w celu umożliwienia poprawnej, pełnej i sprawnej komunikacji pomiędzy Administratorem a Użytkownikiem.
"""
    
    @State private var policy_four: String =
"""
1. W trakcie rejestracji w Aplikacji i korzystania z Aplikacji, Administrator może domagać się podania przez Użytkownika danych osobowych, w celu realizacji usług świadczonych przez Administratora za pośrednictwem Aplikacji.
2. Dane osobowe Użytkownika zbierane w sposób określony w ust. 1 powyżej obejmują m.in.: nazwisko, imię, adres e-mail, numer telefonu, miejsce zamieszkania, informacje o koncie (nazwa Użytkownika, hasło, indywidualne ID Użytkownika), płeć, data urodzenia, obrazy, zdjęcia, filmy, dane o cechach fizycznych (waga, wzrost, wymiary ciała), dane o aktywności fizycznej (czas trwania i intensywność treningu, liczba spalonych kalorii, dystans, tempo), kontakty i informacje z kalendarza, dane lokalizacyjne (GPS).
"""
    
    @State private var policy_five: String =
"""
1. Zebrane dane osobowe Użytkownika będą wykorzystywane przez Administratora celem dostarczenia wybranej przez Użytkownika usługi.
2. Dane osobowe o aktywności fizycznej i lokalizacji Użytkownika, mogą być używane przez Administratora w celu dokonania obliczeń związanych z innymi informacjami o aktywności np. utrata wagi. Informacje wskazane w zdaniu poprzednim będą udostępniane Użytkownikowi w Aplikacji.
"""
    
    @State private var policy_six: String =
"""
1. Administrator zobowiązuje się przetwarzać dane osobowe Użytkownika z zachowaniem wymogów Ustawy z dnia 29 sierpnia 1997 roku o ochronie danych osobowych oraz Ustawy z dnia 18 lipca 2002 roku o świadczeniu usług drogą elektroniczną.
2. Administrator gwarantuje zapewnienie odpowiednich środków technicznych i organizacyjnych zapewniających bezpieczeństwo przetwarzanych danych osobowych, w szczególności uniemożliwiających dostęp do nich nieuprawnionym osobom trzecim, lub ich przetwarzania z naruszeniem przepisów powszechnie obowiązującego prawa, zapobiegających utracie danych osobowych, ich uszkodzeniu lub zniszczeniu.
3. Dane osobowe Użytkownika będą przechowywane tak długo, jak będzie to konieczne do realizacji przez Administratora usług świadczonych za pośrednictwem Aplikacji.
4. Administrator ma prawo udostępniania danych osobowych Użytkownika: spółkom zależnym; stronom trzecim w przypadku sprzedaży im całości lub części swoich udziałów, lub w przypadku fuzji Administratora ze strona trzecią, lub nabycia udziałów w Spółce Administratora przez stronę trzecią; innym podmiotom trzecim, które zaakceptowały Politykę Prywatności, o ile Administrator zawarł z nim umowę konieczną do realizacji przez Administratora usług świadczonych za pośrednictwem Aplikacji; właściwym organom, które zgłoszą konieczność udostępnienia danych osobowych w oparciu o odpowiednie podstawy powszechnie obowiązującego prawa.
"""
    
    @State private var policy_seven: String =
"""
1. Użytkownik ma prawo dostępu do swoich danych osobowych za pośrednictwem Aplikacji.
2. Użytkownik może w każdej chwili dokonać modyfikacji, zmiany, uzupełnienia lub usunięcia
udostępnionych danych osobowych, za pośrednictwem narządzi dostępnych w Aplikacji.
3. W przypadku trwałego usunięcia przez Użytkownika danych osobowych, koniecznych do realizacji przez Administratora usług świadczonych za pośrednictwem Aplikacji, Użytkownik utraci
możliwość korzystania z tych usług.
5. Administrator zastrzega sobie prawo wprowadzenia zmian w Polityce Prywatności, o czym
poinformuje Użytkownika za pośrednictwem Aplikacji. Jeżeli Użytkownik nie wyrazi zgody na wprowadzone zmiany, zobowiązany jest trwale usunąć Aplikację ze swojego urządzenia mobilnego.
"""
}

#Preview {
    PrivacyPolicyView()
}
