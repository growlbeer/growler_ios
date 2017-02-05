//  This file was automatically generated and should not be edited.

import Apollo

public final class BeerSearchQuery: GraphQLQuery {
  public static let operationDefinition =
    "query BeerSearch($q: String) {" +
    "  search(q: $q) {" +
    "    beers {" +
    "      id" +
    "      name" +
    "      description" +
    "      medium_image" +
    "      breweries {" +
    "        name" +
    "      }" +
    "    }" +
    "  }" +
    "}"

  public let q: String?

  public init(q: String? = nil) {
    self.q = q
  }

  public var variables: GraphQLMap? {
    return ["q": q]
  }

  public struct Data: GraphQLMappable {
    public let search: Search?

    public init(reader: GraphQLResultReader) throws {
      search = try reader.optionalValue(for: Field(responseName: "search"))
    }

    public struct Search: GraphQLMappable {
      public let __typename = "Search"
      public let beers: [Beer?]?

      public init(reader: GraphQLResultReader) throws {
        beers = try reader.optionalList(for: Field(responseName: "beers"))
      }

      public struct Beer: GraphQLMappable {
        public let __typename = "Beer"
        public let id: GraphQLID
        public let name: String?
        public let description: String?
        public let mediumImage: String?
        public let breweries: [Brewery?]?

        public init(reader: GraphQLResultReader) throws {
          id = try reader.value(for: Field(responseName: "id"))
          name = try reader.optionalValue(for: Field(responseName: "name"))
          description = try reader.optionalValue(for: Field(responseName: "description"))
          mediumImage = try reader.optionalValue(for: Field(responseName: "medium_image"))
          breweries = try reader.optionalList(for: Field(responseName: "breweries"))
        }

        public struct Brewery: GraphQLMappable {
          public let __typename = "Brewery"
          public let name: String?

          public init(reader: GraphQLResultReader) throws {
            name = try reader.optionalValue(for: Field(responseName: "name"))
          }
        }
      }
    }
  }
}

public final class CellarQuery: GraphQLQuery {
  public static let operationDefinition =
    "query Cellar {" +
    "  beers {" +
    "    ...BeerDetails" +
    "  }" +
    "}"
  public static let queryDocument = operationDefinition.appending(BeerDetails.fragmentDefinition).appending(BreweryDetails.fragmentDefinition)
  public init() {
  }

  public struct Data: GraphQLMappable {
    public let beers: [Beer?]

    public init(reader: GraphQLResultReader) throws {
      beers = try reader.list(for: Field(responseName: "beers"))
    }

    public struct Beer: GraphQLMappable {
      public let __typename = "Beer"

      public let fragments: Fragments

      public init(reader: GraphQLResultReader) throws {
        let beerDetails = try BeerDetails(reader: reader)
        fragments = Fragments(beerDetails: beerDetails)
      }

      public struct Fragments {
        public let beerDetails: BeerDetails
      }
    }
  }
}

public final class TradesQuery: GraphQLQuery {
  public static let operationDefinition =
    "query Trades {" +
    "  trades {" +
    "    id" +
    "    state" +
    "    offers {" +
    "      id" +
    "      beers {" +
    "        id" +
    "        name" +
    "        medium_image" +
    "      }" +
    "      user {" +
    "        id" +
    "        email" +
    "        first_name" +
    "      }" +
    "    }" +
    "  }" +
    "}"
  public init() {
  }

  public struct Data: GraphQLMappable {
    public let trades: [Trade?]

    public init(reader: GraphQLResultReader) throws {
      trades = try reader.list(for: Field(responseName: "trades"))
    }

    public struct Trade: GraphQLMappable {
      public let __typename = "Trade"
      public let id: GraphQLID
      public let state: String?
      public let offers: [Offer?]?

      public init(reader: GraphQLResultReader) throws {
        id = try reader.value(for: Field(responseName: "id"))
        state = try reader.optionalValue(for: Field(responseName: "state"))
        offers = try reader.optionalList(for: Field(responseName: "offers"))
      }

      public struct Offer: GraphQLMappable {
        public let __typename = "Offer"
        public let id: GraphQLID
        public let beers: [Beer?]?
        public let user: User?

        public init(reader: GraphQLResultReader) throws {
          id = try reader.value(for: Field(responseName: "id"))
          beers = try reader.optionalList(for: Field(responseName: "beers"))
          user = try reader.optionalValue(for: Field(responseName: "user"))
        }

        public struct Beer: GraphQLMappable {
          public let __typename = "Beer"
          public let id: GraphQLID
          public let name: String?
          public let mediumImage: String?

          public init(reader: GraphQLResultReader) throws {
            id = try reader.value(for: Field(responseName: "id"))
            name = try reader.optionalValue(for: Field(responseName: "name"))
            mediumImage = try reader.optionalValue(for: Field(responseName: "medium_image"))
          }
        }

        public struct User: GraphQLMappable {
          public let __typename = "User"
          public let id: GraphQLID
          public let email: String?
          public let firstName: String?

          public init(reader: GraphQLResultReader) throws {
            id = try reader.value(for: Field(responseName: "id"))
            email = try reader.optionalValue(for: Field(responseName: "email"))
            firstName = try reader.optionalValue(for: Field(responseName: "first_name"))
          }
        }
      }
    }
  }
}

public final class UserBeersQuery: GraphQLQuery {
  public static let operationDefinition =
    "query UserBeers($filter_type: String) {" +
    "  user_beers(filter_type: $filter_type) {" +
    "    user_id" +
    "    beer_id" +
    "    want" +
    "    trade" +
    "    have" +
    "    beer {" +
    "      ...BeerDetails" +
    "    }" +
    "  }" +
    "}"
  public static let queryDocument = operationDefinition.appending(BeerDetails.fragmentDefinition).appending(BreweryDetails.fragmentDefinition)

