//
//  Database.swift
//  FilVert
//
//  Created by Lora-Line on 15/09/2025.
//

import Foundation
import MapKit


var users: [Profil] = [
    Profil(name: "Hanna", sexe: .femme, measurement: Measurement(height: 175, waistSize: 95, bustSize: 70, hipsSize: 95), morphology: .a, styles: [.boheme, .decontracte, .preppy])
    ]

var sexes: [Sexes] = [.femme, .homme, .nonBinaire]

let clothes: [Clothe] = [
    Clothe(
        name: "Top crop en lin",
        brand: BrandName.ekyog,
        price: 70.0,
        image: "top_crop_lin_ekyog",
        description: "Top court en lin bio, respirant et parfait pour l'été.",
        material: "100% lin bio",
        tags: [Tag.qualite],
        type: TypeClothe.haut,
        style: [StylesClothe.decontracte, StylesClothe.elegant],
        morphologyFit: [MorphologyName.h, MorphologyName.v, MorphologyName.x],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "T-shirt col rond",
        brand: BrandName.sezane,
        price: 55.0,
        image: "tshirt_col_rond_sezane",
        description: "T-shirt basique col rond en coton bio, indispensable et polyvalent.",
        material: "100% coton bio",
        tags: [Tag.qualite],
        type: TypeClothe.haut,
        style: [StylesClothe.minimaliste, StylesClothe.decontracte],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.a, MorphologyName.v, MorphologyName.x],
        womenOrMensWear: .unisex
    ),

    Clothe(
        name: "T-shirt basique",
        brand: BrandName.hopaal,
        price: 45.0,
        image: "tshirt_hopaal",
        description: "T-shirt éco-conçu en coton recyclé, doux et durable.",
        material: "Coton recyclé",
        tags: [Tag.upcycler],
        type: TypeClothe.haut,
        style: [StylesClothe.minimaliste, StylesClothe.streetwear],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.a, MorphologyName.v, MorphologyName.x],
        womenOrMensWear: .unisex
    ),

    Clothe(
        name: "Veja Campo",
        brand: BrandName.veja,
        price: 150.0,
        image: "veja_campo2",
        description: "Sneakers Veja Campo en cuir écologique, style minimaliste et elegant.",
        material: "Cuir écologique et caoutchouc naturel",
        tags: [Tag.qualite],
        type: TypeClothe.chaussures,
        style: [StylesClothe.minimaliste, StylesClothe.decontracte],
        morphologyFit: [MorphologyName.a, MorphologyName.v, MorphologyName.x, MorphologyName.h, MorphologyName.o],
        womenOrMensWear: .unisex
    ),

    Clothe(
        name: "Veja Pampa",
        brand: BrandName.veja,
        price: 160.0,
        image: "veja_pampa",
        description: "Sneakers montantes Veja Pampa en toile biologique, confortables et stylées.",
        material: "Toile bio et caoutchouc naturel",
        tags: [Tag.qualite],
        type: TypeClothe.chaussures,
        style: [StylesClothe.streetwear, StylesClothe.decontracte],
        morphologyFit: [MorphologyName.a, MorphologyName.v, MorphologyName.x, MorphologyName.h, MorphologyName.o],
        womenOrMensWear: .unisex
    ),

    Clothe(
        name: "Veja Riobranco",
        brand: BrandName.veja,
        price: 155.0,
        image: "veja_riobranco",
        description: "Sneakers Veja Riobranco en suède et tissu recyclé, look rétro.",
        material: "Suède écologique et polyester recyclé",
        tags: [Tag.upcycler],
        type: TypeClothe.chaussures,
        style: [StylesClothe.decontracte, StylesClothe.streetwear],
        morphologyFit: [MorphologyName.a, MorphologyName.v, MorphologyName.x, MorphologyName.h, MorphologyName.o],
        womenOrMensWear: .unisex
    ),

    Clothe(
        name: "Veja Venturi",
        brand: BrandName.veja,
        price: 175.0,
        image: "veja_venturi",
        description: "Sneakers Veja Venturi robustes et éco-conçues, idéales pour un style casual.",
        material: "Cuir vegan et matériaux recyclés",
        tags: [Tag.upcycler],
        type: TypeClothe.chaussures,
        style: [StylesClothe.streetwear, StylesClothe.decontracte],
        morphologyFit: [MorphologyName.a, MorphologyName.v, MorphologyName.x, MorphologyName.h, MorphologyName.o],
        womenOrMensWear: .unisex
    ),
    Clothe(
        name: "Pull vintage",
        brand: BrandName.postdiem,
        price: 95.0,
        image: "pull_vintage_post_diem",
        description: "Pull vintage en coton recyclé, coupe loose et look rétro.",
        material: "Coton recyclé",
        tags: [Tag.upcycler],
        type: TypeClothe.haut,
        style: [StylesClothe.decontracte],
        morphologyFit: [MorphologyName.o, MorphologyName.h, MorphologyName.a],
        womenOrMensWear: .unisex
    ),

    Clothe(
        name: "Robe chemise",
        brand: BrandName.makeMyLimonade,
        price: 140.0,
        image: "robe_chemise_limonade",
        description: "Robe chemise fluide, confortable et élégante, parfaite au quotidien.",
        material: "Coton bio",
        tags: [Tag.qualite],
        type: TypeClothe.robe,
        style: [StylesClothe.elegant, StylesClothe.decontracte],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.v],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Robe Geneviève",
        brand: BrandName.sezane,
        price: 160.0,
        image: "robe_genevieve_sezane",
        description: "Robe élégante mi-longue en coton biologique, style intemporel.",
        material: "100% coton bio",
        tags: [Tag.qualite],
        type: TypeClothe.robe,
        style: [StylesClothe.elegant, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.x, MorphologyName.a, MorphologyName.v],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Robe midi",
        brand: BrandName.petiteAndSoWhat,
        price: 150.0,
        image: "robe_midi_petite_&_So_what",
        description: "Robe midi élégante, idéale pour sublimer la silhouette avec féminité.",
        material: "Coton bio",
        tags: [Tag.qualite],
        type: TypeClothe.robe,
        style: [StylesClothe.elegant, StylesClothe.decontracte],
        morphologyFit: [MorphologyName.a, MorphologyName.x, MorphologyName.v],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Robe mini bohème",
        brand: BrandName.lesPetitesAmbitieuses,
        price: 120.0,
        image: "robe_mini_boheme_les_petites_ambitieuses",
        description: "Robe courte bohème en coton bio avec imprimé floral.",
        material: "100% coton bio",
        tags: [Tag.qualite],
        type: TypeClothe.robe,
        style: [StylesClothe.boheme, StylesClothe.decontracte],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.a],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Robe portefeuille",
        brand: BrandName.ekyog,
        price: 165.0,
        image: "Robe_portefeuille_Ekyog",
        description: "Robe portefeuille fluide en viscose écoresponsable, flatteuse pour la silhouette.",
        material: "Viscose écoresponsable",
        tags: [Tag.qualite],
        type: TypeClothe.robe,
        style: [StylesClothe.elegant, StylesClothe.boheme],
        morphologyFit: [MorphologyName.a, MorphologyName.o, MorphologyName.x],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Robe portefeuille Sézane",
        brand: BrandName.sezane,
        price: 170.0,
        image: "robe_portefeuille_sezane",
        description: "Robe portefeuille féminine en coton bio, parfaite pour toutes occasions.",
        material: "100% coton bio",
        tags: [Tag.qualite],
        type: TypeClothe.robe,
        style: [StylesClothe.elegant, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.a, MorphologyName.o, MorphologyName.x],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Robe Scarlett",
        brand: BrandName.sezane,
        price: 180.0,
        image: "Robe_Scarlett_Sezane",
        description: "Robe élégante et raffinée, parfaite pour les grandes occasions.",
        material: "Coton bio et soie",
        tags: [Tag.qualite],
        type: TypeClothe.robe,
        style: [StylesClothe.elegant, StylesClothe.preppy],
        morphologyFit: [MorphologyName.x, MorphologyName.a, MorphologyName.v],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Robe toutes saisons",
        brand: BrandName.cotonVert,
        price: 95.0,
        image: "robe_toutes_saisons_fr_tbg_cv",
        description: "Robe pratique et confortable en coton bio, idéale pour toutes les saisons.",
        material: "100% coton bio",
        tags: [Tag.bio, Tag.madeInFrance],
        type: TypeClothe.robe,
        style: [StylesClothe.decontracte, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.a],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Robe trapèze",
        brand: BrandName.ekyog,
        price: 130.0,
        image: "robe_trapeze_ekyog",
        description: "Robe trapèze fluide et légère en coton bio.",
        material: "100% coton bio",
        tags: [Tag.qualite],
        type: TypeClothe.robe,
        style: [StylesClothe.boheme, StylesClothe.elegant],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.a],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Robe vintage",
        brand: BrandName.lesRecuperables,
        price: 125.0,
        image: "robe_vintage_les_recuperables",
        description: "Robe unique en tissu upcyclé, style vintage et responsable.",
        material: "Coton recyclé",
        tags: [Tag.upcycler],
        type: TypeClothe.robe,
        style: [StylesClothe.streetwear, StylesClothe.decontracte],
        morphologyFit: [MorphologyName.o, MorphologyName.h, MorphologyName.a],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Sac Mae",
        brand: BrandName.balzac,
        price: 140.0,
        image: "sac_mae_balzac",
        description: "Sac en cuir responsable, pratique et intemporel.",
        material: "Cuir écoresponsable",
        tags: [Tag.qualite],
        type: TypeClothe.accessoire,
        style: [StylesClothe.elegant, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.a, MorphologyName.v, MorphologyName.x, MorphologyName.o, MorphologyName.h],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Ballerines Sézane",
        brand: BrandName.sezane,
        price: 135.0,
        image: "sezane_ballerines",
        description: "Ballerines élégantes en cuir écoresponsable, parfaites pour un look elegant.",
        material: "Cuir écoresponsable",
        tags: [Tag.qualite],
        type: TypeClothe.chaussures,
        style: [StylesClothe.elegant, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.a, MorphologyName.v, MorphologyName.x, MorphologyName.o, MorphologyName.h],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Trench Clyde",
        brand: BrandName.sezane,
        price: 220.0,
        image: "sezane_clyde_trench",
        description: "Trench élégant et intemporel, fabriqué en coton bio.",
        material: "100% coton bio",
        tags: [Tag.qualite],
        type: TypeClothe.veste,
        style: [StylesClothe.elegant, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.v],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Short cycliste",
        brand: BrandName.hopaal,
        price: 60.0,
        image: "short_cycliste_hopaal",
        description: "Short cycliste éco-conçu, idéal pour le sport ou un look streetwear.",
        material: "Polyester recyclé",
        tags: [Tag.upcycler],
        type: TypeClothe.bas,
        style: [StylesClothe.sportwears, StylesClothe.streetwear],
        morphologyFit: [MorphologyName.h, MorphologyName.v, MorphologyName.o],
        womenOrMensWear: .unisex
    ),

    Clothe(
        name: "Short denim",
        brand: BrandName.balzac,
        price: 75.0,
        image: "Short_denim_Balzac",
        description: "Short en denim bio, coupe décontractée et estivale.",
        material: "100% coton bio",
        tags: [Tag.qualite],
        type: TypeClothe.bas,
        style: [StylesClothe.decontracte, StylesClothe.streetwear],
        morphologyFit: [MorphologyName.h, MorphologyName.v, MorphologyName.a],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Sweat Hauteville",
        brand: BrandName.balzac,
        price: 95.0,
        image: "sweat_hauteville_balzac",
        description: "Sweat chiné en coton bio, confortable et basique.",
        material: "100% coton bio",
        tags: [Tag.qualite],
        type: TypeClothe.haut,
        style: [StylesClothe.decontracte, StylesClothe.streetwear],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.v],
        womenOrMensWear: .homme
    ),

    Clothe(
        name: "T-shirt blouse",
        brand: BrandName.ekyog,
        price: 65.0,
        image: "t_shirt_blouse_ekyog",
        description: "T-shirt fluide en coton bio, look casual elegant.",
        material: "100% coton bio",
        tags: [Tag.qualite],
        type: TypeClothe.haut,
        style: [StylesClothe.elegant, StylesClothe.decontracte],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.a],
        womenOrMensWear: .femme
    ),
    Clothe(
        name: "Béret en laine recyclée",
        brand: BrandName.lesRecuperables,
        price: 60.0,
        image: "beret_laine_recyclee_les_recuperables",
        description: "Un béret intemporel et élégant, fabriqué à partir de laine recyclée pour allier style et écoresponsabilité.",
        material: "Laine recyclée",
        tags: [Tag.upcycler, Tag.madeInFrance],
        type: TypeClothe.accessoire,
        style: [StylesClothe.elegant, StylesClothe.boheme, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.x],
        womenOrMensWear: .unisex
    ),
    Clothe(
        name: "Bermuda ajusté 173N",
        brand: BrandName.milleQuatreVingTrois,
        price: 85.0,
        image: "bermuda_ajuste_173n_1083",
        description: "Bermuda ajusté en coton bio, confortable et parfait pour l'été.",
        material: "100% coton bio",
        tags: [Tag.qualite],
        type: TypeClothe.bas,
        style: [StylesClothe.decontracte, StylesClothe.elegant, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.h, MorphologyName.v, MorphologyName.a],
        womenOrMensWear: .homme
    ),

    Clothe(
        name: "Bermuda urbain",
        brand: BrandName.lesRecuperables,
        price: 95.0,
        image: "bermuda_urbain_post_diem",
        description: "Bermuda moderne et urbain en coton biologique, idéal pour un look casual elegant.",
        material: "100% coton bio",
        tags: [Tag.local],
        type: TypeClothe.bas,
        style: [StylesClothe.streetwear, StylesClothe.decontracte, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.v],
        womenOrMensWear: .homme
    ),

    Clothe(
        name: "Blazer oversize",
        brand: BrandName.petiteAndSoWhat,
        price: 160.0,
        image: "blazer_oversize_petite_&_so_what",
        description: "Blazer oversize en tissu éco-responsable, parfait pour un look elegant et décontracté.",
        material: "Mélange de fibres écoresponsables",
        tags: [Tag.qualite],
        type: TypeClothe.veste,
        style: [StylesClothe.elegant, StylesClothe.decontracte, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.x, MorphologyName.h, MorphologyName.o],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Blouse fleurie",
        brand: BrandName.lesSublimes,
        price: 120.0,
        image: "blouse_fleurie_les_sublimes",
        description: "Blouse fleurie en viscose écoresponsable, féminine et agréable à porter.",
        material: "Viscose écoresponsable",
        tags: [Tag.qualite],
        type: TypeClothe.haut,
        style: [StylesClothe.boheme, StylesClothe.elegant, StylesClothe.decontracte],
        morphologyFit: [MorphologyName.a, MorphologyName.o, MorphologyName.x],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Blouse Basile",
        brand: BrandName.balzac,
        price: 110.0,
        image: "blouse_basile_balzac",
        description: "Blouse fluide et élégante en coton bio, idéale pour un look casual elegant.",
        material: "100% coton bio",
        tags: [Tag.qualite],
        type: TypeClothe.haut,
        style: [StylesClothe.elegant, StylesClothe.minimaliste, StylesClothe.boheme],
        morphologyFit: [MorphologyName.h, MorphologyName.v, MorphologyName.a],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Blouse fleurie",
        brand: BrandName.lesSublimes,
        price: 120.0,
        image: "blouse_fleurie_les_sublimes",
        description: "Blouse fleurie en viscose écoresponsable, féminine et agréable à porter.",
        material: "Viscose écoresponsable",
        tags: [Tag.qualite],
        type: TypeClothe.haut,
        style: [StylesClothe.boheme, StylesClothe.elegant, StylesClothe.decontracte],
        morphologyFit: [MorphologyName.a, MorphologyName.o, MorphologyName.x],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Boots Jojo Effet Snake",
        brand: BrandName.makeMyLimonade,
        price: 220.00,
        image: "boots_jojo_effet_snake_mml",
        description: "Des boots au style affirmé avec un effet snake, idéales pour dynamiser une tenue.",
        material: "100% cuir",
        tags: [Tag.qualite],
        type: TypeClothe.chaussures,
        style: [StylesClothe.rock, StylesClothe.elegant, StylesClothe.streetwear],
        morphologyFit: [MorphologyName.a, MorphologyName.h, MorphologyName.o, MorphologyName.v, MorphologyName.x], // toutes morphologies
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Bottes Anita Kaki",
        brand: BrandName.makeMyLimonade,
        price: 230.00,
        image: "bottes_anita_kaki_mml",
        description: "Bottes hauteur genou avec talon 8 cm, soufflet élastiqué au mollet pour plus de confort.",
        material: "Cuir de veau, doublure synthétique",
        tags: [Tag.qualite],
        type: TypeClothe.chaussures,
        style: [StylesClothe.elegant, StylesClothe.elegant, StylesClothe.boheme],
        morphologyFit: [MorphologyName.a, MorphologyName.h, MorphologyName.o, MorphologyName.v, MorphologyName.x], // toutes morphologies
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Jupe crayon",
        brand: BrandName.balzac,
        price: 120.0,
        image: "jupe_crayon_balzac",
        description: "Jupe crayon élégante en coton bio, parfaite pour un look elegant et féminin.",
        material: "100% coton bio",
        tags: [Tag.qualite],
        type: TypeClothe.bas,
        style: [StylesClothe.elegant, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.x, MorphologyName.h, MorphologyName.o],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Pantalon Siméon",
        brand: BrandName.balzac,
        price: 135.0,
        image: "pantalon_simeon_balzac",
        description: "Pantalon fluide en coton bio, coupe droite moderne et confortable.",
        material: "100% coton bio",
        tags: [Tag.qualite],
        type: TypeClothe.bas,
        style: [StylesClothe.decontracte, StylesClothe.elegant, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.h, MorphologyName.v, MorphologyName.o],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Parka imperméable",
        brand: BrandName.hopaal,
        price: 210.0,
        image: "parka_impermeable_hopaal",
        description: "Parka imperméable en polyester recyclé, idéale pour affronter la pluie avec style.",
        material: "Polyester recyclé",
        tags: [Tag.upcycler],
        type: TypeClothe.veste,
        style: [StylesClothe.sportwears, StylesClothe.streetwear],
        morphologyFit: [MorphologyName.h, MorphologyName.v, MorphologyName.o],
        womenOrMensWear: .unisex
    ),

    Clothe(
        name: "Polo coton bio",
        brand: BrandName.cotonVert,
        price: 49.0,
        image: "polo_hm_cb",
        description: "Polo intemporel en coton bio, confortable et solide pour un usage quotidien.",
        material: "100% coton bio",
        tags: [Tag.qualite, Tag.bio],
        type: TypeClothe.haut,
        style: [StylesClothe.sportwears, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.h, MorphologyName.v, MorphologyName.o],
        womenOrMensWear: .unisex
    ),

    Clothe(
        name: "Pocket T-shirt Hopaal",
        brand: BrandName.hopaal,
        price: 45.0,
        image: "pocket_t_shirt_hopaal",
        description: "T-shirt en coton bio avec poche poitrine, basique et durable.",
        material: "100% coton bio",
        tags: [Tag.qualite],
        type: TypeClothe.haut,
        style: [StylesClothe.decontracte, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.h, MorphologyName.v, MorphologyName.a],
        womenOrMensWear: .unisex
    ),

    Clothe(
        name: "Pull mérinos",
        brand: BrandName.hopaal,
        price: 130.0,
        image: "pull_merinos_opaal",
        description: "Pull en laine mérinos chaud et respirant, fabriqué en Europe.",
        material: "Laine mérinos",
        tags: [Tag.qualite],
        type: TypeClothe.haut,
        style: [StylesClothe.minimaliste, StylesClothe.elegant],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.x],
        womenOrMensWear: .homme
    ),

    Clothe(
        name: "Pull oversize pastel",
        brand: BrandName.doYouGreen,
        price: 110.0,
        image: "pull_oversize_pastel_post_diem",
        description: "Pull oversize doux et pastel en coton bio, parfait pour un look cocooning.",
        material: "100% coton bio",
        tags: [Tag.local],
        type: TypeClothe.haut,
        style: [StylesClothe.decontracte, StylesClothe.boheme],
        morphologyFit: [MorphologyName.o, MorphologyName.h, MorphologyName.a],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Cardigan long",
        brand: BrandName.ekyog,
        price: 145.0,
        image: "cardigan_long_ekyog",
        description: "Cardigan long en laine recyclée, parfait pour un look cosy et responsable.",
        material: "Laine recyclée",
        tags: [Tag.qualite, Tag.upcycler],
        type: TypeClothe.haut,
        style: [StylesClothe.decontracte, StylesClothe.boheme, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.x],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Ceinture en cuir",
        brand: BrandName.milleQuatreVingTrois,
        price: 55.0,
        image: "ceinture_en_cuir_1083",
        description: "Ceinture en cuir fabriquée en France, solide et élégante pour compléter vos tenues.",
        material: "100% cuir",
        tags: [Tag.qualite, Tag.madeInFrance],
        type: TypeClothe.accessoire,
        style: [StylesClothe.elegant, StylesClothe.decontracte, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.a, MorphologyName.h, MorphologyName.o, MorphologyName.v, MorphologyName.x], // toutes morphologies
        womenOrMensWear: .unisex
    ),

    Clothe(
        name: "Jean décontracté",
        brand: BrandName.petiteAndSoWhat,
        price: 110.0,
        image: "jean_décontracté",
        description: "Pantalon jean sympathique pour la saison automne.",
        material: "Polyester 100%",
        tags: [Tag.bio,  Tag.madeInFrance],
        type: TypeClothe.bas,
        style: [StylesClothe.decontracte, StylesClothe.streetwear, StylesClothe.rock],
        morphologyFit: [MorphologyName.x, MorphologyName.h, MorphologyName.v],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Jupe confortable",
        brand: BrandName.sezane,
        price: 135.0,
        image: "jupe_confortable",
        description: "Jupe agréable à porter pendant le mois d'automne.",
        material: "Lin",
        tags: [Tag.bio,  Tag.madeInFrance],
        type: TypeClothe.bas,
        style: [StylesClothe.decontracte, StylesClothe.boheme, StylesClothe.elegant],
        morphologyFit: [MorphologyName.v, MorphologyName.a, MorphologyName.h],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Robe Natacha Polka Daisy",
        brand: BrandName.makeMyLimonade,
        price: 160.00,
        image: "robe_natacha_polka_daisy_mml",
        description: "Imprimé inédit, manches bouffantes et partie jupe froncée",
        material: "Composée à 59% de viscose ecovero et 41% de viscose",
        tags: [ Tag.qualite, Tag.grandeTaille],
        type: TypeClothe.robe,
        style: [StylesClothe.boheme, StylesClothe.decontracte, StylesClothe.elegant],
        morphologyFit: [MorphologyName.o, MorphologyName.a, MorphologyName.h],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "La robe toutes saisons française en triple gaze de coton bio",
        brand: BrandName.cotonVert,
        price: 105.00,
        image: "robe_toutes_saisons_fr_tbg_cv",
        description: "La robe en lin. Intemporelle. Douce. Durable. Thermorégulatrice.",
        material: "100% lin",
        tags: [Tag.grandeTaille, Tag.justePrix],
        type: TypeClothe.robe,
        style: [StylesClothe.decontracte, StylesClothe.boheme, StylesClothe.elegant],
        morphologyFit: [MorphologyName.o, MorphologyName.v, MorphologyName.h],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "T-shirt rayé col V en coton upcyclé",
        brand: BrandName.cotonVert,
        price: 32.00,
        image: "tshirt_raye_col_v_cv",
        description: "T-shirt doux et durable.",
        material: "100% coton upcyclé",
        tags: [Tag.grandeTaille, Tag.justePrix],
        type: TypeClothe.haut,
        style: [StylesClothe.decontracte, StylesClothe.streetwear, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.o, MorphologyName.h, MorphologyName.x],
        womenOrMensWear: .femme
    ),
    Clothe(
        name: "T-Shirt Femme Col V Fluide",
        brand: BrandName.doYouGreen,
        price: 29.00,
        image: "tee_shirt_femme_col_v_fluide_dyg",
        description: "Confectionné en microfibre de pin de qualité française DYG, une matière naturellement respirante qui permet à votre peau de s'aérer et de transpirer naturellement",
        material:"Microfibre de pin",
        tags: [ Tag.qualite],
        type: TypeClothe.haut,
        style: [StylesClothe.minimaliste, StylesClothe.decontracte, StylesClothe.streetwear],
        morphologyFit: [MorphologyName.v, MorphologyName.h, MorphologyName.o],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Sneakers V-10",
        brand: BrandName.veja,
        price: 150.00,
        image: "veja_v10",
        description: "Sneakers blanches avec détails colorés, fabriquées en cuir écologique et caoutchouc sauvage.",
        material: "Cuir écologique, caoutchouc sauvage",
        tags: [ Tag.qualite],
        type: TypeClothe.chaussures,
        style: [StylesClothe.streetwear, StylesClothe.sportwears, StylesClothe.minimaliste, StylesClothe.rock],
        morphologyFit: [MorphologyName.h, MorphologyName.a, MorphologyName.o, MorphologyName.x, MorphologyName.v],
        womenOrMensWear: .unisex
    ),

    Clothe(
        name: "Sneakers Venturi",
        brand: BrandName.veja,
        price: 160.00,
        image: "veja_venturi",
        description: "Sneakers sportives en cuir et polyester recyclé, design dynamique et confortable.",
        material: "Cuir et polyester recyclé",
        tags: [ Tag.qualite],
        type: TypeClothe.chaussures,
        style: [StylesClothe.sportwears, StylesClothe.streetwear, StylesClothe.minimaliste, StylesClothe.rock],
        morphologyFit: [MorphologyName.h, MorphologyName.a, MorphologyName.o, MorphologyName.x, MorphologyName.v],
        womenOrMensWear: .homme
    ),

    Clothe(
        name: "T-shirt 'ON THE BUS'",
        brand: BrandName.downOnTheCorner,
        price: 55.00,
        image: "tshirt_on_the_bus",
        description: "T-shirt en coton bio avec imprimé 'ON THE BUS', coupe droite unisexe.",
        material: "100% coton bio",
        tags: [ Tag.friperie],
        type: TypeClothe.haut,
        style: [StylesClothe.rock, StylesClothe.streetwear, StylesClothe.decontracte],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.v],
        womenOrMensWear: .unisex
    ),

    Clothe(
        name: "T-shirt 'GOOD LIFE'",
        brand: BrandName.downOnTheCorner,
        price: 50.00,
        image: "tshirt_good_life",
        description: "T-shirt en coton bio avec imprimé 'GOOD LIFE', coupe droite unisexe.",
        material: "100% coton bio",
        tags: [ Tag.friperie],
        type: TypeClothe.haut,
        style: [StylesClothe.rock, StylesClothe.decontracte, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.h, MorphologyName.x, MorphologyName.a],
        womenOrMensWear: .unisex
    ),

    Clothe(
        name: "Short Driss",
        brand: BrandName.atelierGConstantini,
        price: 85.00,
        image: "short_driss",
        description: "Short en coton upcyclé, coupe droite, taille élastiquée. Fabriqué en France.",
        material: "100% coton upcyclé",
        tags: [ Tag.upcycler],
        type: TypeClothe.bas,
        style: [StylesClothe.decontracte, StylesClothe.streetwear, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.h, MorphologyName.v, MorphologyName.o],
        womenOrMensWear: .homme
    ),

    Clothe(
        name: "Pantalon Antonina",
        brand: BrandName.atelierGConstantini,
        price: 135.00,
        image: "pantalon_antonina",
        description: "Pantalon en coton upcyclé, coupe droite, taille haute. Fabriqué en France.",
        material: "100% coton upcyclé",
        tags: [ Tag.upcycler],
        type: TypeClothe.bas,
        style: [StylesClothe.elegant, StylesClothe.elegant, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.v, MorphologyName.x, MorphologyName.a],
        womenOrMensWear: .homme
    ),

    Clothe(
        name: "Top Venus Red Stripes",
        brand: BrandName.makeMyLimonade,
        price: 110.00,
        image: "top_venus_red_stripes_mml",
        description: "Rayures signatures, manches bouffantes",
        material: "100% viscose",
        tags: [ Tag.qualite],
        type: TypeClothe.haut,
        style: [StylesClothe.boheme, StylesClothe.decontracte, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.a, MorphologyName.h, MorphologyName.x],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "T-shirt Martel marine",
        brand: BrandName.balzac,
        price: 50.00,
        image: "tee-shirt_martel_marine",
        description: "Tee-shirt en coton bio, coupe droite, idéal pour un look décontracté.",
        material: "100% coton bio",
        tags: [ Tag.qualite],
        type: TypeClothe.haut,
        style: [StylesClothe.decontracte, StylesClothe.minimaliste, StylesClothe.streetwear],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.v],
        womenOrMensWear: .homme
    ),

    Clothe(
        name: "Sweat-shirt Hauteville gris chiné",
        brand: BrandName.balzac,
        price: 95.00,
        image: "sweat-shirt_hauteville_gris_chine",
        description: "Sweat-shirt en coton bio, coupe droite, confortable pour les journées fraîches.",
        material: "100% coton bio",
        tags: [ Tag.qualite],
        type: TypeClothe.haut,
        style: [StylesClothe.decontracte, StylesClothe.streetwear, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.h, MorphologyName.a, MorphologyName.o],
        womenOrMensWear: .homme
    ),
    Clothe(
        name: "Jupe Trapèze 292H Poches Plaquées",
        brand: BrandName.milleQuatreVingTrois,
        price: 79.00,
        image: "jupe_trapeze_292H_poches_plaquees_1083",
        description: "Avec sa coupe légèrement évasée et son tissu souple, cette jupe sublime votre silhouette tout en étant ultra agréable et facile à porter.",
        material: "100% coton bio",
        tags: [ Tag.qualite],
        type: TypeClothe.bas,
        style: [StylesClothe.decontracte, StylesClothe.boheme, StylesClothe.elegant],
        morphologyFit: [MorphologyName.v, MorphologyName.x, MorphologyName.a],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Jeans Marco Léopard",
        brand: BrandName.makeMyLimonade,
        price: 120.00,
        image: "jeans_marco_leopard_mml",
        description: "Imprimé léopard réinventé, coupe droite, jambe large.",
        material: "100% coton",
        tags: [ Tag.qualite],
        type: TypeClothe.bas,
        style: [StylesClothe.rock, StylesClothe.streetwear, StylesClothe.decontracte],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.v],
        womenOrMensWear: .femme
    ),

    Clothe(
        name: "Chemise en lin Octobre",
        brand: BrandName.sezane,
        price: 95.00,
        image: "chemise_lin_sezane2",
        description: "Chemise légère en lin naturel, coupe droite, idéale pour un look estival masculin.",
        material: "100% lin",
        tags: [ Tag.bio],
        type: TypeClothe.haut,
        style: [StylesClothe.decontracte, StylesClothe.minimaliste, StylesClothe.elegant],
        morphologyFit: [MorphologyName.h, MorphologyName.a, MorphologyName.v],
        womenOrMensWear: .homme
    ),

    Clothe(
        name: "Pantalon chino Octobre",
        brand: BrandName.sezane,
        price: 110.00,
        image: "pantalon_chino_sezane",
        description: "Chino en coton bio, coupe droite, élégant et confortable pour homme.",
        material: "100% coton bio",
        tags: [ Tag.qualite],
        type: TypeClothe.bas,
        style: [StylesClothe.elegant, StylesClothe.decontracte, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.v, MorphologyName.x, MorphologyName.o],
        womenOrMensWear: .homme
    ),

    Clothe(
        name: "T-shirt col rond Octobre",
        brand: BrandName.sezane,
        price: 55.00,
        image: "tshirt_col_rond_sezane",
        description: "T-shirt en coton biologique, coupe droite et confortable pour homme.",
        material: "100% coton bio",
        tags: [ Tag.qualite],
        type: TypeClothe.haut,
        style: [StylesClothe.decontracte, StylesClothe.streetwear, StylesClothe.minimaliste],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.v],
        womenOrMensWear: .homme
    ),
    Clothe(
        name: "Pull col rond mérinos",
        brand: BrandName.hopaal,
        price: 130.00,
        image: "pull_merinos_hopaal",
        description: "Pull en laine mérinos respirant et chaud, fabriqué en Europe de manière responsable.",
        material: "Laine mérinos",
        tags: [ Tag.qualite],
        type: TypeClothe.haut,
        style: [StylesClothe.minimaliste, StylesClothe.decontracte, StylesClothe.elegant],
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.x],
        womenOrMensWear: .homme
    ),

    Clothe(
        name: "Chemise lin casual",
        brand: BrandName.sezane,
        price: 95.00,
        image: "chemise_lin_sezane",
        description: "Chemise en lin léger, coupe droite, style casual et confortable.",
        material: "100% lin",
        tags: [ Tag.bio],
        type: TypeClothe.haut,
        style: [StylesClothe.decontracte, StylesClothe.minimaliste, StylesClothe.elegant],
        morphologyFit: [MorphologyName.a, MorphologyName.h, MorphologyName.v],
        womenOrMensWear: .unisex
    ),

    Clothe(
        name: "Jean Bootcut 202N Evasé",
        brand: BrandName.milleQuatreVingTrois,
        price: 129.00,
        image: "jean_bootcut_202N_evase_1083",
        description: "Ses jambes évasées en font le jeans parfait pour allonger votre silhouette quelle que soit votre morphologie.",
        material: "99% coton bio",
        tags: [ Tag.qualite],
        type: TypeClothe.bas,
        style: [StylesClothe.decontracte, StylesClothe.elegant, StylesClothe.rock],
        morphologyFit: [MorphologyName.v, MorphologyName.x, MorphologyName.o],
        womenOrMensWear: .femme
    ),
    Clothe(
        name: "Sweat-shirt Hauteville",
        brand: BrandName.balzac,
        price: 95.00,
        image: "sweat_hauteville_balzac",
        description: "Sweat gris clair chiné, coupe droite, basique et intemporel.",
        material: "Coton bio",
        tags: [ Tag.qualite, Tag.local],
        type: TypeClothe.haut,
        style: [StylesClothe.decontracte, StylesClothe.streetwear, StylesClothe.minimaliste], // 3 styles
        morphologyFit: [MorphologyName.h, MorphologyName.o, MorphologyName.x],
        womenOrMensWear: .homme
    ),

    Clothe(
        name: "Chemise Paradis",
        brand: BrandName.balzac,
        price: 110.00,
        image: "chemise_paradis_balzac",
        description: "Chemise en coton bio avec coupe ajustée, idéale pour un look casual elegant.",
        material: "100% coton bio",
        tags: [ Tag.qualite],
        type: TypeClothe.haut,
        style: [StylesClothe.minimaliste, StylesClothe.elegant, StylesClothe.decontracte], // 3 styles
        morphologyFit: [MorphologyName.a, MorphologyName.h, MorphologyName.v],
        womenOrMensWear: .homme
    ),

    Clothe(
        name: "Veste outdoor recyclée",
        brand: BrandName.hopaal,
        price: 190.00,
        image: "veste_outdoor_hopaal",
        description: "Veste légère imperméable fabriquée à partir de polyester recyclé, idéale pour la mi-saison.",
        material: "Polyester recyclé",
        tags: [ Tag.transparence],
        type: TypeClothe.veste,
        style: [StylesClothe.sportwears, StylesClothe.decontracte, StylesClothe.streetwear], // 3 styles
        morphologyFit: [MorphologyName.v, MorphologyName.x, MorphologyName.o],
        womenOrMensWear: .homme
    ),

    Clothe(
        name: "Sneakers Campo",
        brand: BrandName.veja,
        price: 140.00,
        image: "veja_campo2",
        description: "Sneakers blanches minimalistes avec détails noirs, fabriquées en cuir écologique.",
        material: "Cuir écoresponsable et caoutchouc sauvage",
        tags: [ Tag.qualite, Tag.local, Tag.transparence],
        type: TypeClothe.chaussures,
        style: [StylesClothe.minimaliste, StylesClothe.streetwear, StylesClothe.sportwears, StylesClothe.rock], // 4 styles
        morphologyFit: [MorphologyName.a, MorphologyName.v, MorphologyName.h, MorphologyName.o, MorphologyName.x],
        womenOrMensWear: .unisex
    ),
    Clothe(
        name: "Le short confort hommes ou mixte en coton bio",
        brand: BrandName.cotonVert,
        price: 50.00,
        image: "short_confort_hm_cb",
        description: "Tout doux, fluide et solide. Parfait pour être porté en toutes occasions.",
        material: "100% coton bio",
        tags: [Tag.qualite, Tag.bio],
        type: TypeClothe.bas,
        style: [StylesClothe.decontracte, StylesClothe.sportwears, StylesClothe.streetwear], // 3 styles
        morphologyFit: [MorphologyName.a, MorphologyName.h, MorphologyName.v], // élargi à 3 morphologies
        womenOrMensWear: .unisex
    ),

    Clothe(
        name: "Le polo français mixte en coton bio",
        brand: BrandName.cotonVert,
        price: 49.00,
        image: "polo_hm_cb",
        description: "Confortable, bien coupé et solide. Un intemporel à porter en toutes saisons et que vous garderez un bon paquet d'années.",
        material: "100% coton bio",
        tags: [Tag.qualite, Tag.bio],
        type: TypeClothe.haut,
        style: [StylesClothe.sportwears, StylesClothe.decontracte, StylesClothe.elegant], // 3 styles
        morphologyFit: [MorphologyName.a, MorphologyName.o, MorphologyName.x], // élargi à 3 morphologies
        womenOrMensWear: .unisex
    )
    
]


