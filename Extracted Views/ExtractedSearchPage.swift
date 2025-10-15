import SwiftUI




struct ExtractedSearchPage: View {
    let brand: Brand
    let fact: String
    
    var body: some View {
        VStack(spacing: 1) {
            if let url = URL(string: brand.link) {
                Link(destination: url) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.almostWhite)
                        HStack {
                            Image(brand.logo)
                                .resizable()
                                .frame(width: 140, height: 140)
                                .cornerRadius(8)
                                .padding(8)
                                .scaledToFill()
                            VStack {
                                HStack {
                                    VStack(alignment: .leading, spacing: 4){
                                        Text(brand.name.rawValue)
                                            .gupterFont(size: 22)
                                            .padding(.bottom, 4)
                                        HStack {
                                            ForEach(brand.tags, id: \.self) { tag in
                                                Text(tag.rawValue)
                                                    .SFProFont(weight: .mediumTerra, size: 13)
                                                    .textCase(.uppercase)
                                                    .lineLimit(1)
                                                    .padding(4)
                                                    .background(.terra.opacity(0.2))
                                                    .cornerRadius(4)
                                            }
                                        }
                                        Text(brand.description)
                                            .SFProFont(weight: .regular, size: 14)
                                            .multilineTextAlignment(.leading)
                                    }
                                    .padding(.vertical, 8)
                                    Spacer()
                                }
                                Spacer()
                            }
                            .padding(8)
                        }
                    }
                }
                .buttonStyle(.plain)
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
            }

            HStack {
                Text(fact)
                    .gupterFont(size: 22)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    ScrollView {
        VStack {
            ForEach(brands) { brand in
                ExtractedSearchPage(brand: brand, fact: facts[0])
            }
        }
    }
}
