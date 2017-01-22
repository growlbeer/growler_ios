//  This file was automatically generated and should not be edited.

import Apollo

public final class BeersQuery: GraphQLQuery {
  public static let operationDefinition =
    "query Beers {" +
    "  beers {" +
    "    ...BeerDetails" +
    "  }" +
    "}"
  public static let queryDocument = operationDefinition.appending(BeerDetails.fragmentDefinition)
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

public struct BeerDetails: GraphQLNamedFragment {
  public static let fragmentDefinition =
    "fragment BeerDetails on Beer {" +
    "  id" +
    "  name" +
    "  description" +
    "}"

  public static let possibleTypes = ["Beer"]

  public let __typename = "Beer"
  public let id: GraphQLID
  public let name: String?
  public let description: String?

  public init(reader: GraphQLResultReader) throws {
    id = try reader.value(for: Field(responseName: "id"))
    name = try reader.optionalValue(for: Field(responseName: "name"))
    description = try reader.optionalValue(for: Field(responseName: "description"))
  }
}