var brands: [Brand] = [

    Brand(
        name: BrandName.milleQuatreVingTrois,
        logo: "1083_logo",
        description: "Jeans & sneakers made in France, coton bio/recyclé et production locale",
        tags: [Tag.local,Tag.grandeTaille],
        link: "https://1083.fr"
    ),
    Brand(
        name: BrandName.cotonVert,
        logo: "cotonvert_logo",
        description: "Basics en coton bio, simples, durables et accessibles",
        tags: [Tag.justePrix, Tag.grandeTaille],
        link: "https://cotonvert.com"
    ),
    Brand(
        name: BrandName.petiteAndSoWhat,
        logo: "petiteandso_logo",
        description: "Mode pour petites tailles, coupes adaptatives et modèles durables",
        tags: [Tag.petiteTaille],
        link: "https://www.petiteandsowhat.com/"
    ),
    Brand(
        name: BrandName.balzac,
        logo: "balzac_logo",
        description: "Casual elegant éthique, en coton bio et fabrication responsable",
        tags: [ Tag.justePrix],
        link: "https://balzac-paris.fr"
    ),
    Brand(
        name: BrandName.ekyog,
        logo: "ekyog_logo",
        description: "Mode féminine durable en coton bio, lin et fibres éthiques",
        tags: [Tag.bio, Tag.qualite],
        link: "https://ekyog.com"
    ),
    Brand(
        name: BrandName.sezane,
        logo: "sezane_logo",
        description: "Mode élégante et responsable avec des matériaux de qualité et séries limitées",
        tags: [Tag.qualite],
        link: "https://sezane.com"
    ),
    
    Brand(
        name: BrandName.lesRecuperables,
        logo: "lesrecuperables_logo",
        description: "Upcycling textile, vêtements usagés transformés en pièces uniques",
        tags: [Tag.upcycler, Tag.friperie],
        link: "https://www.facebook.com/share/1YiuYpCfff/?mibextid=wwXIfr"
    ),
    Brand(
        name: BrandName.makeMyLimonade,
        logo: "limonade_logo",
        description: "Mode créative, colorée, pièces ludiques et féminines, durables",
        tags: [ Tag.bio],
        link: "https://makemylemonade.com"
    ),
    Brand(
        name: BrandName.hopaal,
        logo: "hopaal_logo",
        description: "Marque française, vêtements éco-conçus et durables",
        tags: [Tag.upcycler, Tag.transparence],
        link: "https://www.instagram.com/hopaal.sw?igsh=dGVzbW5lNmN2ZWxk"
    ),
   
    Brand(
        name: BrandName.lesPetitesAmbitieuses,
        logo: "les_petites_ambitieuses_logo",
        description: "Mode petites tailles, confortable, adaptable et durable",
        tags: [Tag.petiteTaille],
        link: "https://www.instagram.com/lespetitesambitieuses?igsh=M3Q4eGJlMzZjMnVz"
    ),
   
    Brand(
        name: BrandName.carrousselClothing,
        logo: "carroussel_logo",
        description: "Accessoires recyclés, ceintures et sacs à partir de textiles revalorisés",
        tags: [Tag.upcycler],
        link: "https://carrouselfrance.com/"
    ),
    Brand(
        name: BrandName.downOnTheCorner,
        logo: "downtown_logo",
        description: "Mode urbaine, chaussures et sacs en cuir et textiles upcyclés",
        tags: [Tag.upcycler, Tag.qualite],
        link: "https://www.instagram.com/downonzecorner?igsh=MW5xa3U0eWowNmFqZQ=="
    ),
    Brand(
        name: BrandName.doYouGreen,
        logo: "doyougreen_logo",
        description: "Lingerie éco-conçue, sous-vêtements bio et recyclés, fabriqués en France",
        tags: [Tag.bio, Tag.local],
        link: "https://doyougreen.com"
    ),
    Brand(
        name: BrandName.atelierGConstantini,
        logo: "gaelleconstantini_logo",
        description: "Mode durable, vêtements et accessoires eco-design en matières recyclées",
        tags: [Tag.upcycler,Tag.qualite],
        link: "https://gaelleconstantini.com"
    ),
    Brand(
        name: BrandName.veja,
        logo: "veja",
        description: "Baskets éthiques, production respectueuse et logistique sociale",
        tags: [ Tag.petiteTaille],
        link: "https://www.veja-store.com/fr_fr/search?q=Sneakers+Veja+Rio+Branco&search-button="
    )
]

