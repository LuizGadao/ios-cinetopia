//
//  Movie.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 24/02/24.
//

import Foundation

class Movie: Decodable {
    let id: String
    let title: String
    let image: String
    let synopsis: String
    let rate: Double
    let releaseDate: String
    private(set) var isSelected: Bool? = false
    
    func changeSectionStatus() {
        isSelected = !(isSelected ?? false)
    }
}

/*
 let myListMovies: [Movie] = [
 Movie(id: "1", title: "Avatar", image: "https://raw.githubusercontent.com/alura-cursos/movie-api/main/images/avatar.jpg", synopsis: "No exuberante mundo alienígena de Pandora vivem os Na'vi, seres que parecem ser primitivos, mas são altamente evoluídos. Como o ambiente do planeta é tóxico, foram criados os avatares, corpos biológicos controlados pela mente humana que se movimentam livremente em Pandora. Jake Sully, um ex-fuzileiro naval paralítico, volta a andar através de um avatar e se apaixona por uma Na'vi. Esta paixão leva Jake a lutar pela sobrevivência de Pandora.", rate: 9.4, releaseDate: "18/12/2009"),
 Movie(id: "2", title: "Vingadores Ultimato", image: "https://raw.githubusercontent.com/alura-cursos/movie-api/main/images/vingadores-ultimato.jpg", synopsis: "Após Thanos eliminar metade das criaturas vivas, os Vingadores têm de lidar com a perda de amigos e entes queridos. Com Tony Stark vagando perdido no espaço sem água e comida, Steve Rogers e Natasha Romanov lideram a resistência contra o titã louco.", rate: 9.2, releaseDate: "25/04/2019"),
 Movie(id: "3", title: "Harry Potter e as Relíquias da Morte - Parte 2", image: "https://raw.githubusercontent.com/alura-cursos/movie-api/main/images/vingadores-ultimato.jpg", synopsis: "A batalha entre as forças do bem e do mal da magia alcançam o mundo dos trouxas. O risco nunca foi tão grande, e ninguém está seguro. Harry Potter precisa fazer um sacrifício final conforme o confronto com Lord Voldemort se aproxima.", rate: 9.5, releaseDate: "15/07/2011"),
 Movie(id: "3", title: "Harry Potter e as Relíquias da Morte - Parte 1", image: "https://raw.githubusercontent.com/alura-cursos/movie-api/main/images/vingadores-ultimato.jpg", synopsis: "A batalha entre as forças do bem e do mal da magia alcançam o mundo dos trouxas. O risco nunca foi tão grande, e ninguém está seguro. Harry Potter precisa fazer um sacrifício final conforme o confronto com Lord Voldemort se aproxima.", rate: 9.5, releaseDate: "15/07/2011"),
 Movie(id: "3", title: "Harry Potter e as Relíquias da Morte - Parte 3", image: "https://raw.githubusercontent.com/alura-cursos/movie-api/main/images/vingadores-ultimato.jpg", synopsis: "A batalha entre as forças do bem e do mal da magia alcançam o mundo dos trouxas. O risco nunca foi tão grande, e ninguém está seguro. Harry Potter precisa fazer um sacrifício final conforme o confronto com Lord Voldemort se aproxima.", rate: 9.5, releaseDate: "15/07/2011"),
 Movie(id: "3", title: "Harry Potter e as Relíquias da Morte - Parte 4", image: "https://raw.githubusercontent.com/alura-cursos/movie-api/main/images/vingadores-ultimato.jpg", synopsis: "A batalha entre as forças do bem e do mal da magia alcançam o mundo dos trouxas. O risco nunca foi tão grande, e ninguém está seguro. Harry Potter precisa fazer um sacrifício final conforme o confronto com Lord Voldemort se aproxima.", rate: 9.5, releaseDate: "15/07/2011"),
 Movie(id: "3", title: "Harry Potter e as Relíquias da Morte - Parte 5", image: "https://raw.githubusercontent.com/alura-cursos/movie-api/main/images/vingadores-ultimato.jpg", synopsis: "A batalha entre as forças do bem e do mal da magia alcançam o mundo dos trouxas. O risco nunca foi tão grande, e ninguém está seguro. Harry Potter precisa fazer um sacrifício final conforme o confronto com Lord Voldemort se aproxima.", rate: 9.5, releaseDate: "15/07/2011"),
 ]
 */
