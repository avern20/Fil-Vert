//
//  Models.swift
//  FilVert
//
//  Created by Lora-Line on 15/09/2025.
//

import Foundation
import MapKit

struct Clothe: Identifiable{
    let id = UUID()
    var name: String
    var brand: BrandName
    var price: Double
    var image: String
    var description: String
    var material: String
    var tags: [Tag]
    let type: TypeClothe
    let style: [StylesClothe]
    let morphologyFit: [MorphologyName]
    let womenOrMensWear:WomenMenBothWear
}

struct Brand: Identifiable{
    let id = UUID()
    var name: BrandName
    var logo: String
    var description: String
    var tags: [Tag]
    var link: String
}

struct Shop: Identifiable{
    let id = UUID()
    var name: String
    var logo: String
    var adress: String
    var coordinates: CLLocationCoordinate2D
    var openingHours: [String]
    var tags: [Tag]
    var goodToKnow: [String]
}

struct FAQ: Identifiable{
    let id = UUID()
    var question: String
    var answer: String
}


class Profil: Identifiable, ObservableObject{ //c
    let id = UUID()
    @Published var name: String //P
    @Published var sexe: Sexes
    @Published var measurement: Measurement //p
    @Published var morphology: MorphologyName //P
    @Published var styles: [StylesClothe] // P
    init(name: String, sexe: Sexes, measurement: Measurement, morphology: MorphologyName, styles: [StylesClothe]) {
        self.name = name
        self.sexe = sexe
        self.measurement = measurement
        self.morphology = morphology
        self.styles = styles
    }
}
//struct Profil: Identifiable{ //c
//    let id = UUID()
//    var name: String //P
//    var sexe: Sexes //P
//    var measurement: Measurement //p
//    var morphology: MorphologyName //P
//    var styles: [StylesClothe] // P
//}

class Measurement: Identifiable, ObservableObject{  //c
    let id = UUID()
    @Published var height: Double
    @Published var waistSize: Double
    @Published var bustSize: Double
    @Published var hipsSize: Double
    init(height: Double, waistSize: Double, bustSize: Double, hipsSize: Double) {
        self.height = height
        self.waistSize = waistSize
        self.bustSize = bustSize
        self.hipsSize = hipsSize
    }
}
//struct Measurement: Identifiable{  //c
//    let id = UUID()
//    var height: Double
//    var waistSize: Double
//    var bustSize: Double
//    var hipsSize: Double
//}

struct Styles: Identifiable{
    let id = UUID()
    var name: StylesClothe
    var image: [String]
}

struct Morphology: Identifiable {
    let id = UUID()
    var name: MorphologyName
    var image: [String]
}

struct ChipFilter: Identifiable {
    let id = UUID()
    var title: String
    var isSelected: Bool = false
}

enum TypeClothe:String, CaseIterable  {
    case haut = "Haut"
    case bas = "Bas"
    case veste = "Vestes"
    case robe = "Robe"
    case chaussures = "Chaussures"
    case accessoire = "Accessoires"
}

enum Sexes:String {
    case femme = "Femme"
    case homme = "Homme"
    case nonBinaire = "Non-binaire"
}

enum Tag:String, CaseIterable {
    case friperie = "Friperie"
    case bio = "Biologique"
    case upcycler = "Upcycler"
    case transparence = "Transparence"
    case local = "Local"
    case justePrix = "Juste prix"
    case madeInFrance = "Fait en France"
    case qualite = "Qualité"
    case petiteTaille = "Petite Taille"
    case grandeTaille = "Grande Taille"
}
enum WomenMenBothWear:String {
    case femme = "Femme"
    case homme = "Homme"
    case unisex = "Unisex"
}
enum BrandName:String {
    case veja = "Veja"
    case ekyog = "Ekyog"
    case hopaal = "Hopaal"
    case postdiem = "Post Diem"
    case sezane = "Sézane"
    case lesSublimes = "Les Sublimes"
    case lesRecuperables = "Les Recupérables"
    case atelierGConstantini = "Atelier G. Constantini"
    case balzac = "Balzac Paris"
    case milleQuatreVingTrois = "1083"
    case doYouGreen = "Do You Green"
    case downOnTheCorner = "Down On The Corner"
    case carrousselClothing = "Carrousel Clothing"
    case makeMyLimonade = "Make My Lemonade"
    case cotonVert = "Coton Vert"
    case lesPetitesAmbitieuses = "Les Petites Ambitieuses"
    case petiteAndSoWhat = "Petite and So What"
}

enum MorphologyName:String {
    case a = "Triangle"
    case v = "Triangle inversée"
    case h = "Rectangle"
    case o = "Ovale"
    case x = "Sablier"
}

enum StylesClothe: String{
    case elegant = "Elegant"
    case sophistique = "Sophistiqué"
    case decontracte = "Décontracté"
    case streetwear = "Streetwear"
    case boheme = "Bohème"
    case sportwears = "Sportswears"
    case rock = "Rock"
    case minimaliste = "Minimaliste"
    case preppy = "Preppy"
    
}