var facts: [String] = [
    "500 000 tonnes de microfibres plastiques finissent chaque année dans les océans à cause du lavage des vêtements synthétiques.",
    "La fast fashion produit environ 100 milliards de vêtements chaque année… alors qu’il y a « seulement » 8 milliards d’humains.",
    "92 millions de tonnes de déchets textiles sont produites chaque année, soit l'équivalent d'un camion poubelle rempli de vêtements jetés chaque seconde.",
    "35 % des microplastiques présents dans les océans proviennent des textiles synthétiques, principalement lors du lavage des vêtements.",
    "Chaque année, entre 200 000 et 500 000 tonnes de microplastiques issus des textiles pénètrent dans l'environnement marin.",
    "70 % des microplastiques océaniques sont issus de textiles, de vêtements et d'équipements de pêche.",
    "Environ 8 % des microplastiques européens relâchés dans les océans proviennent des textiles synthétiques.",
    "La production de coton nécessite environ 2 000 gallons d'eau pour fabriquer un seul jean.",
    "L'industrie de la mode rapide est responsable de 10 % des émissions mondiales de CO₂, plus que les émissions combinées de tous les vols internationaux et du transport maritime.",
    "Les émissions de méthane liées à la mode, principalement dues au cuir et à la laine, représentent 75 % des émissions de méthane du secteur textile.",
    "En 2021, l'industrie de la mode a émis environ 897 millions de tonnes de CO₂, et ces émissions pourraient atteindre 1,3 milliard de tonnes d'ici 2030 sans mesures significatives.",
    "Environ 85 % des textiles mondiaux finissent en décharge ou sont incinérés chaque année.",
    "La production de vêtements utilise environ 141 milliards de mètres cubes d'eau chaque année.",
    "Le lavage des vêtements synthétiques libère des microfibres plastiques qui finissent dans les océans, affectant la faune marine.",
    "L'industrie de la mode rapide est responsable de 20 % de la pollution industrielle de l'eau dans le monde.",
    "La production de vêtements utilise environ 79 trillions de litres d'eau par an.",
    "Les microplastiques présents dans les océans proviennent principalement de la dégradation de plastiques plus gros, dont une grande partie provient des textiles.",
    "La mode rapide contribue à l'épuisement des ressources naturelles et à la pollution de l'environnement.",
    "Les vêtements en fibres synthétiques sont largement utilisés dans la mode rapide, mais leur dégradation lente contribue à la pollution plastique.",
    "La production de vêtements est souvent associée à des conditions de travail précaires et à des impacts environnementaux négatifs."
]
var shortfacts: [String] = [
    "La mode est le 2ᵉ plus gros pollueur mondial après le pétrole.",
    "Un t-shirt en coton consomme environ 2 700 litres d’eau.",
    "Les fibres synthétiques mettent jusqu’à 200 ans à se décomposer.",
    "1 vêtement sur 2 produit par la fast fashion n’est jamais porté plus de 7 fois.",
    "La mode génère plus de CO₂ que l’aviation et le maritime combinés.",
    "Chaque seconde, un camion de vêtements est jeté dans le monde.",
    "Les teintures textiles causent 20 % de la pollution de l’eau douce.",
    "300 millions de personnes travaillent dans l’industrie textile, souvent dans des conditions précaires.",
    "La production de polyester consomme 70 millions de barils de pétrole par an.",
    "Moins de 1 % des vêtements sont réellement recyclés en nouveaux textiles.",
    "La mode = 10 % des émissions mondiales.",
    "Un jean = 7 500 litres d’eau.",
    "70 % des vêtements finissent en décharge.",
    "Les vêtements synthétiques = plastique caché.",
    "2ᵉ industrie la plus polluante au monde.",
    "Les fibres textiles = 35 % des microplastiques.",
    "Moins de 1 % des habits recyclés.",
    "La fast fashion = surproduction massive.",
    "Le polyester = dérivé du pétrole.",
    "20 % de l’eau polluée vient de la teinture textile."
    ]