  public let filterType: String?

  public init(filterType: String? = nil) {
    self.filterType = filterType
  }

  public var variables: GraphQLMap? {
    return ["filter_type": filterType]
  }

  public struct Data: GraphQLMappable {
    public let userBeers: [UserBeer?]

    public init(reader: GraphQLResultReader) throws {
      userBeers = try reader.list(for: Field(responseName: "user_beers"))
    }

    public struct UserBeer: GraphQLMappable {
      public let __typename = "UserBeer"
      public let userId: Int
      public let beerId: Int
      public let want: Int?
      public let trade: Int?
      public let have: Int?
      public let beer: Beer?

      public init(reader: GraphQLResultReader) throws {
        userId = try reader.value(for: Field(responseName: "user_id"))
        beerId = try reader.value(for: Field(responseName: "beer_id"))
        want = try reader.optionalValue(for: Field(responseName: "want"))
        trade = try reader.optionalValue(for: Field(responseName: "trade"))
        have = try reader.optionalValue(for: Field(responseName: "have"))
        beer = try reader.optionalValue(for: Field(responseName: "beer"))
      }

      public struct Beer: GraphQLMappable {
        public let __typename = "Beer"

        public let fragments: Fragments

        public init(reader: GraphQLResultReader) throws {
          let beerDetails = try BeerDetails(reader: reader)
          fragments = Fragments(beerDetails: beerDetails)
        }

        public struct Fragments {
          public let beerDetails: BeerDetails
        }
      }
    }
  }
}

public final class WantedQuery: GraphQLQuery {
  public static let operationDefinition =
    "query Wanted {" +
    "  user_beers {" +
    "    user_id" +
    "    beer_id" +
    "    want" +
    "    trade" +
    "    have" +
    "    beer {" +
    "      id" +
    "      name" +
    "      description" +
    "      medium_image" +
    "      breweries {" +
    "        name" +
    "      }" +
    "    }" +
    "  }" +
    "}"
  public init() {
  }

  public struct Data: GraphQLMappable {
    public let userBeers: [UserBeer?]

    public init(reader: GraphQLResultReader) throws {
      userBeers = try reader.list(for: Field(responseName: "user_beers"))
    }

    public struct UserBeer: GraphQLMappable {
      public let __typename = "UserBeer"
      public let userId: Int
      public let beerId: Int
      public let want: Int?
      public let trade: Int?
      public let have: Int?
      public let beer: Beer?

      public init(reader: GraphQLResultReader) throws {
        userId = try reader.value(for: Field(responseName: "user_id"))
        beerId = try reader.value(for: Field(responseName: "beer_id"))
        want = try reader.optionalValue(for: Field(responseName: "want"))
        trade = try reader.optionalValue(for: Field(responseName: "trade"))
        have = try reader.optionalValue(for: Field(responseName: "have"))
        beer = try reader.optionalValue(for: Field(responseName: "beer"))
      }

      public struct Beer: GraphQLMappable {
        public let __typename = "Beer"
        public let id: GraphQLID
        public let name: String?
        public let description: String?
        public let mediumImage: String?
        public let breweries: [Brewery?]?

        public init(reader: GraphQLResultReader) throws {
          id = try reader.value(for: Field(responseName: "id"))
          name = try reader.optionalValue(for: Field(responseName: "name"))
          description = try reader.optionalValue(for: Field(responseName: "description"))
          mediumImage = try reader.optionalValue(for: Field(responseName: "medium_image"))
          breweries = try reader.optionalList(for: Field(responseName: "breweries"))
        }

        public struct Brewery: GraphQLMappable {
          public let __typename = "Brewery"
          public let name: String?

          public init(reader: GraphQLResultReader) throws {
            name = try reader.optionalValue(for: Field(responseName: "name"))
          }
        }
      }
    }
  }
}

public struct BreweryDetails: GraphQLNamedFragment {
  public static let fragmentDefinition =
    "fragment BreweryDetails on Brewery {" +
    "  id" +
    "  name" +
    "}"

  public static let possibleTypes = ["Brewery"]

  public let __typename = "Brewery"
  public let id: GraphQLID
  public let name: String?

  public init(reader: GraphQLResultReader) throws {
    id = try reader.value(for: Field(responseName: "id"))
    name = try reader.optionalValue(for: Field(responseName: "name"))
  }
}

public struct BeerDetails: GraphQLNamedFragment {
  public static let fragmentDefinition =
    "fragment BeerDetails on Beer {" +
    "  id" +
    "  name" +
    "  description" +
    "  medium_image" +
    "  breweries {" +
    "    ...BreweryDetails" +
    "  }" +
    "}"

  public static let possibleTypes = ["Beer"]

  public let __typename = "Beer"
  public let id: GraphQLID
  public let name: String?
  public let description: String?
  public let mediumImage: String?
  public let breweries: [Brewery?]?

  public init(reader: GraphQLResultReader) throws {
    id = try reader.value(for: Field(responseName: "id"))
    name = try reader.optionalValue(for: Field(responseName: "name"))
    description = try reader.optionalValue(for: Field(responseName: "description"))
    mediumImage = try reader.optionalValue(for: Field(responseName: "medium_image"))
    breweries = try reader.optionalList(for: Field(responseName: "breweries"))
  }

  public struct Brewery: GraphQLMappable {
    public let __typename = "Brewery"

    public let fragments: Fragments

    public init(reader: GraphQLResultReader) throws {
      let breweryDetails = try BreweryDetails(reader: reader)
      fragments = Fragments(breweryDetails: breweryDetails)
    }

    public struct Fragments {
      public let breweryDetails: BreweryDetails
    }
  }
}