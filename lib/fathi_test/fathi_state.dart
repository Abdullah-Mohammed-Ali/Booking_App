part of 'fathi_bloc.dart';

class FathiState extends Equatable {
  final Facilities facilities;
  final RequestState facilitiesState;
  final String facilitiesMessage;
  final SearchHotels searchHotels;
  final RequestState searchHotelsState;
  final String searchHotelsMessage;


  FathiState copyWith({
    Facilities? facilities,
    RequestState? facilitiesState,
    String? facilitiesMessage,
    SearchHotels? searchHotels,
    RequestState? searchHotelsState,
    String? searchHotelsMessage,
  }) {
    return FathiState(
      facilities: facilities ?? this.facilities,
      facilitiesState: facilitiesState ?? this.facilitiesState,
      facilitiesMessage: facilitiesMessage ?? this.facilitiesMessage,
      searchHotels: searchHotels ?? this.searchHotels,
      searchHotelsState: searchHotelsState ?? this.searchHotelsState,
      searchHotelsMessage: searchHotelsMessage ?? this.searchHotelsMessage,
    );
  }
  const FathiState({
    this.facilities = const Facilities(
        status: Status(type: '1'),
        facilitiesData: [
      FacilitiesData(
        id: 2,
        name: 'wifi',
        image: "http://api.mahmoudtaha.com/images/71711662902782.jpeg",
        createdAt: "",
        updatedAt: "",
      ),
    ]),
    this.facilitiesMessage = '',
    this.facilitiesState = RequestState.loading,
    this.searchHotels = const SearchHotels(
      status: Status(
        type: "1",
      ),
      searchHotelsAllData: SearchHotelsAllData(
        currentPage: 1,
        data: [
          SearchHotelsData(
              id: 9,
              name: "hotel2",
              description: "desc4",
              price: "200",
              address: "tanta",
              longitude: "100",
              latitude: "200",
              rate: "10.50",
              createdAt: "",
              updatedAt: "",
              hotelImages: [
                HotelImages(
                  id: 7,
                  hotelId: "9",
                  image: "35321662903840.jpg",
                  createdAt: "",
                  updatedAt: "",
                ),
              ],
              facilities: [
                FacilitiesData(
                  id: 7,
                  name: "wifi",
                  image: "50631662902867.png",
                  createdAt: "",
                  updatedAt: "",
                ),
              ]),
          SearchHotelsData(
              id: 9,
              name: "hotel2",
              description: "desc4",
              price: "200",
              address: "tanta",
              longitude: "100",
              latitude: "200",
              rate: "10.50",
              createdAt: "",
              updatedAt: "",
              hotelImages: [
                HotelImages(
                  id: 7,
                  hotelId: "9",
                  image: "35321662903840.jpg",
                  createdAt: "",
                  updatedAt: "",
                ),
              ],
              facilities: [
                FacilitiesData(
                  id: 7,
                  name: "wifi",
                  image: "50631662902867.png",
                  createdAt: "",
                  updatedAt: "",
                ),
              ]),
          SearchHotelsData(
              id: 9,
              name: "hotel2",
              description: "desc4",
              price: "200",
              address: "tanta",
              longitude: "100",
              latitude: "200",
              rate: "10.50",
              createdAt: "",
              updatedAt: "",
              hotelImages: [
                HotelImages(
                  id: 7,
                  hotelId: "9",
                  image: "35321662903840.jpg",
                  createdAt: "",
                  updatedAt: "",
                ),
              ],
              facilities: [
                FacilitiesData(
                  id: 7,
                  name: "wifi",
                  image: "50631662902867.png",
                  createdAt: "",
                  updatedAt: "",
                ),
              ]),
          SearchHotelsData(
              id: 9,
              name: "hotel2",
              description: "desc4",
              price: "200",
              address: "tanta",
              longitude: "100",
              latitude: "200",
              rate: "10.50",
              createdAt: "",
              updatedAt: "",
              hotelImages: [
                HotelImages(
                  id: 7,
                  hotelId: "9",
                  image: "35321662903840.jpg",
                  createdAt: "",
                  updatedAt: "",
                ),
              ],
              facilities: [
                FacilitiesData(
                  id: 7,
                  name: "wifi",
                  image: "50631662902867.png",
                  createdAt: "",
                  updatedAt: "",
                ),
              ]),
        ],
        firstPageUrl: "http://api.mahmoudtaha.com/api/hotels?page=1",
        from: 1,
        lastPage: 1,
        lastPageUrl: "http://api.mahmoudtaha.com/api/hotels?page=1",
        nextPageUrl: "http://api.mahmoudtaha.com/api/hotels?page=1",
        prevPageUrl: "http://api.mahmoudtaha.com/api/hotels?page=1",
        links: [
          Links(
            url: "http://api.mahmoudtaha.com/api/search-hotels?page=1",
            label: "1",
            active: true,
          ),
          Links(
            url: "http://api.mahmoudtaha.com/api/search-hotels?page=1",
            label: "1",
            active: true,
          ),
          Links(
            url: "http://api.mahmoudtaha.com/api/search-hotels?page=1",
            label: "1",
            active: true,
          ),
        ],
        path: "http://api.mahmoudtaha.com/api/hotels",
        perPage: '15',
        to: 12,
        total: 12,
      ),
    ),
    this.searchHotelsMessage = '',
    this.searchHotelsState = RequestState.loading,
  });

  @override
  List<Object> get props =>
      [
        facilities,
        facilitiesState,
        facilitiesMessage,
        searchHotels,
        searchHotelsState,
        searchHotelsMessage,
      ];
}