var ecoFriendlyTips = [
    "Privilégiez les vêtements en fibres naturelles ou recyclées pour réduire votre impact environnemental.",
    "Achetez moins mais mieux : choisissez des pièces intemporelles et de qualité.",
    "Lavez vos vêtements à basse température et moins fréquemment pour économiser l’eau et l’énergie.",
    "Réparez vos vêtements plutôt que de les jeter pour prolonger leur durée de vie.",
    "Optez pour des marques locales et transparentes sur leur production.",
    "Achetez en seconde main ou participez aux friperies pour réduire la demande de fast fashion.",
    "Évitez les vêtements trop synthétiques qui libèrent des microplastiques au lavage.",
    "Organisez des échanges de vêtements avec vos amis ou votre communauté.",
    "Privilégiez les collections capsule et les éditions limitées pour une consommation raisonnée.",
    "Recyclez ou donnez vos anciens vêtements plutôt que de les jeter à la poubelle."
]

var fashionTipsBodyShapeA = [
    // Morphologie en A (hanches plus larges que les épaules)
    "Pour votre morphologie en triangle, privilégiez les hauts avec des détails sur les épaules pour équilibrer la silhouette.",
    "Pour votre morphologie en triangle, optez pour des jupes évasées ou des pantalons droits pour harmoniser le bas du corps.",
    "Pour votre morphologie en triangle, choisissez des motifs ou des couleurs vives pour le haut afin d’attirer l’attention vers le buste.",
    "Pour votre morphologie en triangle, évitez les pantalons ou jupes avec trop de volume à la taille ou sur les hanches.",
    ]
var fashionTipsBodyShapeV = [
    // Morphologie en V (épaules plus larges que les hanches)
    "Pour votre morphologie en triangle inversé, misez sur des bas évasés pour adoucir la largeur des épaules.",
    "Pour votre morphologie en triangle inversé, préférez des hauts simples et unis pour ne pas accentuer la partie supérieure.",
    "Pour votre morphologie en triangle inversé, les pantalons ou jupes à motifs ou avec des détails en bas sont vos alliés.",
    "Pour votre morphologie en triangle inversé, évitez les épaulettes ou tops très structurés qui élargissent encore les épaules.",
    ]
var fashionTipsBodyShapeH = [
    // Morphologie en H (épaules et hanches alignées, peu de taille marquée)
    "Pour votre morphologie en réctangle, créez des volumes avec des ceintures et des vêtements ajustés à la taille.",
    "Pour votre morphologie en réctangle, privilégiez les robes cintrées ou les tops à nouer pour suggérer une taille marquée.",
    "Pour votre morphologie en réctangle, les jupes ou pantalons évasés ajoutent du volume et équilibrent la silhouette.",
    "Pour votre morphologie en réctangle, évitez les vêtements droits ou trop larges qui accentuent la ligne rectangulaire du corps.",
    ]
var fashionTipsBodyShapeO = [
    // Morphologie en O (ronde, buste et ventre plus marqués)
    "Pour votre morphologie ovale, optez pour des vêtements fluides qui suivent les lignes du corps sans les serrer.",
    "Pour votre morphologie ovale, les décolletés en V ou les vestes ouvertes allongent la silhouette.",
    "Pour votre morphologie ovale, privilégiez les pantalons droits ou légèrement évasés pour structurer le bas du corps.",
    "Pour votre morphologie ovale, évitez les tissus trop épais ou rigides qui ajoutent du volume inutile.",
    ]
var fashionTipsBodyShapeX = [
    // Morphologie en X (taille marquée, épaules et hanches proportionnées)
    "Pour votre morphologie en sablié, accentuez la taille avec des ceintures et des robes cintrées.",
    "Pour votre morphologie en sablié, les tops ajustés et les jupes ou pantalons taille haute mettent en valeur vos courbes.",
    "Pour votre morphologie en sablié, les robes portefeuille ou les vêtements drapés sont idéaux pour souligner la silhouette.",
    "Pour votre morphologie en sablié, évitez les vêtements trop amples qui cachent vos lignes naturelles."
]

var faqs: [FAQ] = [
    
    FAQ(
        question: "🌍Qu'est-ce que la mode éco-responsable ?",
        answer: "Produire dans de bonnes conditions, et de façon raisonnée pour éviter la surproduction, tout en utilisant des matières durables à faible impact environnemental."
        
    ),
    FAQ(
        question: "⚡️Qu'est-ce que la fast fashion et quel est son impact environnemental ?",
        answer: "C'est un mouvement qui désigne la production rapide et à bas coût de vêtements inspirés des tendances. Son impact environnemental est considérable : surproduction, gaspillage, forte consommation d’eau, usage massif de produits chimiques et émissions de CO₂ liées au transport."
    ),
    
    FAQ(
        question: "🐢Qu’est-ce que la slow fashion ?",
        answer: "C’est un mouvement qui encourage l’achat de vêtements durables, de qualité, produits de manière éthique et consommés de façon réfléchie."
    ),
    FAQ(
        question: "🔎Comment savoir si un vêtement est réellement éco-responsable ?",
        answer: "Vérifiez les certifications, labels et informations sur la provenance des matériaux et le processus de fabrication."
    ),
    FAQ(
        question: "✅ Quels sont les certifications et labels éco-responsables dans la mode ?",
        answer: "Parmi les plus connus : GOTS garantit l’origine biologique des fibres et un processus respectueux de l’environnement et des conditions sociales,Oeko-Tex Standard 100 certifie l’absence de substances nocives dans les textiles,Lenzing® Ecovero® attestent d’une pulpe de bois provenant de sources certifiées écoresponsables et contrôlées via un procédé de fabrication totalement traçable,et Fair Trade / Commerce Équitable : assure de meilleures conditions de travail et une rémunération juste"
    ),
    
    FAQ(
        question: "♻️Comment réduire l’impact environnemental de ma garde-robe ?",
        answer: "Achetez moins mais mieux, privilégiez les marques durables. Réparez ou transformez vos vêtements (upcycling), donnez-les à des associations, vendez-les d’occasion ou recyclez-les via des points de collecte textiles."),

    FAQ(
        question: "🧵Pourquoi privilégier les vêtements en matières recyclées ?",
        answer: "Ils réduisent la consommation de ressources naturelles, limitent les déchets textiles et diminuent l’empreinte écologique."
    ),
    FAQ(
        question: "🇫🇷Quels sont les bénéfices d’acheter local et made in France ?",
        answer: "Cela favorise l’économie locale, réduit l’empreinte carbone liée au transport et garantit souvent une meilleure qualité et traçabilité."
    ),
    
    FAQ(
        question: "👖Comment entretenir un jean en coton bio ?",
        answer: "Lavez-le à l'envers à basse température, évitez le sèche-linge pour préserver la couleur et les fibres et utilisez des lessives écologiques."
        
    ),
    
    FAQ(
        question: "⏳Comment identifier les pièces intemporelles ?",
        answer: "Ce sont des vêtements aux coupes classiques, aux couleurs neutres et de qualité, qui restent élégants au fil des saisons."),
    
    FAQ(
        question: "🧣Quels accessoires choisir selon ma morphologie ?",
        answer: "Par exemple, des ceintures fines pour marquer la taille, des colliers longs pour allonger la silhouette ou des boucles d’oreilles proportionnées au visage."
        
    ),
    FAQ(
        question: "📐Comment ajuster une tenue à ma silhouette ?",
        answer: "Choisissez des coupes qui équilibrent votre morphologie et mettez en valeur vos atouts, par exemple une taille cintrée pour un effet sablier."
    ),
    FAQ(
        question: "🎨Comment associer des couleurs pour un look harmonieux ?",
        answer: "Privilégiez des combinaisons de 2 à 3 couleurs complémentaires ou neutres pour un rendu équilibré."
        
        
    )
]

// Remplace les coordonnées de chaque Shop par CLLocationCoordinate2D
var shopsEcoLille: [Shop] = [
    Shop(
        name: "el MARKET",
        logo: "elmarket_logo",
        adress: "128 rue Gambetta, 59000 Lille",
        coordinates: CLLocationCoordinate2D(latitude: 50.6269, longitude: 3.0466),
        openingHours: ["Lundi-Samedi: 10h-19h", "Dimanche: fermé"],
        tags: [ Tag.local, .madeInFrance, .qualite, .upcycler, .transparence],
        goodToKnow: ["Concept store éco-conçu", "Mode, maison, enfant", "Selection d’articles zéro-déchet"]
    ),
    Shop(
        name: "el MARKET – Vieux Lille",
        logo: "elmarket_logo",
        adress: "89 rue de la Monnaie, 59000 Lille",
        coordinates: CLLocationCoordinate2D(latitude: 50.6415, longitude: 3.0617),
        openingHours: ["Lundi: 11h-19h", "Mardi-Samedi: 10h-19h", "Dimanche: fermé"],
        tags: [ Tag.local, .qualite, .madeInFrance, .transparence],
        goodToKnow: ["Petite sœur du concept store de Wazemmes", "Boutique lumineuse", "Mode, décoration, accessoires"]
    ),
    Shop(
        name: "Faguo – Boutique Lille",
        logo: "faguo_logo",
        adress: "16 place des Patiniers, 59800 Lille",
        coordinates: CLLocationCoordinate2D(latitude: 50.6396, longitude: 3.0595),
        openingHours: ["Lundi-Samedi: 10h-19h", "Dimanche: fermé ou horaires réduits"],
        tags: [ Tag.local, .transparence, .qualite],
        goodToKnow: ["Marque engagée", "Chaque achat plante un arbre", "Vêtements & accessoires homme/femme"]
    ),
    Shop(
        name: "Coco Friendly",
        logo: "cocofriendly_logo",
        adress: "9 rue de la Vieille Comédie, 59800 Lille",
        coordinates: CLLocationCoordinate2D(latitude: 50.6384, longitude: 3.0632),
        openingHours: ["Lundi-Samedi: 11h-19h", "Dimanche: fermé"],
        tags: [ .transparence, .madeInFrance, Tag.local, .qualite],
        goodToKnow: ["Boutique de mode éthique femme", "Sélection de marques engagées", "Bijoux, accessoires inclus"]
    ),
    Shop(
        name: "Slowmod",
        logo: "slowmod_logo",
        adress: "63 rue Pierre Mauroy, 59800 Lille",
        coordinates: CLLocationCoordinate2D(latitude: 50.6347, longitude: 3.0665),
        openingHours: ["Mardi-Samedi: 11h-18h", "Dimanche-Lundi: fermé"],
        tags: [.friperie,  .qualite, .justePrix, .transparence],
        goodToKnow: ["Vêtements seconde main", "Soigneusement sélectionnés", "Atmosphère vintage / rétro"]
    ),
    Shop(
        name: "Nénés Paris",
        logo: "nenesparis_logo",
        adress: "12 rue Basse, 59800 Lille",
        coordinates: CLLocationCoordinate2D(latitude: 50.6416, longitude: 3.0611),
        openingHours: ["Mardi-Samedi: 11h-19h", "Lundi & Dimanche: fermé"],
        tags: [ .transparence, .bio, .qualite],
        goodToKnow: ["Lingerie éco-conçue", "Matières recyclées ou naturelles"]
    ),
    Shop(
        name: "Balt.e",
        logo: "balte_logo",
        adress: "161 rue Jean Jaurès, 59491 Villeneuve-d’Ascq",
        coordinates: CLLocationCoordinate2D(latitude: 50.6161, longitude: 3.1385),
        openingHours: ["Lundi-Samedi: 10h-19h", "Dimanche: fermé"],
        tags: [ Tag.local, .transparence, .justePrix, .qualite],
        goodToKnow: ["Produits pour maison, déco, accessoires durables", "Made in France privilégié"]),
    Shop(
        name: "La Cabane d’Antoine",
        logo: "cabaneantoine_logo",
        adress: "69 rue Abbé Desplanques, 59130 Lambersart",
        coordinates: CLLocationCoordinate2D(latitude: 50.6501, longitude: 3.0207),
        openingHours: ["Mardi-Samedi: 10h-18h", "Lundi & Dimanche: fermé"],
        tags: [ Tag.local, .qualite, .bio],
        goodToKnow: ["Concept store familial", "Jeux & jouets en bois, accessoires zéro-déchet"]
    ),
    Shop(
        name: "Ding Fring (Le Relais)",
        logo: "dingfring_logo",
        adress: "8 Rue Saint-Pierre Saint-Paul, Lille",
        coordinates: CLLocationCoordinate2D(latitude: 50.6368, longitude: 3.0619),
        openingHours: ["Lundi-Samedi: 10h-12h30, 14h-19h","Dimanche: 9h30-13h30"],
        tags: [.friperie,  Tag.local],
        goodToKnow: ["Téléphone: 03 28 07 32 81", "Boutique du réseau Le Relais — vêtements seconde main"]
    ),
    Shop(
            name: "Make My Lemonade",
            logo: "limonade_logo",
            adress: "11-13 place Louise de Bettignies, 59000 Lille",
            coordinates: CLLocationCoordinate2D(latitude: 50.64105, longitude: 3.0648854),
            openingHours: ["Lundi-Samedi: 10h-19h", "Dimanche: fermé"],
            tags: [Tag.local, .qualite, .transparence],
            goodToKnow: ["Ligne DIY avec patrons de couture", "Grandes tailles disponibles jusqu'au 52"]
        ),
        
        Shop(
            name: "Balzac Paris",
            logo: "balzac_logo",
            adress: "16 rue des Chats Bossus, 59000 Lille",
            coordinates: CLLocationCoordinate2D(latitude: 50.639640, longitude: 3.064100),
            openingHours: ["Lundi-Samedi: 10h-19h", "Dimanche: fermé"],
            tags: [Tag.local, .friperie, .qualite, .transparence],
            goodToKnow: ["Collections limitées pour éviter la surproduction", "Boutique de mode éthique femme"]
        ),
        
        Shop(
            name: "FRIP'UP",
            logo: "frip_up_logo",
            adress: "79 Rue Léon Gambetta, 59000 Lille",
            coordinates: CLLocationCoordinate2D(latitude: 50.63163, longitude: 3.05980),
            openingHours: ["Lundi-Samedi: 11h-19h", "Dimanche: fermé"],
            tags: [Tag.local, .friperie],
            goodToKnow: ["Vêtements seconde main", "Accessible aux personnes à mobilité réduite"]
        ),
    Shop(
            name: "Chez Henry Lille - Croix-Rouge française",
            logo: "chez_henri_logo",
            adress: "158 Rue Léon Gambetta, 59000 Lille",
            coordinates: CLLocationCoordinate2D(latitude: 50.631587, longitude: 3.059782),
            openingHours: ["Mercredi: 14h-18h", "Jeudi-Samedi: 10h-18h30", "Dimanche, lundi, mardi: fermé"],
            tags: [Tag.local, .friperie],
            goodToKnow: ["Téléphone: 03 20 16 98 60", "Vêtements seconde main"]
        ),
    Shop(
            name: "Boutique solidaire aux carrés",
            logo: "boutique_solidaire_au_carre_logo",
            adress: "210 rue d'Arras, 59000 Lille",
            coordinates: CLLocationCoordinate2D(latitude: 50.61780, longitude: 3.06220),
            openingHours: ["Lundi-Jeudi: 14h-18h", "Vendredi-Dimanche: fermé"],
            tags: [Tag.local, .friperie],
            goodToKnow: ["Téléphone: 07 44 40 88 31", "Vêtements seconde main", "Petits prix"]
        ),
    Shop(
            name: "Les Djadjas",
            logo: "les_djadjas_logo",
            adress: "255 Rue de la Barre, 59000 Lille",
            coordinates: CLLocationCoordinate2D(latitude: 50.63853, longitude: 3.05566),
            openingHours: ["Mercredi-Samedi: 14h-19h", "Dimanche-Mardi: fermé"],
            tags: [Tag.local, .friperie],
            goodToKnow: ["Téléphone: 07 71 76 66 38", "Vêtements seconde main", "Projets DIY", "Ateliers collaboratifs"]
        ),

]


var styles: [Styles] = [
    Styles(name: .elegant, image:["f_elegant","h_elegant"]),
    Styles(name: .boheme, image: ["f_boheme", "h_boheme"]),
    Styles(name: .decontracte, image: ["f_decontracte", "h_decontracte"]),
    Styles(name: .minimaliste, image: ["f_minimalist", "h_minimalist"]),
    Styles(name: .preppy, image: ["f_preppy", "h_preppy"]),
    Styles(name: .rock, image: ["f_rock", "h_rock"]),
    Styles(name: .sophistique, image: ["f_sophistique", "h_sophistique"]),
    Styles(name: .sportwears, image: ["f_sport", "h_sport"]),
    Styles(name: .streetwear, image: ["f_streetwear", "h_streetwear"])
]

var morphologys: [Morphology] = [
    Morphology(name: MorphologyName.o, image: ["f_o","h_o"]),
    Morphology(name: MorphologyName.a, image: ["f_a", "h_a"]),
    Morphology(name: MorphologyName.h, image: ["f_h", "h_h"]),
    Morphology(name: MorphologyName.v, image: ["f_v", "h_v"]),
    Morphology(name: MorphologyName.x, image: ["f_x", "h_x"])

]

