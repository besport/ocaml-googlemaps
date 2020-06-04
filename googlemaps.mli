type travel_mode =
  | Driving   [@js "DRIVING"]
  | Walking   [@js "WALKING"]
  | Bicycling [@js "BICYCLING"]
  | Transit   [@js "TRANSIT"]
  [@@ js.enum]

type symbol_path =
  | Circle                [@js 0]
  | Forward_closed_arrow  [@js 1]
  | Forward_open_arrow    [@js 2]
  | Backward_closed_arrow [@js 3]
  | Backward_open_arrow   [@js 4]
  [@@ js.enum]

type animation =
  | Bounce [@js 1]
  | Drop   [@js 2]
  | Nr     [@js 3]
  | Lr     [@js 4]
  [@@ js.enum]

type map_types =
  | Roadmap   [@js "roadmap"]
  | Satellite [@js "satellite"]
  | Hybrid    [@js "hybrid"]
  | Terrain   [@js "terrain"]
  [@@js.enum]

type geocoder_location_type =
  | Approximate        [@js "APPROXIMATE"]
  | Geometric_center   [@js "GEOMETRIC_CENTER"]
  | Range_interpolated [@js "RANGE_INTERPOLATED"]
  | Rooftop            [@js "ROOFTOP"]
  [@@js.enum]

type geocoder_status =
  | Error            [@js "ERROR"]
  | Invalid_request  [@js "INVALID_REQUEST"]
  | Ok               [@js "OK"]
  | Over_query_limit [@js "OVER_QUERY_LIMIT"]
  | Request_denied   [@js "REQUEST_DENIED"]
  | Unknown_error    [@js "UNKNOWN_ERROR"]
  | Zero_results     [@js "ZERO_RESULTS"]
  [@@js.enum]

type control_position =
  | Bottom        [@js 11]
  | Bottom_left   [@js 10]
  | Bottom_right  [@js 12]
  | Center        [@js 13]
  | Left          [@js 5]
  | Left_bottom   [@js 6]
  | Left_center   [@js 4]
  | Right         [@js 7]
  | Right_bottom  [@js 9]
  | Right_center  [@js 8]
  | Top           [@js 2]
  | Top_left      [@js 1]
  | Top_right     [@js 3]
  [@@js.enum]

type overlay_type =
  | Marker    [@js "marker"]
  | Polygon   [@js "polygon"]
  | Polyline  [@js "polyline"]
  | Rectangle [@js "rectangle"]
  | Circle    [@js "circle"]
  [@@js.enum]

type stroke_position =
  | Center  [@js 0]
  | Inside  [@js 1]
  | Outside [@js 2]
  [@@js.enum]

module VehicleType: sig
  (* SUM TYPE *)
  type t
end

type map_type_control_style =
  | Default        [@js 0]
  | Horizontal_bar [@js 1]
  | Dropdown_menu  [@js 2]
  | Inset          [@js 3]
  | Inset_large    [@js 4]
  [@@ js.enum]

module MVCObject: sig
  type t
  val new_MVC_object : unit -> t [@@js.new]
  val changed : t -> string -> unit [@@js.call]
  val get : t -> string -> Ojs.t [@@js.call]
  val notify : t -> string -> unit [@@js.call]
  val set : t -> string -> Ojs.t -> unit [@@js.call]
  val set_values : t -> Ojs.t -> unit [@@js.call]
  val unbind : t -> string [@@js.call]
  val unbind_all : t -> unit [@@js.call]
end
[@js.scope "google.maps"]

module MVCArray: sig
  type t
  val new_MVC_array : ?array:Ojs.t list -> unit -> t [@@js.new]
  val clear : t -> unit [@@js.call]
  val for_each : t -> (Ojs.t -> int) -> unit [@@js.call]
  val get_array : t -> Ojs.t list [@@js.call]
  val get_at : t -> int -> Ojs.t [@@js.call]
  val get_length : t -> int [@@js.call]
  val insert_at : t -> int -> Ojs.t [@@js.call]
  val pop : t -> Ojs.t [@@js.call]
  val push : t -> Ojs.t -> int [@@js.call]
  val remove_at : t -> int -> Ojs.t [@@js.call]
  val set_at : t -> int -> Ojs.t -> unit [@@js.call]
end
[@js.scope "google.maps"]

module MapsEventListener: sig
  type t
  val new_maps_event_listener : unit -> t [@@js.new]
  val remove : t -> unit [@@js.call]
end
[@js.scope "google.maps"]

module Attribution: sig
  type t
  val create :
    ?ios_deep_link_id:string ->
    ?source:string ->
    ?web_url:string ->
    unit -> t
    [@@js.builder]
  val ios_deep_link_id: t -> string [@@js.get]
  val source: t -> string [@@js.get]
  val web_url: t -> string [@@js.get]
  val set_ios_deep_link_id: t -> string -> unit [@@js.set]
  val set_source: t -> string -> unit [@@js.set]
  val set_web_url: t -> string -> unit [@@js.set]
end

module LatLng: sig
  type t
  val new_lat_lng: lat:float -> lng:float -> t [@@js.new]
  val lat: t -> float [@@js.call]
  val lng: t -> float [@@js.call]
  (** Unsafe **)
  val t_to_js : t -> Ojs.t
  val t_of_js : Ojs.t -> t
end
[@js.scope "google.maps"]

module LatLngBounds: sig
  type t
  val new_lat_lng_bounds: sw:LatLng.t -> ne:LatLng.t -> t [@@js.new]
  val contains: t -> LatLng.t -> bool [@@js.call]
  val equals: t -> LatLng.t -> bool [@@js.call]
  val extend: t -> LatLng.t -> t [@@js.call]
  val get_center: t -> unit -> LatLng.t [@@js.call]
  val get_north_east: t -> unit -> LatLng.t [@@js.call]
  val get_south_west: t -> unit -> LatLng.t [@@js.call]
  val intersects: t -> t -> bool [@@js.call]
  val is_empty: t -> unit -> bool [@@js.call]
  val to_string: t -> unit -> string [@@js.call]
  val union: t -> t -> t [@@js.call]
end
[@js.scope "google.maps"]

module Point: sig
  type t
  val new_point : x:float -> y:float -> t [@@js.new]
  val equals : t -> t -> bool [@@js.call]
  val x : t -> float [@@js.get]
  val y : t -> float [@@js.get]
  val set_x : t -> float -> unit [@@js.set]
  val set_y : t -> float -> unit [@@js.set]
end
[@js.scope "google.maps"]

module Size: sig
  type t
  val new_size :
    width:float ->
    height:float ->
    ?width_unit:string ->
    ?height_unit:string ->
    unit ->
    t [@@js.new]
  val equals : t -> t -> bool [@@js.call]
  val to_string : t -> string [@@js.call]
  val height : t -> float [@@js.get]
  val width  : t -> float [@@js.get]
  val set_height : t -> float -> unit [@@js.set]
  val set_width : t -> float -> unit [@@js.set]
end
[@js.scope "google.maps"]

module Icon: sig
  type t
  val create:
    ?anchor:Point.t ->
    ?label_origin:Point.t ->
    ?origin:Point.t ->
    ?scaled_size:Size.t ->
    ?size:Size.t ->
    ?url:string ->
    unit ->
    t
    [@@js.builder]
  val anchor: t -> Point.t [@@js.get]
  val label_origin: t -> Point.t [@@js.get]
  val origin: t -> Point.t [@@js.get]
  val scaled_size: t -> Size.t [@@js.get]
  val size: t -> Size.t [@@js.get]
  val url: t -> string [@@js.get]
  val set_anchor: t -> Point.t -> unit [@@js.set]
  val set_label_origin: t -> Point.t -> unit [@@js.set]
  val set_origin: t -> Point.t -> unit [@@js.set]
  val set_scaled_size: t -> Size.t -> unit [@@js.set]
  val set_size: t -> Size.t -> unit [@@js.set]
  val set_url: t -> string -> unit [@@js.set]
end

module Projection: sig
  type t
  val from_lat_lng_to_point : t -> LatLng.t -> Point.t
  val from_point_to_lat_lng : t -> Point.t -> LatLng.t
end
[@js.scope "google.maps"]

(* Map *)

(* Zoom *)
module ZoomControlOptions: sig
  type t
  val create:
    position:control_position ->
    t
    [@@js.builder]
  val position: t -> control_position [@@js.get]
  val set_position: t -> control_position -> unit [@@js.set]
end
(* End zoom *)

(* Fullscreen *)
module FullscreenControlOptions: sig
  type t
  val create:
    position:control_position ->
    t
    [@@js.builder]
  val position: t -> control_position [@@js.get]
  val set_position: t -> control_position -> unit [@@js.set]
end
(* End Fullscreen *)

(* Streetview *)
module StreetViewAddressControlOptions: sig
  type t
  val create:
    position:control_position ->
    t
    [@@js.builder]
  val position: t -> control_position [@@js.get]
  val set_position: t -> control_position -> unit [@@js.set]
end

module StreetViewControlOptions: sig
  type t
  val create:
    position:control_position ->
    t
    [@@js.builder]
  val position: t -> control_position [@@js.get]
  val set_position: t -> control_position -> unit [@@js.set]
end

module StreetViewLink: sig
  type t
  val create:
    ?description:string ->
    ?heading:int ->
    ?pano:string ->
    unit ->
    t
    [@@js.builder]
  val description: t -> string [@@js.get]
  val heading: t -> int [@@js.get]
  val pano: t -> string [@@js.get]
  val set_description: t -> string -> unit [@@js.set]
  val set_heading: t -> int -> unit [@@js.set]
  val set_pano: t -> string -> unit [@@js.set]
end

type street_view_preference =
  | Nearest [@js "nearest"]
  | Best [@js "best"]
  [@@ js.enum]

type street_view_status =
  | Ok            [@js "OK"]
  | Unknown_error [@js "UNKNOWN_ERROR"]
  | Zero_results  [@js "ZERO_RESULTS"]
  [@@ js.enum]

type street_view_source =
  | Default [@js "default"]
  | Outdoor [@js "outdoor"]
  [@@ js.enum]

module StreetViewLocation: sig
  type t
  val create:
    ?description:string ->
    ?lat_lng:LatLng.t ->
    ?pano:string ->
    short_description:string ->
    unit ->
    t
    [@@js.builder]
  val description: t -> string [@@js.get]
  val lat_lng: t -> LatLng.t [@@js.get]
  val pano: t -> string [@@js.get]
  val short_description: t -> string [@@js.get]
  val set_description: t -> string -> unit [@@js.set]
  val set_lat_lng: t -> LatLng.t -> unit [@@js.set]
  val set_pano: t -> string -> unit [@@js.set]
  val set_short_description: t -> string -> unit [@@js.set]
end

module StreetViewTileData: sig
  type t
  val new_street_view_tile_data: unit -> t [@@js.new]
  val get_tile_url:
    t ->
    pano:string ->
    tile_zoom:int ->
    tile_x:int ->
    tile_y:int ->
    string
    [@@js.call]
  val center_heading : t -> float [@@js.get]
  val tile_size : t -> Size.t [@@js.get]
  val world_size : t -> Size.t [@@js.get]
  val set_center_heading : t -> float -> unit [@@js.set]
  val set_tile_size : t -> Size.t -> unit [@@js.set]
  val set_world_size : t -> Size.t -> unit [@@js.set]
end
[@ js.scope "google.maps"]

module StreetViewPanoramaData: sig
  type t
  val create:
    ?copyright:string ->
    ?image_data:string ->
    ?links:StreetViewLink.t list ->
    ?location:StreetViewLocation.t ->
    ?tiles:StreetViewTileData.t ->
    unit ->
    t
    [@@js.builder]
  val copyright: t -> string [@@js.get]
  val image_data: t -> string [@@js.get]
  val links: t -> StreetViewLink.t list [@@js.get]
  val location: t -> StreetViewLocation.t [@@js.get]
  val tiles: t -> StreetViewTileData.t [@@js.get]
  val set_copyright: t -> string -> unit [@@js.set]
  val set_image_data: t -> string -> unit [@@js.set]
  val set_links: t -> StreetViewLink.t list -> unit [@@js.set]
  val set_location: t -> StreetViewLocation.t -> unit [@@js.set]
  val set_tiles: t -> StreetViewTileData.t -> unit [@@js.set]
end

module StreetViewLocationRequest: sig
  type t
  val create:
    ?location:LatLng.t ->
    ?preference:street_view_preference ->
    ?radius:float ->
    ?source:street_view_source ->
    unit ->
    t
    [@@js.builder]
  val location: t -> LatLng.t [@@js.get]
  val preference: t -> street_view_preference [@@js.get]
  val radius: t -> float [@@js.get]
  val source: t -> street_view_source [@@js.get]
  val set_location: t -> LatLng.t -> unit [@@js.set]
  val set_preference: t -> street_view_preference -> unit [@@js.set]
  val set_radius: t -> float -> unit [@@js.set]
  val set_source: t -> street_view_source -> unit [@@js.set]
end

module StreetViewPanoRequest: sig
  type t
  val create:
    pano:string ->
    t
    [@@js.builder]
  val pano: t -> string [@@js.get]
  val set_pano: t -> string -> unit [@@js.set]
end

module StreetViewService: sig
  type t
  val new_street_view_service:
    unit -> t [@@js.new]
  val get_panorama:
    StreetViewLocationRequest.t ->
    (StreetViewPanoramaData.t ->
     street_view_status ->
    unit) ->
    unit
  val get_panorama_panorequest:
    StreetViewPanoRequest.t ->
    (StreetViewPanoramaData.t ->
     street_view_status ->
    unit) ->
    unit
    [@@js.call "getPanorama"]
end
[@ js.scope "google.maps"]

module PanControlOptions: sig
  type t
  val create:
    position:control_position ->
    t
    [@@js.builder]
  val position: t -> control_position [@@js.get]
  val set_position: t -> control_position -> unit [@@js.set]
end

module StreetViewPov: sig
  type t
  val create:
    heading:int ->
    pitch:int ->
    t
    [@@js.builder]
  val heading: t -> int [@@js.get]
  val pitch: t -> int [@@js.get]
  val set_heading: t -> int -> unit [@@js.set]
  val set_pitch: t -> int -> unit [@@js.set]
end

module StreetViewPanoramaOptions: sig
  type t
  val create:
    ?address_control:bool ->
    ?address_control_options:StreetViewAddressControlOptions.t ->
    ?click_to_go:bool ->
    ?disable_default_u_i:bool ->
    ?disable_double_click_zoom:bool ->
    ?enable_close_button:bool ->
    ?fullscreen_control:bool ->
    ?fullscreen_control_options:FullscreenControlOptions.t ->
    ?image_date_control:bool ->
    ?links_control:bool ->
    ?pan_control:bool ->
    ?pan_control_options:PanControlOptions.t ->
    ?pano:string ->
    ?pano_provider:(string->StreetViewPanoramaData.t) ->
    ?position:LatLng.t ->
    ?pov:StreetViewPov.t ->
    ?scrollwheel:bool ->
    ?visible:bool ->
    ?zoom_control:bool ->
    ?zoom_control_options:ZoomControlOptions.t ->
    unit ->
    t
    [@@js.builder]
  val address_control: t -> bool [@@js.get]
  val address_control_options: t -> StreetViewAddressControlOptions.t [@@js.get]
  val click_to_go: t -> bool [@@js.get]
  val disable_default_u_i: t -> bool [@@js.get]
  val disable_double_click_zoom: t -> bool [@@js.get]
  val enable_close_button: t -> bool [@@js.get]
  val fullscreen_control: t -> bool [@@js.get]
  val fullscreen_control_options: t -> FullscreenControlOptions.t [@@js.get]
  val image_date_control: t -> bool [@@js.get]
  val links_control: t -> bool [@@js.get]
  val pan_control: t -> bool [@@js.get]
  val pan_control_options: t -> PanControlOptions.t [@@js.get]
  val pano: t -> string [@@js.get]
(*  val pano_provider: t -> (string->StreetViewPanoramaData.t) [@@js.get]*)
  val position: t -> LatLng.t [@@js.get]
  val pov: t -> StreetViewPov.t [@@js.get]
  val scrollwheel: t -> bool [@@js.get]
  val visible: t -> bool [@@js.get]
  val zoom_control: t -> bool [@@js.get]
  val zoom_control_options: t -> ZoomControlOptions.t [@@js.get]
  val set_address_control: t -> bool -> unit [@@js.set]
  val set_address_control_options:
    t -> StreetViewAddressControlOptions.t -> unit [@@js.set]
  val set_click_to_go: t -> bool -> unit [@@js.set]
  val set_disable_default_u_i: t -> bool -> unit [@@js.set]
  val set_disable_double_click_zoom: t -> bool -> unit [@@js.set]
  val set_enable_close_button: t -> bool -> unit [@@js.set]
  val set_fullscreen_control: t -> bool -> unit [@@js.set]
  val set_fullscreen_control_options:
    t -> FullscreenControlOptions.t -> unit [@@js.set]
  val set_image_date_control: t -> bool -> unit [@@js.set]
  val set_links_control: t -> bool -> unit [@@js.set]
  val set_pan_control: t -> bool -> unit [@@js.set]
  val set_pan_control_options: t -> PanControlOptions.t -> unit [@@js.set]
  val set_pano: t -> string -> unit [@@js.set]
  val set_pano_provider:
    t -> (string->StreetViewPanoramaData.t) -> unit [@@js.set]
  val set_position: t -> LatLng.t -> unit [@@js.set]
  val set_pov: t -> StreetViewPov.t -> unit [@@js.set]
  val set_scrollwheel: t -> bool -> unit [@@js.set]
  val set_visible: t -> bool -> unit [@@js.set]
  val set_zoom_control: t -> bool -> unit [@@js.set]
  val set_zoom_control_options: t -> ZoomControlOptions.t -> unit [@@js.set]
end

module StreetViewPanorama: sig
  type t
  val new_street_view_panorama:
    container:Converter.Element.t ->
    ?opts:StreetViewPanoramaOptions.t ->
    unit ->
    t [@@js.new]
  val get_links: t -> StreetViewLink.t list [@@js.call]
  val get_location: t -> StreetViewLocation.t [@@js.call]
  val get_pano: t -> string [@@js.call]
  val get_photographer_pov: t -> StreetViewPov.t [@@js.call]
  val get_position: t -> LatLng.t [@@js.call]
  val get_pov: t -> StreetViewPov.t [@@js.call]
  val get_status: t -> street_view_status [@@js.call]
  val get_visible: t -> bool [@@js.call]
  val get_zoom: t -> int [@@js.call]
  val register_pano_provider:
    (string->StreetViewPanoramaData.t) -> unit [@@js.call]
  val set_links: t -> StreetViewLink.t list -> unit [@@js.call]
  val set_options:
    t -> StreetViewPanoramaOptions.t -> unit [@@js.call]
  val set_pano: t -> string -> unit [@@js.call]
  val set_position: t -> LatLng.t -> unit [@@js.call]
  val set_pov: t -> StreetViewPov.t -> unit [@@js.call]
  val set_visible: t -> bool -> unit [@@js.call]
  val set_zoom: t -> int -> unit [@@js.call]
  val controls : t -> MVCArray.t list [@@js.get]
  val set_controls : t -> MVCArray.t list -> unit [@@js.set]
end
  [@js.scope "google.maps"]
(* End streetview *)

(* Data *)
module Data: sig

  (* type styling_function = Feature.t -> StyleOptions.t *)

  module Geometry: sig
    type t
    (* val get_type: t -> string [@@js.call] *)
  end

  module Polygon: sig
    type t
    val new_polygon : LatLng.t list list -> t
    [@@js.new]
  end
  [@js.scope "google.maps.Data"]

  val geometry_of_polygon: Polygon.t -> Geometry.t [@@js.cast]

  module FeatureOptions : sig
    type t
    val create : ?geometry:Geometry.t -> unit -> t
    [@@js.builder]
  end

  module Feature : sig
    type t
    val new_feature : ?options:FeatureOptions.t -> unit -> t
    [@@js.new]
  end
  [@js.scope "google.maps.Data"]

  (* module DataOptions: sig *)
  (*   type t *)
  (*   val create: *)
  (*     ?control_position:control_position -> *)
  (*     ?controls:string list -> *)
  (*     ?drawing_mode:string -> *)
  (*     ?feature_factory:(Geometry.t -> Feature.t) -> *)
  (*     ?map:Map.t -> *)
  (*     ?style:styling_function -> *)
  (*     unit -> *)
  (*     t *)
  (*     [@@js.builder] *)
  (* end *)

  type t
  (* val new_data: ?opts:DataOptions.t -> t [@@js.new] *)
  val add: t -> ?feature:Feature.t -> unit -> Feature.t [@@js.call]

end
(* End data *)

module MapTypeControlOptions: sig
  type t
  val create:
    ?map_type_ids:map_types list ->
    ?position:control_position ->
    ?style:map_type_control_style ->
    unit ->
    t
    [@@js.builder]
  val map_type_ids: t -> map_types list [@@js.get]
  val position: t -> control_position [@@js.get]
  val style: t -> map_type_control_style [@@js.get]
  val set_map_type_ids: t -> map_types list -> unit [@@js.set]
  val set_position: t -> control_position -> unit [@@js.set]
  val set_style: t -> map_type_control_style -> unit [@@js.set]
end

module MapTypeStyler: sig
  type t
  val create:
    ?color:string ->
    ?gamma:float ->
    ?hue:string ->
    ?invert_lightness:bool ->
    ?lightness:float ->
    ?saturation:float ->
    ?visibility:string ->
    ?weight:int ->
    unit ->
    t
    [@@js.builder]
  val color: t -> string [@@js.get]
  val gamma: t -> float [@@js.get]
  val hue: t -> string [@@js.get]
  val invert_lightness: t -> bool [@@js.get]
  val lightness: t -> float [@@js.get]
  val saturation: t -> float [@@js.get]
  val visibility: t -> string [@@js.get]
  val weight: t -> int [@@js.get]
  val set_color: t -> string -> unit [@@js.set]
  val set_gamma: t -> float -> unit [@@js.set]
  val set_hue: t -> string -> unit [@@js.set]
  val set_invert_lightness: t -> bool -> unit [@@js.set]
  val set_lightness: t -> float -> unit [@@js.set]
  val set_saturation: t -> float -> unit [@@js.set]
  val set_visibility: t -> string -> unit [@@js.set]
  val set_weight: t -> int -> unit [@@js.set]
end

module MapTypeStyleElementType: sig
  type t =
    | All                [@js "all"]
    | Geometry           [@js "geometry"]
    | Geometry_fill      [@js "geometry.fill"]
    | Geometry_stroke    [@js "geometry.stroke"]
    | Labels             [@js "labels"]
    | Labels_icon        [@js "labels.icon"]
    | Labels_text        [@js "labels.text"]
    | Labels_text_fill   [@js "labels.text.fill"]
    | Labels_text_stroke [@js "labels.text.stroke"]
  [@@ js.enum]
end

module MapTypeStyleFeatureType: sig
  type t =
    | All                           [@js "all"]
    | Administrative                [@js "administrative"]
    | Administrative_country        [@js "administrative.country"]
    | Administrative_landparcel     [@js "administrative.land_parcel"]
    | Administrative_locality       [@js "administrative.locality"]
    | Administrative_neighborhood   [@js "administrative.neighborhood"]
    | Administrative_province       [@js "administrative.province"]
    | Landscape                     [@js "landscape"]
    | Landscape_manmade             [@js "landscape.man_made"]
    | Landscape_natural             [@js "landscape.natural"]
    | Landscape_natural_landcover   [@js "landscape.natural.landcover"]
    | Landscape_natural_terrain     [@js "landscape.natural.terrain"]
    | Poi                           [@js "poi"]
    | Poi_attraction                [@js "poi.attraction"]
    | Poi_business                  [@js "poi.business"]
    | Poi_government                [@js "poi.government"]
    | Poi_medical                   [@js "poi.medical"]
    | Poi_park                      [@js "poi.park"]
    | Poi_placeofworship            [@js "poi.place_of_worship"]
    | Poi_school                    [@js "poi.school"]
    | Poi_sportscomplex             [@js "poi.sports_complex"]
    | Road                          [@js "road"]
    | Road_arterial                 [@js "road.arterial"]
    | Road_highway                  [@js "road.highway"]
    | Road_highway_controlledaccess [@js "road.highway.controlled_access"]
    | Road_local                    [@js "road.local"]
    | Transit                       [@js "transit"]
    | Transit_line                  [@js "transit.line"]
    | Transit_station               [@js "transit.station"]
    | Transit_station_airport       [@js "transit.station.airport"]
    | Transit_station_bus           [@js "transit.station.bus"]
    | Transit_station_rail          [@js "transit.station.rail"]
    | Water                         [@js "water"]
  [@@ js.enum]
end

module MapTypeStyle: sig
  type t
  val create:
    ?element_type:MapTypeStyleElementType.t ->
    ?feature_type:MapTypeStyleFeatureType.t ->
    ?stylers:MapTypeStyler.t list ->
    unit ->
    t
    [@@js.builder]
  val element_type: t -> MapTypeStyleElementType.t [@@js.get]
  val feature_type: t -> MapTypeStyleFeatureType.t [@@js.get]
  val stylers: t -> MapTypeStyler.t list [@@js.get]
  val set_element_type:
    t -> MapTypeStyleElementType.t -> unit [@@js.set]
  val set_feature_type:
    t -> MapTypeStyleFeatureType.t -> unit [@@js.set]
  val set_stylers: t -> MapTypeStyler.t list -> unit [@@js.set]
end

module MapType: sig
  type t
  val new_map_type: unit -> t [@@js.new]
  val get_tile:
    t ->
    tile_coord:Point.t ->
    zoom:int ->
    Converter.Element.t ->
    unit [@@js.call]
  (** Node **)
  val release_tile: t -> Ojs.t -> unit [@@js.call]
  val alt : t -> string [@@js.get]
  val max_zoom : t -> int [@@js.get]
  val min_zoom : t -> int [@@js.get]
  val name : t -> string [@@js.get]
  val projection : t -> Projection.t [@@js.get]
  val radius : t -> float [@@js.get]
  val tile_size : t -> Size.t [@@js.get]
  val set_alt : t -> string -> unit [@@js.set]
  val set_max_zoom : t -> int -> unit [@@js.set]
  val set_min_zoom : t -> int -> unit [@@js.set]
  val set_name : t -> string -> unit [@@js.set]
  val set_projection : t -> Projection.t -> unit [@@js.set]
  val set_radius : t -> float -> unit [@@js.set]
  val set_tile_size : t -> Size.t -> unit [@@js.set]
end
[@js.scope "google.maps"]

module MapOptions: sig
  type t
  val create :
    ?background_color:string ->
    ?center:LatLng.t ->
    ?clickable_icons:bool ->
    ?disable_double_click_zoom:bool ->
    ?draggable:bool ->
    ?draggable_cursor:string ->
    ?dragging_cursor:string ->
    ?fullscreen_control:bool ->
    ?gesture_handling:string ->
    ?heading:float ->
    ?keyboard_shortcuts:bool ->
    ?map_maker:bool ->
    ?map_type_control:bool ->
    ?map_type_control_options:MapTypeControlOptions.t ->
    ?map_type_id:map_types ->
    ?max_zoom:int ->
    ?min_zoom:int ->
    ?no_clear:bool ->
    ?pan_control:bool ->
    ?rotate_control:bool ->
    ?scale_control:bool ->
    ?scrollwheel:bool ->
    ?sign_in_control:bool ->
    ?street_view_control:bool ->
    ?styles:MapTypeStyle.t list ->
    ?tilt:float ->
    ?zoom:int ->
    ?zoom_control:bool ->
    ?zoom_control_options:ZoomControlOptions.t ->
    unit ->
    t
    [@@js.builder]

  val background_color: t -> string [@@js.get]
  val center: t -> LatLng.t [@@js.get]
  val clickable_icons: t -> bool [@@js.get]
  val disable_double_click_zoom: t -> bool [@@js.get]
  val draggable: t -> bool [@@js.get]
  val draggable_cursor: t -> string [@@js.get]
  val dragging_cursor: t -> string [@@js.get]
  val fullscreen_control: t -> bool [@@js.get]
  val gesture_handling: t -> string [@@js.get]
  val heading: t -> float [@@js.get]
  val keyboard_shortcuts: t -> bool [@@js.get]
  val map_maker: t -> bool [@@js.get]
  val map_type_control: t -> bool [@@js.get]
  val map_type_control_options: t -> MapTypeControlOptions.t [@@js.get]
  val map_type_id: t -> map_types [@@js.get]
  val max_zoom: t -> int [@@js.get]
  val min_zoom: t -> int [@@js.get]
  val no_clear: t -> bool [@@js.get]
  val pan_control: t -> bool [@@js.get]
  val rotate_control: t -> bool [@@js.get]
  val scale_control: t -> bool [@@js.get]
  val scrollwheel: t -> bool [@@js.get]
  val sign_in_control: t -> bool [@@js.get]
  val street_view_control: t -> bool [@@js.get]
  val tilt: t -> float [@@js.get]
  val zoom: t -> int [@@js.get]
  val zoom_control: t -> bool [@@js.get]
  val zoom_control_options: t -> ZoomControlOptions.t [@@js.get]
  val set_background_color: t -> string -> unit [@@js.set]
  val set_center: t -> LatLng.t -> unit [@@js.set]
  val set_clickable_icons: t -> bool -> unit [@@js.set]
  val set_disable_double_click_zoom: t -> bool -> unit [@@js.set]
  val set_draggable: t -> bool -> unit [@@js.set]
  val set_draggable_cursor: t -> string -> unit [@@js.set]
  val set_dragging_cursor: t -> string -> unit [@@js.set]
  val set_fullscreen_control: t -> bool -> unit [@@js.set]
  val set_gesture_handling: t -> string -> unit [@@js.set]
  val set_heading: t -> float -> unit [@@js.set]
  val set_keyboard_shortcuts: t -> bool -> unit [@@js.set]
  val set_map_maker: t -> bool -> unit [@@js.set]
  val set_map_type_control: t -> bool -> unit [@@js.set]
  val set_map_type_control_options: t -> MapTypeControlOptions.t -> unit [@@js.set]
  val set_map_type_id: t -> map_types -> unit [@@js.set]
  val set_max_zoom: t -> int -> unit [@@js.set]
  val set_min_zoom: t -> int -> unit [@@js.set]
  val set_no_clear: t -> bool -> unit [@@js.set]
  val set_pan_control: t -> bool -> unit [@@js.set]
  val set_rotate_control: t -> bool -> unit [@@js.set]
  val set_scale_control: t -> bool -> unit [@@js.set]
  val set_scrollwheel: t -> bool -> unit [@@js.set]
  val set_sign_in_control: t -> bool -> unit [@@js.set]
  val set_street_view_control: t -> bool -> unit [@@js.set]
  val set_tilt: t -> float -> unit [@@js.set]
  val set_zoom: t -> int -> unit [@@js.set]
  val set_zoom_control: t -> bool -> unit [@@js.set]
  val set_zoom_control_options: t -> ZoomControlOptions.t -> unit [@@js.set]
end

module MapTypeRegistry: sig
  type t
  val new_map_type_registry: unit -> t [@@js.new]
  val set: t -> id:string -> map_type:map_types option -> unit [@@js.call]
end
[@js.scope "google.maps"]

module Map: sig
  type t
  val new_map :
    Converter.Element.t ->
    ?opts:MapOptions.t -> unit -> t [@@js.new]

  val add_listener : t -> string -> (unit -> unit) -> MapsEventListener.t
  [@@js.call]

  [@@@js.stop]
  val bounds_changed : t -> (unit -> unit) -> MapsEventListener.t
  val center_changed : t -> (unit -> unit) -> MapsEventListener.t
  [@@@js.start]

  [@@@js.implem
    let bounds_changed t fn = add_listener t "bounds_changed" fn
    let center_changed t fn = add_listener t "center_changed" fn
  ]

  val fit_bounds : t -> LatLngBounds.t -> unit [@@js.call]
  val get_bounds : t -> LatLngBounds.t [@@js.call]
  val get_center : t -> LatLng.t [@@js.call]
  val get_clickable_icons : t -> bool [@@js.call]
  val set_map_type_id : t -> map_types -> unit [@@js.call]
  val set_map_type_id_string : t -> string -> unit [@@js.call "setMapTypeId"]
  val get_map_type_id : t -> map_types [@@js.call]
  val get_div : t -> Converter.Element.t [@@js.call]
  val get_heading : t -> float [@@js.call]
  val get_projection : t -> Projection.t [@@js.call]
  val get_tilt : t -> float [@@js.call]
  val get_zoom : t -> int [@@js.call]
  val pan_by : t -> x:float -> y:float -> unit [@@js.call]
  val pan_to : t -> LatLng.t -> unit [@@js.call]
  val pan_to_bounds : t -> LatLngBounds.t -> unit [@@js.call]
  val set_center : t -> LatLng.t -> unit [@@js.call]
  val set_clickable_icons : t -> bool -> unit [@@js.call]
  val set_heading : t -> float -> unit [@@js.call]
  val set_options : t -> MapOptions.t -> unit [@@js.call]
  val set_street_view : t -> StreetViewPanorama.t
  val set_tilt : t -> float -> unit [@@js.call]
  val set_zoom : t -> int -> unit [@@js.call]
  (** Attributes need getter and setter **)
  val controls: t ->  MVCArray.t list [@@js.get]
  val data: t -> Data.t [@@js.get]
  val map_types: t -> MapTypeRegistry.t [@@js.get]
  val overlay_map_types: t -> MVCArray.t [@@js.get]
  val set_controls: t ->  MVCArray.t list -> unit [@@js.set]
(*  val set_data: t -> Data.t -> unit [@@js.set]*)
  val set_map_types: t -> MapTypeRegistry.t -> unit [@@js.set]
  val set_overlay_map_types: t -> MVCArray.t -> unit [@@js.set]
  (** Added for polymorphism **)
  val t_to_js : t -> Ojs.t
  val t_of_js : Ojs.t -> t
end
[@js.scope "google.maps"]


module StreetViewCoverageLayer: sig
  type t
  val new_street_view_coverage_layer: unit -> t [@@js.new]
  val get_map: t -> Map.t [@@js.call]
  val set_map: t -> Map.t -> unit [@@js.call]
end
[@js.scope "google.maps"]

module MapCanvasProjection: sig
  type t
  val new_map_canvas_projection: unit -> t [@@js.new]
  val from_container_pixel_to_lat_lng:
    t -> Point.t -> ?nowrap:bool -> unit -> LatLng.t [@@js.call]
  val from_div_pixel_to_lat_lng:
    t -> Point.t -> ?nowrap:bool -> unit -> LatLng.t [@@js.call]
  val from_lat_lng_to_container_pixel:
    t -> LatLng.t -> Point.t [@@js.call]
  val from_lat_lng_to_div_pixel:
    t -> LatLng.t -> Point.t [@@js.call]
  val get_world_width: t -> int [@@js.call]
end
[@js.scope "google.maps"]

(* End map *)

module BicyclingLayer: sig
  type t
  val new_bicycling_layer: unit -> t [@@js.new]
  val get_map : t -> Map.t [@@js.call]
  val set_map : t -> Map.t -> unit [@@js.call]
end
[@js.scope "google.maps"]

module MarkerLabel: sig
  type t
  val create :
    ?color:string ->
    ?font_family:string ->
    ?font_size:string -> (*CSS font-size, ex : 14px*)
    ?font_weight:string ->
    ?text:string ->
    unit -> t [@@js.builder]
  val color: t -> string [@@js.get]
  val font_family: t -> string [@@js.get]
  val font_size: t -> string [@@js.get]
  val font_weight: t -> string [@@js.get]
  val text: t -> string [@@js.get]
  val set_color: t -> string -> unit [@@js.set]
  val set_font_family: t -> string -> unit [@@js.set]
  val set_font_size: t -> string -> unit [@@js.set]
  val set_font_weight: t -> string -> unit [@@js.set]
  val set_text: t -> string -> unit [@@js.set]
end

module MarkerPlace: sig
  type t
  val create :
    ?location:LatLng.t ->
    ?place_id:string ->
    ?query:string ->
    unit -> t [@@js.builder]
  val location: t -> LatLng.t [@@js.get]
  val place_id: t -> string [@@js.get]
  val query: t -> string [@@js.get]
  val set_location: t -> LatLng.t -> unit [@@js.set]
  val set_place_id: t -> string -> unit [@@js.set]
  val set_query: t -> string -> unit [@@js.set]
end

module MarkerShape: sig
  type t
  val create :
    ?coords:float list ->
    ?type':(string [@js "type"]) ->
    unit ->
    t [@@js.builder]
  val coords: t -> float list [@@js.get]
  val type': t -> string [@@js.get "type"]
  val set_coords: t -> float list -> unit [@@js.set]
  val set_type': t -> string -> unit [@@js.set "type"]
end

module MarkerOptions: sig
  type t
  val create :
    ?anchor_point:Point.t ->
    ?animation:animation ->
    ?attribution:Attribution.t ->
    ?clickable:bool ->
    ?cross_on_drag:bool ->
    ?cursor:string ->
    ?draggable:bool ->
    ?icon:Icon.t ->
    ?label:MarkerLabel.t ->
    ?map:Map.t ->
    ?opacity:float ->
    ?optimized:bool ->
    ?place:MarkerPlace.t ->
    ?position:LatLng.t ->
    ?shape:MarkerShape.t ->
    ?title:string ->
    ?visible:bool ->
    ?z_index:float ->
    unit ->
    t
    [@@js.builder]
  val anchor_point: t -> Point.t [@@js.get]
  val animation: t -> animation [@@js.get]
  val attribution: t -> Attribution.t [@@js.get]
  val clickable: t -> bool [@@js.get]
  val cross_on_drag: t -> bool [@@js.get]
  val cursor: t -> string [@@js.get]
  val draggable: t -> bool [@@js.get]
  val icon: t -> Icon.t [@@js.get]
  val label: t -> MarkerLabel.t [@@js.get]
  val map: t -> Map.t [@@js.get]
  val opacity: t -> float [@@js.get]
  val optimized: t -> bool [@@js.get]
  val place: t -> MarkerPlace.t [@@js.get]
  val position: t -> LatLng.t [@@js.get]
  val shape: t -> MarkerShape.t [@@js.get]
  val title: t -> string [@@js.get]
  val visible: t -> bool [@@js.get]
  val z_index: t -> float [@@js.get]
  val set_anchor_point: t -> Point.t -> unit [@@js.set]
  val set_animation: t -> animation -> unit [@@js.set]
  val set_attribution: t -> Attribution.t -> unit [@@js.set]
  val set_clickable: t -> bool -> unit [@@js.set]
  val set_cross_on_drag: t -> bool -> unit [@@js.set]
  val set_cursor: t -> string -> unit [@@js.set]
  val set_draggable: t -> bool -> unit [@@js.set]
  val set_icon: t -> Icon.t -> unit [@@js.set]
  val set_label: t -> MarkerLabel.t -> unit [@@js.set]
  val set_map: t -> Map.t -> unit [@@js.set]
  val set_opacity: t -> float -> unit [@@js.set]
  val set_optimized: t -> bool -> unit [@@js.set]
  val set_place: t -> MarkerPlace.t -> unit [@@js.set]
  val set_position: t -> LatLng.t -> unit [@@js.set]
  val set_shape: t -> MarkerShape.t -> unit [@@js.set]
  val set_title: t -> string -> unit [@@js.set]
  val set_visible: t -> bool -> unit [@@js.set]
  val set_z_index: t -> float -> unit [@@js.set]
end

(* Symbol *)
module Symbol: sig
  type t
  val create:
    ?anchor:Point.t ->
    ?fill_color:string ->
    ?fill_opacity:int ->
    ?label_origin:Point.t ->
    path:symbol_path ->
    ?rotation:float ->
    ?scale:float ->
    ?stroke_color:string ->
    ?stroke_opacity:float ->
    ?stroke_weight:float ->
    unit ->
    t
    [@@js.builder]
  val anchor: t -> Point.t [@@js.get]
  val fill_color: t -> string [@@js.get]
  val fill_opacity: t -> int [@@js.get]
  val label_origin: t -> Point.t [@@js.get]
  val path: t -> symbol_path [@@js.get]
  val rotation: t -> float [@@js.get]
  val scale: t -> float [@@js.get]
  val stroke_color: t -> string [@@js.get]
  val stroke_opacity: t -> float [@@js.get]
  val stroke_weight: t -> float [@@js.get]
  val set_anchor: t -> Point.t -> unit [@@js.set]
  val set_fill_color: t -> string -> unit [@@js.set]
  val set_fill_opacity: t -> int -> unit [@@js.set]
  val set_label_origin: t -> Point.t -> unit [@@js.set]
  val set_path: t -> symbol_path -> unit [@@js.set]
  val set_rotation: t -> float -> unit [@@js.set]
  val set_scale: t -> float -> unit [@@js.set]
  val set_stroke_color: t -> string -> unit [@@js.set]
  val set_stroke_opacity: t -> float -> unit [@@js.set]
  val set_stroke_weight: t -> float -> unit [@@js.set]
end
(* End symbol *)

module Marker: sig
  type t
  val new_marker : ?opts:MarkerOptions.t -> unit -> t [@@js.new]
  val get_animation : t -> animation [@@js.call]
  val get_attribution : t -> Attribution.t [@@js.call]
  val get_clickable : t -> bool [@@js.call]
  val get_cursor : t -> bool [@@js.call]
  val get_draggable : t -> bool [@@js.call]
  val get_icon : t -> Icon.t [@@js.call]
  val get_label : t -> MarkerLabel.t [@@js.call]
  val get_map : t -> Map.t [@@js.call]
  val get_opacity : t -> float [@@js.call]
  val get_place : t -> MarkerPlace.t [@@js.call]
  val get_position : t -> LatLng.t [@@js.call]
  val get_shape : t -> MarkerShape.t [@@js.call]
  val get_title : t -> string [@@js.call]
  val get_visible : t -> bool [@@js.call]
  val get_z_index : t -> float [@@js.call]
  val set_animation : t -> animation -> unit [@@js.call]
  val set_attribution : t -> Attribution.t -> unit  [@@js.call]
  val set_clickable : t -> flag:bool -> unit [@@js.call]
  val set_cursor : t -> cursor:string -> unit [@@js.call]
  val set_draggable : t -> flag:bool -> unit [@@js.call]
  val set_icon : t -> Icon.t -> unit [@@js.call]
  val set_icon_string : t -> string -> unit [@@js.call "setIcon"]
  val set_icon_symbol : t -> Symbol.t -> unit [@@js.call "setIcon"]
  val set_label : t -> MarkerLabel.t -> unit [@@js.call]
  val set_label_string : t -> string -> unit [@@js.call "setLabel"]
  val set_map : t -> Map.t option -> unit [@@js.call]
  val set_map_streetview: t -> StreetViewPanorama.t -> unit [@@js.call "setMap"]
  val set_opacity : t -> float -> unit [@@js.call]
  val set_options : t -> MarkerOptions.t -> unit [@@js.call]
  val set_place : t -> MarkerPlace.t -> unit [@@js.call]
  val set_position : t -> LatLng.t -> unit [@@js.call]
  val set_shape : t -> MarkerShape.t -> unit [@@js.call]
  val set_title : t -> string -> unit [@@js.call]
  val set_visible : t -> bool -> unit [@@js.call]
  val set_z_index : t -> float -> unit [@@js.call]
  (** Added for polymorphism **)
  val t_to_js : t -> Ojs.t
  val t_of_js : Ojs.t -> t
end
[@js.scope "google.maps"]

module InfoWindowOptions: sig
  type t
  val create :
    ?content:string ->
    ?disable_auto_pan:bool ->
    ?max_width:float ->
    ?pixel_offset:Size.t ->
    ?position:LatLng.t ->
    ?z_index:float ->
    unit ->
    t
    [@@js.builder]
  val content: t -> string [@@js.get]
  val disable_auto_pan: t -> bool [@@js.get]
  val max_width: t -> float [@@js.get]
  val pixel_offset: t -> Size.t [@@js.get]
  val position: t -> LatLng.t [@@js.get]
  val z_index: t -> float [@@js.get]
  val set_content: t -> string -> unit [@@js.set]
  val set_disable_auto_pan: t -> bool -> unit [@@js.set]
  val set_max_width: t -> float -> unit [@@js.set]
  val set_pixel_offset: t -> Size.t -> unit [@@js.set]
  val set_position: t -> LatLng.t -> unit [@@js.set]
  val set_z_index: t -> float -> unit [@@js.set]
end

module InfoWindow: sig
  type t
  val new_info_window :
    ?opts:InfoWindowOptions.t ->
    unit ->
    t [@@js.new]
  val close : t -> unit [@@js.call]
  val get_content : t -> string [@@js.call]
  val get_position : t -> LatLng.t [@@js.call]
  val get_z_index : t -> float [@@js.call]
  val open' :
    t-> ?map:Map.t -> ?anchor:MVCObject.t -> unit -> unit [@@js.call "open"]
  val open_streetview:
    t ->
    ?map:StreetViewPanorama.t ->
    ?anchor:MVCObject.t ->
    unit ->
    unit [@@js.call "open"]
  val set_content : t -> string -> unit [@@js.call]
  val set_options : t -> InfoWindowOptions.t -> unit [@@js.call]
  val set_position : t -> LatLng.t -> unit [@@js.call]
  val set_z_index : t -> float -> unit [@@js.call]
end
[@js.scope "google.maps"]



module IconSequence: sig
  type t
  val create:
    ?fixed_rotation:bool ->
    ?icon:Symbol.t ->
    ?offset:string ->
    ?repeat:string ->
    unit ->
    t
    [@@js.builder]
  val fixed_rotation: t -> bool [@@js.get]
  val icon: t -> Symbol.t [@@js.get]
  val offset: t -> string [@@js.get]
  val repeat: t -> string [@@js.get]
  val set_fixed_rotation: t -> bool -> unit [@@js.set]
  val set_icon: t -> Symbol.t -> unit [@@js.set]
  val set_offset: t -> string -> unit [@@js.set]
  val set_repeat: t -> string -> unit [@@js.set]
end

module PolylineOptions: sig
  type t
  val create :
    ?clickable:bool ->
    ?draggable:bool ->
    ?editable:bool ->
    ?geodesic:bool ->
    ?icons:IconSequence.t list ->
    ?map:Map.t ->
    ?path:LatLng.t list ->
    ?stroke_color:string ->
    ?stroke_opacity:float ->
    ?stroke_weight:float ->
    ?visible:bool ->
    ?z_index:float ->
    unit ->
    t
    [@@js.builder]
  val clickable: t -> bool [@@js.get]
  val draggable: t -> bool [@@js.get]
  val editable: t -> bool [@@js.get]
  val geodesic: t -> bool [@@js.get]
  val icons: t -> IconSequence.t list [@@js.get]
  val map: t -> Map.t [@@js.get]
  val path: t -> LatLng.t list [@@js.get]
  val stroke_color: t -> string [@@js.get]
  val stroke_opacity: t -> float [@@js.get]
  val stroke_weight: t -> float [@@js.get]
  val visible: t -> bool [@@js.get]
  val z_index: t -> float [@@js.get]
  val set_clickable: t -> bool -> unit [@@js.set]
  val set_draggable: t -> bool -> unit [@@js.set]
  val set_editable: t -> bool -> unit [@@js.set]
  val set_geodesic: t -> bool -> unit [@@js.set]
  val set_icons: t -> IconSequence.t list -> unit [@@js.set]
  val set_map: t -> Map.t -> unit [@@js.set]
  val set_path: t -> LatLng.t list -> unit [@@js.set]
  val set_stroke_color: t -> string -> unit [@@js.set]
  val set_stroke_opacity: t -> float -> unit [@@js.set]
  val set_stroke_weight: t -> float -> unit [@@js.set]
  val set_visible: t -> bool -> unit [@@js.set]
  val set_z_index: t -> float -> unit [@@js.set]
end

module Polyline: sig
  type t
  val new_polyline : ?opts:PolylineOptions.t -> unit -> t [@@js.new]
  val get_draggable : t -> bool [@@js.call]
  val get_editable : t -> bool [@@js.call]
  val get_map : t -> Map.t [@@js.call]
  val get_path : t -> MVCArray.t [@@js.call] (* LatLng.t Array *)
  val get_visible : t -> bool [@@js.call]
  val set_draggable: t -> bool -> unit [@@js.call]
  val set_editable : t -> bool -> unit [@@js.call]
  val set_map : t -> Map.t option -> unit [@@js.call]
  val set_options : t -> PolylineOptions.t -> unit [@@js.call]
  val set_path : t -> LatLng.t list -> unit [@@js.call]
  val set_path_mvcarray : t -> MVCArray.t -> unit [@@js.call "setPath"]
  val set_visible : t -> bool -> unit [@@js.call]
end
[@js.scope "google.maps"]

(* Polygon *)
module PolyMouseEvent: sig
  type t
  val create:
    ?edge:int ->
    ?path:int ->
    ?vertex:int ->
    unit ->
    t
    [@@js.builder]
  val edge: t -> int [@@js.get]
  val path: t -> int [@@js.get]
  val vertex: t -> int [@@js.get]
  val set_edge: t -> int -> unit [@@js.set]
  val set_path: t -> int -> unit [@@js.set]
  val set_vertex: t -> int -> unit [@@js.set]
end

module PolygonOptions: sig
  type t
  val create :
    ?clickable:bool ->
    ?draggable:bool ->
    ?editable:bool ->
    ?fill_color:string ->
    ?fill_opacity:float ->
    ?geodesic:bool ->
    ?map:Map.t ->
    ?paths:LatLng.t list list ->
    ?stroke_color:string ->
    ?stroke_opacity:float ->
    ?stroke_weight:float ->
    ?visible:bool ->
    ?z_index:float ->
    unit ->
    t
    [@@js.builder]
  val clickable: t -> bool [@@js.get]
  val draggable: t -> bool [@@js.get]
  val editable: t -> bool [@@js.get]
  val fill_color: t -> string [@@js.get]
  val fill_opacity: t -> float [@@js.get]
  val geodesic: t -> bool [@@js.get]
  val map: t -> Map.t [@@js.get]
  val path: t -> LatLng.t list [@@js.get]
  val stroke_color: t -> string [@@js.get]
  val stroke_opacity: t -> float [@@js.get]
  val stroke_weight: t -> float [@@js.get]
  val visible: t -> bool [@@js.get]
  val z_index: t -> float [@@js.get]
  val set_clickable: t -> bool -> unit [@@js.set]
  val set_draggable: t -> bool -> unit [@@js.set]
  val set_editable: t -> bool -> unit [@@js.set]
  val set_fill_color: t -> string -> unit [@@js.set]
  val set_fill_opacity: t -> float -> unit [@@js.set]
  val set_geodesic: t -> bool -> unit [@@js.set]
  val set_map: t -> Map.t -> unit [@@js.set]
  val set_path: t -> LatLng.t list -> unit [@@js.set]
  val set_stroke_color: t -> string -> unit [@@js.set]
  val set_stroke_opacity: t -> float -> unit [@@js.set]
  val set_stroke_weight: t -> float -> unit [@@js.set]
  val set_visible: t -> bool -> unit [@@js.set]
  val set_z_index: t -> float -> unit [@@js.set]
end

module Polygon: sig
  type t
  val new_polygon:
    ?opts:PolygonOptions.t -> unit -> t [@@js.new]
  val get_draggable : t -> bool [@@js.call]
  val get_editable : t -> bool [@@js.call]
  val get_map : t -> Map.t [@@js.call]
  val get_path : t -> MVCArray.t [@@js.call] (* LatLng.t Array *)
  val get_paths : t -> MVCArray.t [@@js.call] (* LatLng.t Array Array *)
  val get_visible : t -> bool [@@js.call]
  val set_draggable: t -> bool -> unit [@@js.call]
  val set_editable : t -> bool -> unit [@@js.call]
  val set_map : t -> Map.t option -> unit [@@js.call]
  val set_options : t -> PolylineOptions.t -> unit [@@js.call]
  val set_path : t -> LatLng.t list -> unit [@@js.call]
  val set_path_mvcarray : t -> MVCArray.t -> unit [@@js.call "setPath"]
  val set_paths : t -> LatLng.t list list -> unit [@@js.call]
  val set_paths_mvcarray : t -> MVCArray.t -> unit [@@js.call "setPaths"]
  val set_visible : t -> bool -> unit [@@js.call]
end
[@js.scope "google.maps"]
(* End polygon *)

(* Rectangle *)
module RectangleOptions: sig
  type t
  val create :
    ?bounds:LatLngBounds.t ->
    ?clickable:bool ->
    ?draggable:bool ->
    ?editable:bool ->
    ?fill_color:string ->
    ?fill_opacity:float ->
    ?map:Map.t ->
    ?path:LatLng.t list ->
    ?stroke_color:string ->
    ?stroke_opacity:float ->
    ?stroke_position:stroke_position ->
    ?stroke_weight:float ->
    ?visible:bool ->
    ?z_index:float ->
    unit ->
    t
    [@@js.builder]
  val bounds: t -> LatLngBounds.t [@@js.get]
  val clickable: t -> bool [@@js.get]
  val draggable: t -> bool [@@js.get]
  val editable: t -> bool [@@js.get]
  val fill_color: t -> string [@@js.get]
  val fill_opacity: t -> float [@@js.get]
  val map: t -> Map.t [@@js.get]
  val path: t -> LatLng.t list [@@js.get]
  val stroke_color: t -> string [@@js.get]
  val stroke_opacity: t -> float [@@js.get]
  val stroke_position: t -> stroke_position [@@js.get]
  val stroke_weight: t -> float [@@js.get]
  val visible: t -> bool [@@js.get]
  val z_index: t -> float [@@js.get]
  val set_bounds: t -> LatLngBounds.t -> unit [@@js.set]
  val set_clickable: t -> bool -> unit [@@js.set]
  val set_draggable: t -> bool -> unit [@@js.set]
  val set_editable: t -> bool -> unit [@@js.set]
  val set_fill_color: t -> string -> unit [@@js.set]
  val set_fill_opacity: t -> float -> unit [@@js.set]
  val set_map: t -> Map.t -> unit [@@js.set]
  val set_path: t -> LatLng.t list -> unit [@@js.set]
  val set_stroke_color: t -> string -> unit [@@js.set]
  val set_stroke_opacity: t -> float -> unit [@@js.set]
  val set_stroke_position: t -> stroke_position -> unit [@@js.set]
  val set_stroke_weight: t -> float -> unit [@@js.set]
  val set_visible: t -> bool -> unit [@@js.set]
  val set_z_index: t -> float -> unit [@@js.set]
end

module Rectangle: sig
  type t
  val new_rectangle:
    ?opts:RectangleOptions.t -> unit -> t [@@js.new]
  val get_bounds : t -> LatLngBounds.t [@@js.call]
  val get_draggable : t -> bool [@@js.call]
  val get_editable : t -> bool [@@js.call]
  val get_map : t -> Map.t [@@js.call]
  val get_visible : t -> bool [@@js.call]
  val set_bounds : t -> LatLngBounds.t -> unit [@@js.call]
  val set_draggable: t -> bool -> unit [@@js.call]
  val set_editable : t -> bool -> unit [@@js.call]
  val set_map : t -> Map.t option -> unit [@@js.call]
  val set_options : t -> RectangleOptions.t -> unit [@@js.call]
  val set_visible : t -> bool -> unit [@@js.call]
end
[@js.scope "google.maps"]
(* End rectangle *)

(* Circle *)

module CircleOptions: sig
  type t
  val create:
    ?center:LatLng.t ->
    ?clickable:bool ->
    ?draggable:bool ->
    ?editable:bool ->
    ?fill_color:string ->
    ?fill_opacity:float ->
    ?map:Map.t ->
    ?radius:float ->
    ?stroke_color:string ->
    ?stroke_opacity:float ->
    ?stroke_position:stroke_position ->
    ?stroke_weight:float ->
    ?visible:bool ->
    ?z_index:int ->
    unit ->
    t
    [@@js.builder]
  val center: t -> LatLng.t [@@js.get]
  val clickable: t -> bool [@@js.get]
  val draggable: t -> bool [@@js.get]
  val editable: t -> bool [@@js.get]
  val fill_color: t -> string [@@js.get]
  val fill_opacity: t -> float [@@js.get]
  val map: t -> Map.t [@@js.get]
  val radius: t -> float [@@js.get]
  val stroke_color: t -> string [@@js.get]
  val stroke_opacity: t -> float [@@js.get]
  val stroke_position: t -> stroke_position [@@js.get]
  val stroke_weight: t -> float [@@js.get]
  val visible: t -> bool [@@js.get]
  val z_index: t -> int [@@js.get]
  val set_center: t -> LatLng.t -> unit [@@js.set]
  val set_clickable: t -> bool -> unit [@@js.set]
  val set_draggable: t -> bool -> unit [@@js.set]
  val set_editable: t -> bool -> unit [@@js.set]
  val set_fill_color: t -> string -> unit [@@js.set]
  val set_fill_opacity: t -> float -> unit [@@js.set]
  val set_map: t -> Map.t -> unit [@@js.set]
  val set_radius: t -> float -> unit [@@js.set]
  val set_stroke_color: t -> string -> unit [@@js.set]
  val set_stroke_opacity: t -> float -> unit [@@js.set]
  val set_stroke_position: t -> stroke_position -> unit [@@js.set]
  val set_stroke_weight: t -> float -> unit [@@js.set]
  val set_visible: t -> bool -> unit [@@js.set]
  val set_z_index: t -> int -> unit [@@js.set]
end

module Circle: sig
  type t
  val new_circle: ?opts:CircleOptions.t -> unit -> t [@@js.new]
  val get_bounds: t -> LatLngBounds.t [@@js.call]
  val get_center: t -> LatLng.t [@@js.call]
  val get_draggable: t -> bool [@@js.call]
  val get_editable: t -> bool [@@js.call]
  val get_map: t -> Map.t [@@js.call]
  val get_radius: t -> float [@@js.call]
  val get_visible: t -> bool [@@js.call]
  val set_center: t -> LatLng.t -> unit [@@js.call]
  val set_draggable: t -> bool -> unit [@@js.call]
  val set_editable: t -> bool -> unit [@@js.call]
  val set_map: t -> Map.t -> unit [@@js.call]
  val set_options: t -> CircleOptions.t -> unit [@@js.call]
  val set_radius: t -> float -> unit [@@js.call]
  val set_visible: t -> bool -> unit [@@js.call]
end
[@js.scope "google.maps"]
(* End Circle *)

(* Events *)
module MouseEvent: sig
  type t
  val new_mouse_event : unit -> t [@@js.new]
  val stop : t -> unit -> unit [@@js.call]
  val lat_lng : t -> LatLng.t [@@js.get]
  val set_lat_lng : t -> LatLng.t -> unit [@@js.set]
end
[@js.scope "google.maps"]

module Event: sig
  val add_dom_listener :
    Ojs.t -> string ->
    (MouseEvent.t -> unit) ->
    ?capture:bool ->
    unit ->
    MapsEventListener.t
    [@@js.global "google.maps.event.addDomListener"]

  val add_dom_listener_once :
    Ojs.t -> string ->
    (MouseEvent.t -> unit) ->
    ?capture:bool ->
    unit ->
    MapsEventListener.t
    [@@js.global "google.maps.event.addDomListenerOnce"]

  val add_listener :
    Ojs.t -> string -> (MouseEvent.t -> unit) ->
    MapsEventListener.t
    [@@js.global "google.maps.event.addListener"]

  val add_listener_once :
    Ojs.t -> string -> (MouseEvent.t -> unit) ->
    MapsEventListener.t
    [@@js.global "google.maps.event.addListenerOnce"]

  val clear_instance_listeners :
    Ojs.t -> unit
    [@@js.global "google.maps.event.clearInstanceListeners"]

  val clear_listeners :
    Ojs.t -> string -> unit
    [@@js.global "google.maps.event.clearListeners"]

  val remove_listener :
    MapsEventListener.t -> unit
    [@@js.global "google.maps.event.removeListener"]

  val trigger : Ojs.t -> string -> ?mousevent:MouseEvent.t -> unit -> unit
    [@@js.global "google.maps.event.trigger"]
end
(* End events *)

(* Geocoding *)
module GeocoderComponentRestrictions: sig
  type t
  val create:
    ?administrative_area:string ->
    ?country:string ->
    ?locality:string ->
    ?postal_code:string ->
    ?route:string ->
    unit ->
    t
    [@@js.builder]
  val administrative_area: t -> string [@@js.get]
  val country: t -> string [@@js.get]
  val locality: t -> string [@@js.get]
  val postal_code: t -> string [@@js.get]
  val route: t -> string [@@js.get]
  val set_administrative_area: t -> string -> unit [@@js.set]
  val set_country: t -> string -> unit [@@js.set]
  val set_locality: t -> string -> unit [@@js.set]
  val set_postal_code: t -> string -> unit [@@js.set]
  val set_route: t -> string -> unit [@@js.set]
end

module GeocoderRequest: sig
  type t
  val create:
    ?address:string ->
    ?bounds:LatLngBounds.t ->
    ?component_restrictions:GeocoderComponentRestrictions.t ->
    ?location:LatLng.t ->
    ?place_id:string ->
    ?region:string ->
    unit ->
    t
    [@@js.builder]
end

module GeocoderAddressComponent: sig
  type t
  val create :
    ?long_name:string ->
    ?short_name:string ->
    ?types:string list ->
    unit -> t
    [@@js.verbatim_names]
    [@@js.builder]
  val long_name: t -> string [@@js.verbatim_names]
  val short_name: t -> string [@@js.verbatim_names]
  val types: t -> string list [@@js.verbatim_names]
  val set_long_name: t -> string -> unit [@@js.verbatim_names]
  val set_short_name: t -> string -> unit [@@js.verbatim_names]
  val set_types: t -> string list -> unit [@@js.verbatim_names]
end

module GeocoderGeometry: sig
  type t
  val create:
    ?bounds: LatLngBounds.t ->
    ?location: LatLng.t ->
    ?location_type: geocoder_location_type ->
    ?viewport: LatLngBounds.t ->
    unit ->
    t
    [@@js.verbatim_names]
    [@@js.builder]
    val bounds: t ->  LatLngBounds.t [@@js.verbatim_names]
    val location: t ->  LatLng.t [@@js.verbatim_names]
    val location_type: t ->  geocoder_location_type [@@js.verbatim_names]
    val viewport: t ->  LatLngBounds.t [@@js.verbatim_names][@@js.get]
    val set_bounds: t ->  LatLngBounds.t -> unit [@@js.verbatim_names]
    val set_location: t ->  LatLng.t -> unit [@@js.verbatim_names]
    val set_location_type:
      t ->  geocoder_location_type -> unit [@@js.verbatim_names]
    val set_viewport: t ->  LatLngBounds.t -> unit [@@js.verbatim_names]
end

module GeocoderResult: sig
  type t
  val create :
    ?address_components:GeocoderAddressComponent.t ->
    ?formatted_address:string ->
    ?geometry:GeocoderGeometry.t ->
    ?partial_match:bool ->
    ?place_id:string ->
    ?postcode_localities:string list ->
    ?types:string list ->
    unit ->
    t
    [@@js.verbatim_names]
    [@@js.builder]
  val address_components:
    t -> GeocoderAddressComponent.t list [@@js.verbatim_names]
  val formatted_address: t -> string [@@js.verbatim_names]
  val geometry: t -> GeocoderGeometry.t [@@js.verbatim_names]
  val partial_match: t -> bool [@@js.verbatim_names]
  val place_id: t -> string [@@js.verbatim_names]
  val postcode_localities: t -> string list [@@js.verbatim_names]
  val types: t -> string list [@@js.verbatim_names]
  val set_address_components:
    t -> GeocoderAddressComponent.t -> unit [@@js.verbatim_names]
  val set_formatted_address: t -> string -> unit [@@js.verbatim_names]
  val set_geometry: t -> GeocoderGeometry.t -> unit [@@js.verbatim_names]
  val set_partial_match: t -> bool -> unit [@@js.verbatim_names]
  val set_place_id: t -> string -> unit [@@js.verbatim_names]
  val set_postcode_localities: t -> string list -> unit [@@js.verbatim_names]
  val set_types: t -> string list -> unit [@@js.verbatim_names]
end

module Geocoder: sig
  type t
  val new_geocoder : unit -> t [@@js.new]
  val geocode :
    t -> GeocoderRequest.t ->
    (GeocoderResult.t list option -> geocoder_status -> unit) ->
    unit [@@js.call]
end
[@js.scope "google.maps"]
(* End geocoding *)

(* Distance, time, distance *)
module Time: sig
  type t
  val create:
    ?text:string ->
    ?time_zone:string ->
    ?value:Converter.Date.t->
    unit ->
    t
    [@@js.verbatim_names]
    [@@js.builder]
  val text: t -> string  [@@js.verbatim_names]
  val time_zone: t -> string  [@@js.verbatim_names]
  val value: t -> Converter.Date.t [@@js.verbatim_names]
  val set_text: t -> string -> unit [@@js.verbatim_names]
  val set_time_zone: t -> string -> unit [@@js.verbatim_names]
  val set_value: t -> Converter.Date.t-> unit [@@js.verbatim_names]
end

module Duration: sig
  type t
  val create:
    ?text:string ->
    ?value:float ->
    unit ->
    t
    [@@js.builder]
  val text: t -> string [@@js.get]
  val value: t -> float [@@js.get]
  val set_text: t -> string -> unit [@@js.set]
  val set_value: t -> float -> unit [@@js.set]
end

module Distance: sig
  type t
  val create:
    ?text:string ->
    ?value:float ->
    unit ->
    t
    [@@js.builder]
  val text: t -> string [@@js.get]
  val value: t -> float [@@js.get]
  val set_text: t -> string -> unit [@@js.set]
  val set_value: t -> float -> unit [@@js.set]
end
(* End *)

(* Transit *)
module TransitVehicle: sig
  type t
  val create:
    ?icon:string ->
    ?local_icon:string ->
    ?name:string ->
(*    ?type':VehicleType.t ->    *)
    unit ->
    t
    [@@js.builder]
end

module TransitAgency:sig
  type t
  val create:
    ?name:string ->
    ?phone:string ->
    ?url:string ->
    unit ->
    t
    [@@js.builder]
  val name: t -> string [@@js.get]
  val phone: t -> string [@@js.get]
  val url: t -> string [@@js.get]
  val set_name: t -> string -> unit [@@js.set]
  val set_phone: t -> string -> unit [@@js.set]
  val set_url: t -> string -> unit [@@js.set]
end

module TransitStop:sig
  type t
  val create:
    ?location:LatLng.t ->
    ?name:string ->
    unit ->
    t
    [@@js.builder]
  val location: t -> LatLng.t [@@js.get]
  val name: t -> string [@@js.get]
  val set_location: t -> LatLng.t -> unit [@@js.set]
  val set_name: t -> string -> unit [@@js.set]
end

module TransitLine: sig
  type t
  val create:
    ?agencies:TransitAgency.t list ->
    ?color:string ->
    ?icon:string ->
    ?name:string ->
    ?short_name:string ->
    ?text_color:string ->
    ?url:string ->
    ?vehicle:TransitVehicle.t ->
    unit ->
    t [@@js.builder]
  val agencies: t -> TransitAgency.t list [@@js.get]
  val color: t -> string [@@js.get]
  val icon: t -> string [@@js.get]
  val name: t -> string [@@js.get]
  val short_name: t -> string [@@js.get]
  val text_color: t -> string [@@js.get]
  val url: t -> string [@@js.get]
  val vehicle: t -> TransitVehicle.t [@@js.get]
  val set_agencies: t -> TransitAgency.t list -> unit [@@js.set]
  val set_color: t -> string -> unit [@@js.set]
  val set_icon: t -> string -> unit [@@js.set]
  val set_name: t -> string -> unit [@@js.set]
  val set_short_name: t -> string -> unit [@@js.set]
  val set_text_color: t -> string -> unit [@@js.set]
  val set_url: t -> string -> unit [@@js.set]
  val set_vehicle: t -> TransitVehicle.t -> unit [@@js.set]
end

module TransitDetails: sig
  type t
  val create:
    ?arrival_stop:TransitStop.t ->
    ?arrival_time:Time.t ->
    ?departure_stop:TransitStop.t ->
    ?departure_time:Time.t ->
    ?headsign:string ->
    ?headway:float ->
    ?line:TransitLine.t ->
    ?num_stops:float ->
    unit ->
    t
    [@@js.builder]
  val arrival_stop: t -> TransitStop.t [@@js.get]
  val arrival_time: t -> Time.t [@@js.get]
  val departure_stop: t -> TransitStop.t [@@js.get]
  val departure_time: t -> Time.t [@@js.get]
  val headsign: t -> string [@@js.get]
  val headway: t -> float [@@js.get]
  val line: t -> TransitLine.t [@@js.get]
  val num_stops: t -> float [@@js.get]
  val set_arrival_stop: t -> TransitStop.t -> unit [@@js.set]
  val set_arrival_time: t -> Time.t -> unit [@@js.set]
  val set_departure_stop: t -> TransitStop.t -> unit [@@js.set]
  val set_departure_time: t -> Time.t -> unit [@@js.set]
  val set_headsign: t -> string -> unit [@@js.set]
  val set_headway: t -> float -> unit [@@js.set]
  val set_line: t -> TransitLine.t -> unit [@@js.set]
  val set_num_stops: t -> float -> unit [@@js.set]
end
(* End transit *)

(* Direction *)
(* WARNING VERBATIM NAMES *)
module DirectionsStep:sig
  type t
  val create:
    ?distance:Distance.t ->
    ?duration:Duration.t ->
    ?end_location:LatLng.t ->
    ?instructions:string ->
    ?path:LatLng.t list ->
    ?start_location:LatLng.t ->
    ?steps:t list ->
    ?transit:TransitDetails.t ->
    ?travel_mode:travel_mode ->
    unit ->
    t
    [@@js.verbatim_names]
    [@@js.builder]
  val distance: t -> Distance.t
  val duration: t -> Duration.t
  val end_location: t -> LatLng.t [@@js.verbatim_names]
  val instructions: t -> string
  val path: t -> LatLng.t list
  val start_location: t -> LatLng.t [@@js.verbatim_names]
  val steps: t -> t list
  val transit: t -> TransitDetails.t
  val travel_mode: t -> travel_mode [@@js.verbatim_names]
  val set_distance: t -> Distance.t -> unit
  val set_duration: t -> Duration.t -> unit
  val set_end_location: t -> LatLng.t -> unit [@@js.verbatim_names]
  val set_instructions: t -> string -> unit [@@js.verbatim_names]
  val set_path: t -> LatLng.t list -> unit
  val set_start_location: t -> LatLng.t -> unit [@@js.verbatim_names]
  val set_steps: t -> t list -> unit
  val set_transit: t -> TransitDetails.t -> unit
  val set_travel_mode: t -> travel_mode -> unit [@@js.verbatim_names]
end

module DirectionsGeocodedWaypoint: sig
  type t
  val create:
    ?partial_match:bool ->
    ?place_id:string ->
    ?types:string list ->
    unit ->
    t
    [@@js.verbatim_names]
    [@@js.builder]
  val partial_match: t -> bool [@@js.verbatim_names]
  val place_id: t -> string [@@js.verbatim_names]
  val types: t -> string list
  val set_partial_match: t -> bool -> unit [@@js.verbatim_names]
  val set_place_id: t -> string -> unit [@@js.verbatim_names]
  val set_types: t -> string list -> unit
end

module DirectionsLeg: sig
  type t
  val create:
    ?arrival_time:Time.t ->
    ?departure_time:Time.t ->
    ?distance:Distance.t ->
    ?duration:Duration.t ->
    ?duration_in_traffic:Duration.t ->
    ?end_address:string ->
    ?end_location:LatLng.t ->
    ?start_address:string ->
    ?start_location:LatLng.t ->
    ?steps:DirectionsStep.t list ->
    ?via_waypoints:LatLng.t list ->
    unit ->
    t
    [@@js.verbatim_names]
    [@@js.builder]
  val arrival_time: t -> Time.t [@@js.verbatim_names]
  val departure_time: t -> Time.t [@@js.verbatim_names]
  val distance: t -> Distance.t
  val duration: t -> Duration.t
  val duration_in_traffic: t -> Duration.t [@@js.verbatim_names]
  val end_address: t -> string [@@js.verbatim_names]
  val end_location: t -> LatLng.t [@@js.verbatim_names]
  val start_address: t -> string [@@js.verbatim_names]
  val start_location: t -> LatLng.t [@@js.verbatim_names]
  val steps: t -> DirectionsStep.t list
  val via_waypoints: t -> LatLng.t list [@@js.verbatim_names]
  val set_arrival_time: t -> Time.t -> unit [@@js.verbatim_names]
  val set_departure_time: t -> Time.t -> unit [@@js.verbatim_names]
  val set_distance: t -> Distance.t -> unit [@@js.verbatim_names]
  val set_duration: t -> Duration.t -> unit [@@js.verbatim_names]
  val set_duration_in_traffic: t -> Duration.t -> unit [@@js.verbatim_names]
  val set_end_address: t -> string -> unit [@@js.verbatim_names]
  val set_end_location: t -> LatLng.t -> unit [@@js.verbatim_names]
  val set_start_address: t -> string -> unit [@@js.verbatim_names]
  val set_start_location: t -> LatLng.t -> unit [@@js.verbatim_names]
  val set_steps: t -> DirectionsStep.t list -> unit [@@js.verbatim_names]
  val set_via_waypoints: t -> LatLng.t list -> unit [@@js.verbatim_names]
end

module DirectionsRoute: sig
  type t
  val create:
(*    ?fare:TransitFare.t ->*)
    ?bounds:LatLngBounds.t ->
    ?copyrights:string ->
    ?legs:DirectionsLeg.t list ->
    ?overview_path:LatLng.t list ->
    ?overview_polyline:string ->
    ?warnings:string list ->
    ?waypoint_order:int list ->
    unit ->
    t
    [@@js.verbatim_names]
    [@@js.builder]
  val bounds: t -> LatLngBounds.t
  val copyrights: t -> string
  val legs: t -> DirectionsLeg.t list
  val overview_path: t -> LatLng.t list [@@js.verbatim_names]
  val overview_polyline: t -> string [@@js.verbatim_names]
  val warnings: t -> string list
  val waypoint_order: t -> int list [@@js.verbatim_names]
  val set_bounds: t -> LatLngBounds.t -> unit
  val set_copyrights: t -> string -> unit
  val set_legs: t -> DirectionsLeg.t list -> unit
  val set_overview_path: t -> LatLng.t list -> unit [@@js.verbatim_names]
  val set_overview_polyline: t -> string -> unit [@@js.verbatim_names]
  val set_warnings: t -> string list -> unit
  val set_waypoint_order: t -> int list -> unit [@@js.verbatim_names]
end

module DirectionsResult: sig
  type t
  val create:
    ?geocoded_waypoints:DirectionsGeocodedWaypoint.t list ->
    ?routes:DirectionsRoute.t list ->
    unit ->
    t
    [@@js.builder]
  val geocoded_waypoints:
    t -> DirectionsGeocodedWaypoint.t list [@@js.get]
  val routes: t -> DirectionsRoute.t list [@@js.get]
  val set_geocoded_waypoints:
    t -> DirectionsGeocodedWaypoint.t list -> unit [@@js.set]
  val set_routes: t -> DirectionsRoute.t list -> unit [@@js.set]
end

module DirectionsRendererOptions: sig
  type t
  val create:
    ?directions:DirectionsResult.t ->
    ?draggable:bool ->
    ?hide_route_list:bool ->
    ?info_window:InfoWindow.t ->
    ?map:Map.t ->
    ?marker_options:MarkerOptions.t ->
    ?panel:Ojs.t ->
    ?polyline_options:PolylineOptions.t ->
    ?preserve_viewport:bool ->
    ?route_index:int ->
    ?suppress_bicycling_layer:bool ->
    ?suppress_info_windows:bool ->
    ?suppress_markers:bool ->
    ?suppress_polylines:bool ->
    unit ->
    t
    [@@js.verbatim_names]
    [@@js.builder]
  val directions: t -> DirectionsResult.t
  val draggable: t -> bool
  val hide_route_list: t -> bool [@@js.verbatim_names]
  val info_window: t -> InfoWindow.t [@@js.verbatim_names]
  val map: t -> Map.t
  val marker_options: t -> MarkerOptions.t [@@js.verbatim_names]
  val panel: t -> Ojs.t
  val polyline_options: t -> PolylineOptions.t [@@js.verbatim_names]
  val preserve_viewport: t -> bool [@@js.verbatim_names]
  val route_index: t -> int [@@js.verbatim_names]
  val suppress_bicycling_layer: t -> bool [@@js.verbatim_names]
  val suppress_info_windows: t -> bool [@@js.verbatim_names]
  val suppress_markers: t -> bool [@@js.verbatim_names]
  val suppress_polylines: t -> bool [@@js.verbatim_names]
  val set_directions: t -> DirectionsResult.t -> unit
  val set_draggable: t -> bool -> unit
  val set_hide_route_list: t -> bool -> unit [@@js.verbatim_names]
  val set_info_window: t -> InfoWindow.t -> unit [@@js.verbatim_names]
  val set_map: t -> Map.t -> unit
  val set_marker_options: t -> MarkerOptions.t -> unit [@@js.verbatim_names]
  val set_panel: t -> Ojs.t -> unit
  val set_polyline_options: t -> PolylineOptions.t -> unit [@@js.verbatim_names]
  val set_preserve_viewport: t -> bool -> unit [@@js.verbatim_names]
  val set_route_index: t -> int -> unit [@@js.verbatim_names]
  val set_suppress_bicycling_layer: t -> bool -> unit [@@js.verbatim_names]
  val set_suppress_info_windows: t -> bool -> unit [@@js.verbatim_names]
  val set_suppress_markers: t -> bool -> unit [@@js.verbatim_names]
  val set_suppress_polylines: t -> bool -> unit [@@js.verbatim_names]
end

module DirectionsRenderer: sig
  type t
  val new_direction_renderer:
    opts:DirectionsRendererOptions.t ->
    unit ->
    t [@@js.new]
  val get_directions : t -> DirectionsResult.t
  val get_map : t -> Map.t
  val get_panel : t -> Ojs.t
  val get_route_index : t -> int
  val set_directions : t -> DirectionsResult.t -> unit
  val set_map : t -> Map.t -> unit
  val set_options : t -> DirectionsRendererOptions.t -> unit
  val set_panel : t -> Ojs.t -> unit
  val set_route_index : t -> int -> unit
end
[@js.scope "google.maps"]

type traffic_model =
  | Best_guess  [@js "bestguess"]
  | Optimistic  [@js "optimistic"]
  | Pessimistic [@js "pessimistic"]
  [@@ js.enum]

(* Transit *)
type transit_mode =
  | Bus    [@js "BUS"]
  | Rail   [@js "RAIL"]
  | Subway [@js "SUBWAY"]
  | Train  [@js "TRAIN"]
  | Tram   [@js "TRAM"]
  [@@ js.enum]

type transit_route_preference =
  | Less_walking    [@js "LESS_WALKING"]
  | Fewer_transfers [@js "FEWER_TRANSFERS"]
  [@@ js.enum]

type unit_system =
  | Metric [@js 0]
  | Imperial [@js 1]
  [@@ js.enum]

module TransitLayer: sig
  type t
  val new_transit_layer: unit -> t [@@js.new]
  val get_map: t -> Map.t [@@js.call]
  val set_map: t -> Map.t -> unit [@@js.call]
end
[@js.scope "google.maps"]

module TransitOptions: sig
  type t
  val create:
    ?arrival_time:Converter.Date.t ->
    ?departure_time:Converter.Date.t ->
    ?modes:transit_mode list ->
    ?routing_preference:transit_route_preference ->
    unit ->
    t
    [@@js.builder]
  val arrival_time: t -> Converter.Date.t
  val departure_time: t -> Converter.Date.t
  val modes: t -> transit_mode list
  val routing_preference: t -> transit_route_preference
  val set_arrival_time: t -> Converter.Date.t -> unit
  val set_departure_time: t -> Converter.Date.t -> unit
  val set_modes: t -> transit_mode list -> unit
  val set_routing_preference: t -> transit_route_preference -> unit
end
(* End transit *)


module DrivingOptions: sig
  type t
  val create:
    ?departure_time:Converter.Date.t ->
    ?traffic_model:traffic_model ->
    unit ->
    t
    [@@js.builder]
end

module DirectionsWaypoint: sig
  type t
  val create:
    ?location:LatLng.t ->
    ?stopover:bool ->
    unit ->
    t
    [@@js.builder]
  val location: t -> LatLng.t [@@js.get]
  val stopover: t -> bool [@@js.get]
  val set_location: t -> LatLng.t -> unit [@@js.set]
  val set_stopover: t -> bool -> unit [@@js.set]
end

module DirectionsRequest: sig
  type t
    (* WARNING : many arguments *)
  val create:
    ?avoid_ferries:bool ->
    ?avoid_highways:bool ->
    ?avoid_tolls:bool ->
    ?destination:LatLng.t ->
    ?driving_options:DrivingOptions.t ->
    ?optimize_waypoints:bool ->
    ?origin:LatLng.t ->
    ?provide_route_alternatives:bool ->
    ?region:string ->
    ?transit_options:TransitOptions.t ->
    ?travel_mode:travel_mode ->
    ?unit_system:unit_system ->
    ?waypoints:DirectionsWaypoint.t list ->
    unit ->
    t
    [@@js.builder]
  val avoid_ferries: t -> bool
  val avoid_highways: t -> bool
  val avoid_tolls: t -> bool
  val destination: t -> LatLng.t
  val driving_options: t -> DrivingOptions.t
  val optimize_waypoints: t -> bool
  val origin: t -> LatLng.t
  val provide_route_alternatives: t -> bool
  val region: t -> string
  val transit_options: t -> TransitOptions.t
  val travel_mode: t -> travel_mode
  val unit_system: t -> unit_system
  val waypoints: t -> DirectionsWaypoint.t list
  val set_avoid_ferries: t -> bool -> unit
  val set_avoid_highways: t -> bool -> unit
  val set_avoid_tolls: t -> bool -> unit
  val set_destination: t -> LatLng.t -> unit
  val set_driving_options: t -> DrivingOptions.t -> unit
  val set_optimize_waypoints: t -> bool -> unit
  val set_origin: t -> LatLng.t -> unit
  val set_provide_route_alternatives: t -> bool -> unit
  val set_region: t -> string -> unit
  val set_transit_options: t -> TransitOptions.t -> unit
  val set_travel_mode: t -> travel_mode -> unit
  val set_unit_system: t -> unit_system -> unit
  val set_waypoints: t -> DirectionsWaypoint.t list -> unit
end

type directions_status =
  | Ok                     [@js "OK"]
  | Unknown_error          [@js "UNKNOWN_ERROR"]
  | Over_query_limit       [@js "OVER_QUERY_LIMIT"]
  | Request_denied         [@js "REQUEST_DENIED"]
  | Invalid_request        [@js "INVALID_REQUEST"]
  | Zero_results           [@js "ZERO_RESULTS"]
  | Max_waypoints_exceeded [@js "MAX_WAYPOINTS_EXCEEDED"]
  | Not_found              [@js "NOT_FOUND"]
  [@@ js.enum]

module DirectionsService: sig
  type t
  val new_directions_service: unit -> t [@@js.new]
  val route: DirectionsRequest.t ->
    (DirectionsResult.t ->
     directions_status ->
     unit) ->
    unit [@@js.call]
end
[@js.scope "google.maps"]
(* End direction *)

(* Place *)
module PlaceAspectRating: sig
  type t
  val create:
    ?rating:int ->
    ?type':(string [@js "type"]) ->
    unit ->
    t
    [@@js.builder]
  val rating: t -> int [@@js.get]
  val type': t -> string [@@js.get "type"]
  val set_rating: t -> int -> unit [@@js.set]
  val set_type': t -> string -> unit [@@js.set "type"]
end

module PhotoOptions: sig
  type t
  val create:
    ?max_height: int ->
    ?max_width: int ->
    unit ->
    t
    [@@js.builder]
  val max_height: t ->  int [@@js.get]
  val max_width: t ->  int [@@js.get]
  val set_max_height: t ->  int -> unit [@@js.set]
  val set_max_width: t ->  int -> unit [@@js.set]
end

module PlaceReview: sig
  type t
  val create:
    ?aspects:PlaceAspectRating.t ->
    ?author_name:string ->
    ?author_url:string ->
    ?language:string ->
    ?text:string ->
    unit ->
    t
    [@@js.verbatim_names]
    [@@js.builder]
  val aspects: t -> PlaceAspectRating.t
  val author_name: t -> string [@@js.verbatim_names]
  val author_url: t -> string [@@js.verbatim_names]
  val language: t -> string
  val text: t -> string
  val set_aspects: t -> PlaceAspectRating.t -> unit
  val set_author_name: t -> string -> unit [@@js.verbatim_names]
  val set_author_url: t -> string -> unit [@@js.verbatim_names]
  val set_language: t -> string -> unit
  val set_text: t -> string -> unit
end

module PlacePhoto: sig
  type t
  val new_place_photo: unit -> t [@@js.new]
  val get_url: t -> PhotoOptions.t -> string [@@js.call]
  val height: t -> int [@@js.get]
  val html_attributions: t -> string list [@@js.verbatim_names]
  val width: t -> int [@@js.get]
  val set_height: t -> int -> unit [@@js.set]
  val set_html_attributions: t -> int -> unit
    [@@js.verbatim_names]
  val set_width: t -> int -> unit [@@js.set]
end
[@js.scope "google.maps.places"]

module PlaceGeometry: sig
  type t
  val create:
    ?location:LatLng.t ->
    ?viewport:LatLngBounds.t ->
    unit ->
    t
    [@@js.builder]
  val location: t -> LatLng.t [@@js.get]
  val viewport: t -> LatLngBounds.t [@@js.get]
  val set_location: t -> LatLng.t -> unit [@@js.set]
  val set_viewport: t -> LatLngBounds.t -> unit [@@js.set]
end

module PlaceResult: sig
  type t
  val create:
    ?address_components:GeocoderAddressComponent.t list ->
    ?aspects:PlaceAspectRating.t list ->
    ?formatted_address:string ->
    ?formatted_phone_number:string ->
    ?geometry:PlaceGeometry.t ->
    ?html_attributions:string list ->
    ?icon:string ->
    ?international_phone_number:string ->
    ?name:string ->
    ?permanently_closed:bool ->
    ?photos:PlacePhoto.t list ->
    ?place_id:string ->
    ?price_level:int ->
    ?rating:float ->
    ?reviews:PlaceReview.t ->
    ?types:string list ->
    ?url:string ->
    ?utc_offset:int ->
    ?vicinity:string ->
    ?website:string ->
    unit ->
    t
    [@@js.builder]
  val address_components:
    t -> GeocoderAddressComponent.t list [@@js.get "address_components"]
  val aspects: t -> PlaceAspectRating.t list [@@js.get]
  val formatted_address: t -> string [@@js.get "formatted_address"]
  val formatted_phone_number: t -> string [@@js.get "formatted_phone_number"]
  val geometry: t -> PlaceGeometry.t [@@js.get]
  val html_attributions: t -> string list [@@js.get "html_attributions"]
  val icon: t -> string [@@js.get]
  val international_phone_number:
    t -> string [@@js.get "international_phone_number"]
  val name: t -> string [@@js.get]
  val permanently_closed: t -> bool [@@js.get "permanently_closed"]
  val photos: t -> PlacePhoto.t list [@@js.get]
  val place_id: t -> string [@@js.get "place_id"]
  val price_level: t -> int [@@js.get "price_level"]
  val rating: t -> float [@@js.get]
  val reviews: t -> PlaceReview.t [@@js.get]
  val types: t -> string list [@@js.get]
  val url: t -> string [@@js.get]
  val utc_offset: t -> int [@@js.get "utc_offset"]
  val vicinity: t -> string [@@js.get]
  val website: t -> string [@@js.get]
  val set_address_components:
    t -> GeocoderAddressComponent.t list -> unit [@@js.set]
  val set_aspects: t -> PlaceAspectRating.t list -> unit [@@js.set]
  val set_formatted_address:
    t -> string -> unit [@@js.set "formatted_address"]
  val set_formatted_phone_number:
    t -> string -> unit [@@js.set "formatted_phone_number"]
  val set_geometry: t -> PlaceGeometry.t -> unit [@@js.set]
  val set_html_attributions:
    t -> string list -> unit [@@js.set "html_attributions"]
  val set_icon: t -> string -> unit [@@js.set]
  val set_international_phone_number:
    t -> string -> unit [@@js.set "international_phone_number"]
  val set_name: t -> string -> unit [@@js.set]
  val set_permanently_closed:
    t -> bool -> unit [@@js.set "permanently_closed"]
  val set_photos: t -> PlacePhoto.t list -> unit [@@js.set]
  val set_place_id: t -> string -> unit [@@js.set "place_id"]
  val set_price_level: t -> int -> unit [@@js.set "price_level"]
  val set_rating: t -> float -> unit [@@js.set]
  val set_reviews: t -> PlaceReview.t -> unit [@@js.set]
  val set_types: t -> string list -> unit [@@js.set]
  val set_url: t -> string -> unit [@@js.set]
  val set_utc_offset: t -> int -> unit [@@js.set "utc_offset"]
  val set_vicinity: t -> string -> unit [@@js.set]
  val set_website: t -> string -> unit [@@js.set]
end

module AutocompleteSessionToken : sig
  type t
  val new_autocomplete_session_token : unit -> t [@@js.new]
end
[@js.scope "google.maps.places"]

module PlaceDetailsRequest: sig
  type t
  val create:
    ?place_id:string ->
    ?fields:string list ->
    ?session_token:AutocompleteSessionToken.t ->
    unit ->
    t
    [@@js.builder]
  val place_id : t -> string [@@js.get]
  val set_place_id : t -> string -> unit [@@js.set]
end

module Place: sig
  type t
  val create:
    ?location:LatLng.t ->
    ?place_id:string ->
    ?query:string ->
    unit ->
    t
    [@@js.builder]
  val location: t -> LatLng.t [@@js.get]
  val place_id: t -> string [@@js.get]
  val query: t -> string [@@js.get]
  val set_location: t -> LatLng.t -> unit [@@js.set]
  val set_place_id: t -> string -> unit [@@js.set]
  val set_query: t -> string -> unit [@@js.set]
end

module PlaceSearchPagination: sig
  type t
  val new_place_search_pagination: unit -> t [@@js.new]
  val next_page : t -> unit -> unit [@@js.call]
  val has_next_page : t -> bool [@@js.get]
  val set_has_next_page : t -> bool -> unit [@@js.set]
end
[@js.scope "google.maps.places"]

type rank_by =
  | Prominence [@js 0]
  | Distance   [@js 1]
  [@@ js.enum]

module PlaceSearchRequest: sig
  type t
  val create:
    ?bounds:LatLngBounds.t ->
    ?keyword:string ->
    ?location:LatLng.t ->
    ?max_price_level:float ->
    ?min_price_level:float ->
    ?name:string ->
    ?open_now:bool ->
    ?radius:float ->
    ?rank_by:rank_by ->
    ?type':(string [@js "type"]) ->
    unit ->
    t
    [@@js.builder]
  val bounds: t -> LatLngBounds.t
  val keyword: t -> string
  val location: t -> LatLng.t
  val max_price_level: t -> float
  val min_price_level: t -> float
  val name: t -> string
  val open_now: t -> bool
  val radius: t -> float
  val rank_by: t -> rank_by
  val type': t -> string [@@js.get "type"]
  val set_bounds: t -> LatLngBounds.t -> unit
  val set_keyword: t -> string -> unit
  val set_location: t -> LatLng.t -> unit
  val set_max_price_level: t -> float -> unit
  val set_min_price_level: t -> float -> unit
  val set_name: t -> string -> unit
  val set_open_now: t -> bool -> unit
  val set_radius: t -> float -> unit
  val set_rank_by: t -> rank_by -> unit
  val set_type': t -> string -> unit [@@js.set "type"]
end

type places_service_status =
  | Ok               [@js "OK"]
  | Unknown_error    [@js "UNKNOWN_ERROR"]
  | Over_query_limit [@js "OVER_QUERY_LIMIT"]
  | Request_denied   [@js "REQUEST_DENIED"]
  | Invalid_request  [@js "INVALID_REQUEST"]
  | Zero_results     [@js "ZERO_RESULTS"]
  | Not_found        [@js "NOT_FOUND"]
  [@@ js.enum]

module RadarSearchRequest: sig
  type t
  val create:
    ?bounds:LatLngBounds.t ->
    ?keyword:string ->
    ?location:LatLng.t ->
    ?name:string ->
    ?radius:float ->
    ?type':(string [@js "type"]) ->
    unit ->
    t
    [@@js.builder]
  val bounds: t -> LatLngBounds.t
  val keyword: t -> string
  val location: t -> LatLng.t
  val name: t -> string
  val radius: t -> float
  val type': t -> string [@@js.get "type"]
  val set_bounds: t -> LatLngBounds.t -> unit
  val set_keyword: t -> string -> unit
  val set_location: t -> LatLng.t -> unit
  val set_name: t -> string -> unit
  val set_radius: t -> float -> unit
  val set_type': t -> string -> unit  [@@js.set "type"]
end

module TextSearchRequest: sig
  type t
  val create:
    ?bounds:LatLngBounds.t ->
    ?location:LatLng.t ->
    ?query:string ->
    ?radius:float ->
    ?type':(string [@js "type"]) ->
    unit ->
    t
    [@@js.builder]
  val bounds: t -> LatLngBounds.t
  val location: t -> LatLng.t
  val query: t -> string
  val radius: t -> float
  val type': t -> string [@@js.get "type"]
  val set_bounds: t -> LatLngBounds.t -> unit
  val set_location: t -> LatLng.t -> unit
  val set_query: t -> string -> unit
  val set_radius: t -> float -> unit
  val set_type': t -> string -> unit  [@@js.set "type"]
end

module PlacesService: sig
  type t
  val new_places_service: Map.t -> t [@@js.new]
  val get_details: t -> PlaceDetailsRequest.t ->
    (PlaceResult.t -> places_service_status ->
     unit) -> unit [@@js.call]
  val nearby_search: t -> PlaceSearchRequest.t ->
    (PlaceResult.t list ->
     places_service_status ->
     PlaceSearchPagination.t ->
     unit) ->
    unit [@@js.call]
  val radar_search: t -> RadarSearchRequest.t ->
    (PlaceResult.t list ->
     places_service_status ->
     unit) ->
    unit [@@js.call]
  val text_search: t -> TextSearchRequest.t ->
    (PlaceResult.t list ->
     places_service_status ->
     PlaceSearchPagination.t ->
     unit) ->
    unit [@@js.call]
end
[@js.scope "google.maps.places"]
(* End Place *)



(* Autocompleter  *)
module ComponentRestrictions: sig
  type t
  val create:
    country:string list ->
    t [@@js.builder]
  val country: t -> string list [@@js.get]
  val set_country: t -> string list -> unit [@@js.set]
end

module PredictionSubstring: sig
  type t
  val create:
    ?length:int ->
    ?offset:int ->
    unit ->
    t
    [@@js.builder]
  val length: t -> int [@@js.get]
  val offset: t -> int [@@js.get]
  val set_length: t -> int -> unit [@@js.set]
  val set_offset: t -> int -> unit [@@js.set]
end

module PredictionTerm: sig
  type t
  val create:
    ?offset:int ->
    ?value:string ->
    unit ->
    t
    [@@js.builder]
  val offset: t -> int [@@js.get]
  val value: t -> string [@@js.get]
  val set_offset: t -> int -> unit [@@js.set]
  val set_value: t -> string -> unit [@@js.set]
end

(* Queries *)
module QueryAutocompletePrediction: sig
  type t
  val create:
    ?description:string ->
    ?matched_substrings:PredictionSubstring.t ->
    ?place_id:string ->
    ?terms:PredictionTerm.t list ->
    unit ->
    t
    [@@js.verbatim_names]
    [@@js.builder]
  val description: t -> string [@@js.verbatim_names]
  val matched_substrings: t -> PredictionSubstring.t [@@js.verbatim_names]
  val place_id: t -> string [@@js.verbatim_names]
  val terms: t -> PredictionTerm.t list
  val set_description: t -> string -> unit
  val set_matched_substrings:
    t -> PredictionSubstring.t -> unit [@@js.verbatim_names]
  val set_place_id: t -> string -> unit [@@js.verbatim_names]
  val set_terms: t -> PredictionTerm.t list -> unit
end

module QueryAutocompletionRequest: sig
  type t
  val create:
    ?bounds:LatLngBounds.t ->
    ?input:string ->
    ?location:LatLng.t ->
    ?offset:int ->
    ?radius:float ->
    unit ->
    t
    [@@js.builder]
  val bounds: t -> LatLngBounds.t [@@js.get]
  val input: t -> string [@@js.get]
  val location: t -> LatLng.t [@@js.get]
  val offset: t -> int [@@js.get]
  val radius: t -> float [@@js.get]
  val set_bounds: t -> LatLngBounds.t -> unit [@@js.set]
  val set_input: t -> string -> unit [@@js.set]
  val set_location: t -> LatLng.t -> unit [@@js.set]
  val set_offset: t -> int -> unit [@@js.set]
  val set_radius: t -> float -> unit [@@js.set]
end
(* End queries *)

module AutocompleteOptions: sig
  type t
  val create :
    ?bounds:LatLngBounds.t ->
    ?component_restrictions:ComponentRestrictions.t ->
    ?types:string list ->
    unit ->
    t
    [@@js.builder]
  val bounds: t -> LatLngBounds.t [@@js.get]
  val component_restrictions: t -> ComponentRestrictions.t [@@js.get]
  val types: t -> string list [@@js.get]
  val set_bounds: t -> LatLngBounds.t -> unit [@@js.set]
  val set_component_restrictions:
    t -> ComponentRestrictions.t -> unit [@@js.set]
  val set_types: t -> string list -> unit [@@js.set]
end

module AutocompletePrediction: sig
  type t
  val create:
    ?description:string ->
    ?matched_substrings:PredictionSubstring.t list ->
    ?place_id:string ->
    ?terms:PredictionTerm.t list ->
    ?types:string list ->
    unit ->
    t
    [@@js.verbatim_names]
    [@@js.builder]
  val description: t -> string
  val matched_substrings: t -> PredictionSubstring.t list [@@js.verbatim_names]
  val place_id: t -> string [@@js.verbatim_names]
  val terms: t -> PredictionTerm.t list
  val types: t -> string list
  val set_description: t -> string -> unit
  val set_matched_substrings:
    t -> PredictionSubstring.t list -> unit [@@js.verbatim_names]
  val set_place_id: t -> string -> unit [@@js.verbatim_names]
  val set_terms: t -> PredictionTerm.t list -> unit
  val set_types: t -> string list -> unit
end

module AutocompletionRequest: sig
  type t
  val create:
    ?bounds:LatLngBounds.t ->
    ?componentRestrictions:ComponentRestrictions.t ->
    ?input:string ->
    ?location:LatLng.t ->
    ?offset:int ->
    ?radius:float ->
    ?session_token:AutocompleteSessionToken.t ->
    ?types:string list ->
    unit ->
    t
    [@@js.builder]
  val bounds: t -> LatLngBounds.t [@@js.get]
  val componentRestrictions: t -> ComponentRestrictions.t [@@js.get]
  val input: t -> string [@@js.get]
  val location: t -> LatLng.t [@@js.get]
  val offset: t -> int [@@js.get]
  val radius: t -> float [@@js.get]
  val types: t -> string list [@@js.get]
  val set_bounds: t -> LatLngBounds.t -> unit [@@js.set]
  val set_componentRestrictions:
    t -> ComponentRestrictions.t -> unit [@@js.set]
  val set_input: t -> string -> unit [@@js.set]
  val set_location: t -> LatLng.t -> unit [@@js.set]
  val set_offset: t -> int -> unit [@@js.set]
  val set_radius: t -> float -> unit [@@js.set]
  val set_types: t -> string list -> unit [@@js.set]
end

module AutocompleteService: sig
  type t
  val new_autocomplete_service : unit -> t [@@js.new]
  val get_place_predictions :
    t ->
    AutocompletionRequest.t ->
    (AutocompletePrediction.t list option -> places_service_status -> unit)
    -> unit [@@js.call]

  val getQueryPredictions :
    t ->
    QueryAutocompletionRequest.t ->
    (QueryAutocompletePrediction.t list -> places_service_status -> unit) ->
    unit [@@js.call]
end
[@js.scope "google.maps.places"]

module Autocomplete: sig
  type t
  val new_autocomplete :
    ?opts:AutocompleteOptions.t ->
    Converter.Element.t ->
    t [@@js.new]
  val get_bounds : t -> unit -> LatLngBounds.t [@@js.call]
  val get_place : t -> unit -> PlaceResult.t [@@js.call]
  val set_bounds : t -> LatLngBounds.t -> unit [@@js.call]
  val set_component_restrictions :
    t -> ComponentRestrictions.t -> unit [@@js.call]
  val set_types : t -> string list -> unit [@@js.call]

  val t_to_js : t -> Ojs.t
  val t_of_js : Ojs.t -> t
end
[@js.scope "google.maps.places"]
(* End autocompleter *)

(* Distance Matrix *)
type distance_matrix_element_status =
  | Ok           [@js "OK"]
  | Not_found    [@js "NOT_FOUND"]
  | Zero_results [@js "ZERO_RESULTS"]
  [@@ js.enum]

type distance_matrix_status =
  | Ok                      [@js "OK"]
  | Invalid_request         [@js "INVALID_REQUEST"]
  | Over_query_limit        [@js "OVER_QUERY_LIMIT"]
  | Request_denied          [@js "REQUEST_DENIED"]
  | Unknown_error           [@js "UNKNOWN_ERROR"]
  | Max_elements_exceeded   [@js "MAX_ELEMENTS_EXCEEDED"]
  | Max_dimensions_exceeded [@js "MAX_DIMENSIONS_EXCEEDED"]
  [@@ js.enum]

module DistanceMatrixRequest: sig
  type t
  (* Many arguments *)
  val create:
    ?avoid_ferries:bool ->
    ?avoid_highways:bool ->
    ?avoid_tolls:bool ->
    ?destinations:LatLng.t list ->
    ?driving_options:DrivingOptions.t ->
    ?origins:LatLng.t list ->
    ?region:string ->
    ?transit_options:TransitOptions.t ->
    ?travel_mode:travel_mode ->
    ?unit_system:unit_system ->
    unit ->
    t
    [@@js.builder]
  val avoid_ferries: t -> bool
  val avoid_highways: t -> bool
  val avoid_tolls: t -> bool
  val destinations: t -> LatLng.t list
  val driving_options: t -> DrivingOptions.t
  val origins: t -> LatLng.t list
  val region: t -> string
  val transit_options: t -> TransitOptions.t
  val travel_mode: t -> travel_mode
  val unit_system: t -> unit_system
  val set_avoid_ferries: t -> bool -> unit
  val set_avoid_highways: t -> bool -> unit
  val set_avoid_tolls: t -> bool -> unit
  val set_destinations: t -> LatLng.t list -> unit
  val set_driving_options: t -> DrivingOptions.t -> unit
  val set_origins: t -> LatLng.t list -> unit
  val set_region: t -> string -> unit
  val set_transit_options: t -> TransitOptions.t -> unit
  val set_travel_mode: t -> travel_mode -> unit
  val set_unit_system: t -> unit_system -> unit
end

module DistanceMatrixResponseElement: sig
  type t
  val create:
    (*?fare:TransitFare.t -> *)
    ?distance:Distance.t ->
    ?duration:Duration.t ->
    ?duration_in_traffic:Duration.t ->
    ?status:distance_matrix_element_status ->
    unit ->
    t
    [@@js.builder]
  val distance: t -> Distance.t
  val duration: t -> Duration.t
  val duration_in_traffic: t -> Duration.t
  val status: t -> distance_matrix_element_status
  val set_distance: t -> Distance.t -> unit
  val set_duration: t -> Duration.t -> unit
  val set_duration_in_traffic: t -> Duration.t -> unit
  val set_status: t -> distance_matrix_element_status -> unit
end

module DistanceMatrixResponseRow: sig
  type t
  val create:
    elements:DistanceMatrixResponseElement.t list ->
    t
    [@@js.builder]
  val elements: t -> DistanceMatrixResponseElement.t list [@@js.get]
  val set_elements:
    t -> DistanceMatrixResponseElement.t list -> unit [@@js.set]
end

module DistanceMatrixResponse: sig
  type t
  val create:
    ?destination_addresses:string list ->
    ?origin_addresses:string list ->
    ?rows:DistanceMatrixResponseRow.t list ->
    unit ->
    t
    [@@js.builder]
  val destination_addresses: t -> string list [@@js.get]
  val origin_addresses: t -> string list [@@js.get]
  val rows: t -> DistanceMatrixResponseRow.t list [@@js.get]
  val set_destination_addresses: t -> string list -> unit [@@js.set]
  val set_origin_addresses: t -> string list -> unit [@@js.set]
  val set_rows: t -> DistanceMatrixResponseRow.t list -> unit [@@js.set]
end

module DistanceMatrixService: sig
  type t
  val new_distance_matrix_service: unit -> t [@@js.new]
  val get_distance_matrix:
    t ->
    DistanceMatrixRequest.t ->
    (DistanceMatrixResponse.t ->
     distance_matrix_status ->
     unit) ->
    unit [@@js.call]
end
[@js.scope "google.maps"]
(* End DistanceMatrix *)

(* Drawing *)
module DrawingControlOptions: sig
  type t
  val create:
    ?drawing_modes:overlay_type list ->
    ?position:control_position ->
    unit ->
    t
    [@@js.builder]
  val drawing_modes: t -> overlay_type list [@@js.get]
  val position: t -> control_position [@@js.get]
  val set_drawing_modes: t -> overlay_type list -> unit [@@js.set]
  val set_position: t -> control_position -> unit [@@js.set]
end

module DrawingManagerOptions: sig
  type t
  val create:
    ?circle_options:CircleOptions.t ->
    ?drawing_control:bool ->
    ?drawing_control_options:DrawingControlOptions.t ->
    ?drawing_mode:overlay_type ->
    ?map:Map.t ->
    ?marker_options:MarkerOptions.t ->
    ?polygon_options:PolygonOptions.t ->
    ?polyline_options:PolylineOptions.t ->
    ?rectangle_options:RectangleOptions.t ->
    unit ->
    t
    [@@js.builder]
  val circle_options: t -> CircleOptions.t [@@js.get]
  val drawing_control: t -> bool [@@js.get]
  val drawing_control_options: t -> DrawingControlOptions.t [@@js.get]
  val drawing_mode: t -> overlay_type [@@js.get]
  val map: t -> Map.t [@@js.get]
  val marker_options: t -> MarkerOptions.t [@@js.get]
  val polygon_options: t -> PolygonOptions.t [@@js.get]
  val polyline_options: t -> PolylineOptions.t [@@js.get]
  val rectangle_options: t -> RectangleOptions.t [@@js.get]
  val set_circle_options: t -> CircleOptions.t -> unit [@@js.set]
  val set_drawing_control: t -> bool -> unit [@@js.set]
  val set_drawing_control_options:
    t -> DrawingControlOptions.t -> unit [@@js.set]
  val set_drawing_mode: t -> overlay_type -> unit [@@js.set]
  val set_map: t -> Map.t -> unit [@@js.set]
  val set_marker_options: t -> MarkerOptions.t -> unit [@@js.set]
  val set_polygon_options: t -> PolygonOptions.t -> unit [@@js.set]
  val set_polyline_options: t -> PolylineOptions.t -> unit [@@js.set]
  val set_rectangle_options: t -> RectangleOptions.t -> unit [@@js.set]
end

module DrawingManager: sig
  type t
  val new_drawing_manager:
    ?options:DrawingManagerOptions.t -> unit -> t [@@js.new]
  val get_drawing_mode : t -> overlay_type [@@js.call]
  val get_map : t -> Map.t [@@js.call]
  val set_drawing_mode : t -> overlay_type -> unit [@@js.call]
  val set_map : t -> Map.t -> unit [@@js.call]
  val set_options : t -> DrawingManagerOptions.t -> unit [@@js.call]
end
[@js.scope "google.map.drawing"]
(* End drawing *)

module WeightedLocation: sig
  type t
  val create:
    ?location:LatLng.t ->
    ?weight:float ->
    unit ->
    t
    [@@js.builder]
  val location: t -> LatLng.t [@@js.get]
  val weight: t -> float [@@js.get]
  val set_location: t -> LatLng.t -> unit [@@js.set]
  val set_weight: t -> float -> unit [@@js.set]
end

(* Elevation *)
type elevation_status =
  | Ok               [@js "OK"]
  | Unknown_error    [@js "UNKNOWN_ERROR"]
  | Over_query_limit [@js "OVER_QUERY_LIMIT"]
  | Request_denied   [@js "REQUEST_DENIED"]
  | Invalid_request  [@js "INVALID_REQUEST"]
  | Ir               [@js "DATA_NOT_AVAILABLE"]
  [@@ js.enum]

module PathElevationRequest: sig
  type t
  val create:
    ?path:LatLng.t list ->
    samples:int ->
    t
    [@@js.builder]
  val path: t -> LatLng.t list [@@js.get]
  val samples: t -> int [@@js.get]
  val set_path: t -> LatLng.t list -> unit [@@js.set]
  val set_samples: t -> int -> unit [@@js.set]
end

module LocationElevationRequest: sig
  type t
  val create:
    locations:LatLng.t list ->
    t
    [@@js.builder]
  val locations: t -> LatLng.t list [@@js.get]
  val set_locations: t -> LatLng.t list -> unit [@@js.set]
end

module ElevationResult: sig
  type t
  val create:
    ?elevation:float ->
    ?location:LatLng.t ->
    ?resolution:float ->
    unit ->
    t
    [@@js.builder]
  val elevation: t -> float [@@js.get]
  val location: t -> LatLng.t [@@js.get]
  val resolution: t -> float [@@js.get]
  val set_elevation: t -> float -> unit [@@js.set]
  val set_location: t -> LatLng.t -> unit [@@js.set]
  val set_resolution: t -> float -> unit [@@js.set]
end

module ElevationService: sig
  type t
  val new_elevation_service: unit -> t [@@js.new]
  val get_elevation_along_path:
    PathElevationRequest.t ->
    (ElevationResult.t list ->
     elevation_status ->
     unit) ->
    unit [@@js.call]

  val get_elevation_for_locations :
    LocationElevationRequest.t ->
    (ElevationResult.t list ->
     elevation_status ->
     unit) ->
    unit [@@js.call]
end
  [@js.scope "google.maps"]
(* End Elevation *)

(* Fusion *)
module FusionTablesCell: sig
  type t
  val create:
    column_name:string ->
    value:string ->
    t
    [@@js.builder]
  val column_name: t -> string [@@js.get]
  val value: t -> string [@@js.get]
  val set_column_name: t -> string -> unit [@@js.set]
  val set_value: t -> string -> unit [@@js.set]
end

module FusionTablesHeatmap: sig
  type t
  val create:
    enabled:bool ->
    t
    [@@js.builder]
  val enabled: t -> bool [@@js.get]
  val set_enabled: t -> bool -> unit [@@js.set]
end

module FusionTablesQuery: sig
  type t
  val create:
    from:string ->
    ?limit:int ->
    ?offset:int ->
    ?order_by:string ->
    ?select:string ->
    ?where:string ->
    unit ->
    t
    [@@js.builder]
  val from: t -> string [@@js.get]
  val limit: t -> int [@@js.get]
  val offset: t -> int [@@js.get]
  val order_by: t -> string [@@js.get]
  val select: t -> string [@@js.get]
  val where: t -> string [@@js.get]
  val set_from: t -> string -> unit [@@js.set]
  val set_limit: t -> int -> unit [@@js.set]
  val set_offset: t -> int -> unit [@@js.set]
  val set_order_by: t -> string -> unit [@@js.set]
  val set_select: t -> string -> unit [@@js.set]
  val set_where: t -> string -> unit [@@js.set]
end

module FusionTablesMarkerOptions: sig
  type t
  val create:
    icon_name:string ->
    t
    [@@js.builder]
  val icon_name: t -> string [@@js.get]
  val set_icon_name: t -> string -> unit [@@js.set]
end

module FusionTablesPolygonOptions: sig
  type t
  val create:
    ?fill_color:string ->
    ?fill_opacity:float ->
    ?stroke_color:string ->
    ?stroke_opacity:float ->
    ?stroke_weight:float ->
    unit ->
    t
    [@@js.builder]
  val fill_color: t -> string [@@js.get]
  val fill_opacity: t -> float [@@js.get]
  val stroke_color: t -> string [@@js.get]
  val stroke_opacity: t -> float [@@js.get]
  val stroke_weight: t -> float [@@js.get]
  val set_fill_color: t -> string -> unit [@@js.set]
  val set_fill_opacity: t -> float -> unit [@@js.set]
  val set_stroke_color: t -> string -> unit [@@js.set]
  val set_stroke_opacity: t -> float -> unit [@@js.set]
  val set_stroke_weight: t -> float -> unit [@@js.set]
end

module FusionTablesPolylineOptions: sig
  type t
  val create:
    ?stroke_color:string ->
    ?stroke_opacity:float ->
    ?stroke_weight:float ->
    unit ->
    t
    [@@js.builder]
  val stroke_color: t -> string [@@js.get]
  val stroke_opacity: t -> float [@@js.get]
  val stroke_weight: t -> float [@@js.get]
  val set_stroke_color: t -> string -> unit [@@js.set]
  val set_stroke_opacity: t -> float -> unit [@@js.set]
  val set_stroke_weight: t -> float -> unit [@@js.set]
end

module FusionTablesStyle: sig
  type t
  val create:
    ?marker_options:FusionTablesMarkerOptions.t ->
    ?polygon_options:FusionTablesPolygonOptions.t ->
    ?polyline_options:FusionTablesPolylineOptions.t ->
    ?where:string ->
    unit ->
    t
    [@@js.builder]
  val marker_options: t -> FusionTablesMarkerOptions.t [@@js.get]
  val polygon_options: t -> FusionTablesPolygonOptions.t [@@js.get]
  val polyline_options: t -> FusionTablesPolylineOptions.t [@@js.get]
  val where: t -> string [@@js.get]
  val set_marker_options: t -> FusionTablesMarkerOptions.t -> unit [@@js.set]
  val set_polygon_options: t -> FusionTablesPolygonOptions.t -> unit [@@js.set]
  val set_polyline_options:
    t -> FusionTablesPolylineOptions.t -> unit [@@js.set]
  val set_where: t -> string -> unit [@@js.set]
end

module FusionTablesLayerOptions: sig
  type t
  val create:
    ?clickable:bool ->
    ?heatmap:FusionTablesHeatmap.t ->
    ?map:Map.t ->
    ?query:FusionTablesQuery.t ->
    ?styles:FusionTablesStyle.t list ->
    ?suppress_info_windows:bool ->
    unit ->
    t
    [@@js.builder]
  val clickable: t -> bool [@@js.get]
  val heatmap: t -> FusionTablesHeatmap.t [@@js.get]
  val map: t -> Map.t [@@js.get]
  val query: t -> FusionTablesQuery.t [@@js.get]
  val styles: t -> FusionTablesStyle.t list [@@js.get]
  val suppress_info_windows: t -> bool [@@js.get]
  val set_clickable: t -> bool -> unit [@@js.set]
  val set_heatmap: t -> FusionTablesHeatmap.t -> unit [@@js.set]
  val set_map: t -> Map.t -> unit [@@js.set]
  val set_query: t -> FusionTablesQuery.t -> unit [@@js.set]
  val set_styles: t -> FusionTablesStyle.t list -> unit [@@js.set]
  val set_suppress_info_windows: t -> bool -> unit [@@js.set]
end

module FusionTablesLayer: sig
  type t
  val new_fusion_table_layer :
    options:FusionTablesLayerOptions.t ->
    t
    [@@js.new]
  val get_map: t -> Map.t [@@js.call]
  val set_map: t -> Map.t -> unit [@@js.call]
  val set_options: t -> FusionTablesLayerOptions.t -> unit [@@js.call]
end
[@js.scope "google.maps"]
(* End Fusion *)

(* Kml *)
type kml_layer_status =
  | Unknown            [@js "UNKNOWN"]
  | Ok                 [@js "OK"]
  | Invalid_request    [@js "INVALID_REQUEST"]
  | Document_not_found [@js "DOCUMENT_NOT_FOUND"]
  | Fetch_error        [@js "FETCH_ERROR"]
  | Invalid_document   [@js "INVALID_DOCUMENT"]
  | Document_too_large [@js "DOCUMENT_TOO_LARGE"]
  | Limits_exceeded    [@js "LIMITS_EXECEEDED"]
  | Timed_out          [@js "TIMED_OUT"]
  [@@ js.enum]

module KmlAuthor: sig
  type t
  val create:
    email:string ->
    name:string ->
    uri:string ->
    t
    [@@js.builder]
  val email: t -> string [@@js.get]
  val name: t -> string [@@js.get]
  val uri: t -> string [@@js.get]
  val set_email: t -> string -> unit [@@js.set]
  val set_name: t -> string -> unit [@@js.set]
  val set_uri: t -> string -> unit [@@js.set]
end

module KmlFeatureData: sig
  type t
  val create:
    ?author:KmlAuthor.t ->
    ?description:string ->
    ?id:string ->
    ?info_window_html:string ->
    ?name:string ->
    ?snipper:string ->
    unit ->
    t
    [@@js.builder]
  val author: t -> KmlAuthor.t [@@js.get]
  val description: t -> string [@@js.get]
  val id: t -> string [@@js.get]
  val info_window_html: t -> string [@@js.get]
  val name: t -> string [@@js.get]
  val snipper: t -> string [@@js.get]
  val set_author: t -> KmlAuthor.t -> unit [@@js.set]
  val set_description: t -> string -> unit [@@js.set]
  val set_id: t -> string -> unit [@@js.set]
  val set_info_window_html: t -> string -> unit [@@js.set]
  val set_name: t -> string -> unit [@@js.set]
  val set_snipper: t -> string -> unit [@@js.set]
end

module KmlLayerMetadata: sig
  type t
  val create:
    ?author:KmlAuthor.t ->
    ?description:string ->
    ?has_screen_overlays:bool ->
    ?name:string ->
    ?snipper:string ->
    unit ->
    t
    [@@js.builder]
  val author: t -> KmlAuthor.t [@@js.get]
  val description: t -> string [@@js.get]
  val has_screen_overlays: t -> bool [@@js.get]
  val name: t -> string [@@js.get]
  val snipper: t -> string [@@js.get]
  val set_author: t -> KmlAuthor.t -> unit [@@js.set]
  val set_description: t -> string -> unit [@@js.set]
  val set_has_screen_overlays: t -> bool -> unit [@@js.set]
  val set_name: t -> string -> unit [@@js.set]
  val set_snipper: t -> string -> unit [@@js.set]
end

module KmlLayerOptions: sig
  type t
  val create:
    ?clickable:bool ->
    ?map:Map.t ->
    ?preserve_viewport:bool ->
    ?screen_overlays:bool ->
    ?suppress_info_windows:bool ->
    ?url:string ->
    ?z_index:int ->
    unit ->
    t
    [@@js.builder]
  val clickable: t -> bool [@@js.get]
  val map: t -> Map.t [@@js.get]
  val preserve_viewport: t -> bool [@@js.get]
  val screen_overlays: t -> bool [@@js.get]
  val suppress_info_windows: t -> bool [@@js.get]
  val url: t -> string [@@js.get]
  val z_index: t -> int [@@js.get]
  val set_clickable: t -> bool -> unit [@@js.set]
  val set_map: t -> Map.t -> unit [@@js.set]
  val set_preserve_viewport: t -> bool -> unit [@@js.set]
  val set_screen_overlays: t -> bool -> unit [@@js.set]
  val set_suppress_info_windows: t -> bool -> unit [@@js.set]
  val set_url: t -> string -> unit [@@js.set]
  val set_z_index: t -> int -> unit [@@js.set]
end

module KmlMouseEvent: sig
  type t
  val create:
    ?feature_data:KmlFeatureData.t ->
    ?lat_lng:LatLng.t ->
    ?pixel_offset:Size.t ->
    unit ->
    t
    [@@js.builder]
  val feature_data: t -> KmlFeatureData.t [@@js.get]
  val lat_lng: t -> LatLng.t [@@js.get]
  val pixel_offset: t -> Size.t [@@js.get]
  val set_feature_data: t -> KmlFeatureData.t -> unit [@@js.set]
  val set_lat_lng: t -> LatLng.t -> unit [@@js.set]
  val set_pixel_offset: t -> Size.t -> unit [@@js.set]
end

module KmlLayer: sig
  type t
  val new_kml_layer:
    ?opts:KmlLayerOptions.t -> unit -> t [@@js.new]
  val get_default_viewport: t -> LatLngBounds.t [@@js.call]
  val get_map: t -> Map.t [@@js.call]
  val get_metadata: t -> KmlLayerMetadata.t [@@js.call]
  val get_status: t -> kml_layer_status [@@js.call]
  val get_url: t -> string [@@js.call]
  val get_z_zindex: t -> int [@@js.call]
  val set_map: t -> Map.t -> unit [@@js.call]
  val set_options: t -> KmlLayerOptions.t [@@js.call]
  val set_url: t -> string -> unit [@@js.call]
  val set_z_zindex: t -> int -> unit [@@js.call]
end
[@js.scope "google.maps"]
(* End Kml *)

(* MaxZoom *)
type max_zoom_status =
  | Ok    [@js "OK"]
  | Error [@js "ERROR"]
  [@@ js.enum]

module MaxZoomResult: sig
  type t
  val create:
    ?status:max_zoom_status ->
    ?zoom:int ->
    unit ->
    t
    [@@js.builder]
  val status: t -> max_zoom_status [@@js.get]
  val zoom: t -> int [@@js.get]
  val set_status: t -> max_zoom_status -> unit [@@js.set]
  val set_zoom: t -> int -> unit [@@js.set]
end

module MaxZoomService: sig
  type t
  val new_max_zoom_service : unit -> t [@@js.new]
  val get_max_zoom_at_lat_lng:
    t -> LatLng.t -> (MaxZoomResult.t -> unit) -> unit
    [@@js.call]
end
[@js.scope "google.maps"]
(* End MaxZoom *)

(* SearchBox *)
module SearchBoxOptions: sig
  type t
  val create:
    bounds:LatLngBounds.t ->
    t
    [@@js.builder]
  val bounds: t -> LatLngBounds.t [@@js.get]
  val set_bounds: t -> LatLngBounds.t -> unit [@@js.set]
end

module SearchBox: sig
  type t
  val new_search_box:
    Converter.Element.t -> ?opts:SearchBoxOptions.t -> unit -> t [@@js.new]
  val get_bounds: t -> LatLngBounds.t [@@js.call]
  val get_places: t -> PlaceResult.t list [@@js.call]
  val set_bounds: t -> LatLngBounds.t -> unit [@@js.call]
  val t_to_js : t -> Ojs.t
  val t_of_js : Ojs.t -> t
end
[@js.scope "google.maps.places"]
(* End searchbox *)


(* Rotation Control *)
module RotateControlOptions: sig
  type t
  val create:
    position:control_position ->
    t
    [@@js.builder]
  val position: t -> control_position [@@js.get]
  val set_position: t -> control_position -> unit [@@js.set]
end
(* End Rotation control *)

(*Scale Control Style *)
type scale_control_style =
  | Default [@js 0]
  [@@ js.enum]

module ScaleControlOptions: sig
  type t
  val create:
    style:scale_control_style ->
    t
    [@@js.builder]
  val style: t -> scale_control_style [@@js.get]
  val set_style: t -> scale_control_style -> unit [@@js.set]
end
(* End scale control style *)

(* Ground overlay options *)
module GroundOverlayOptions: sig
  type t
  val create:
    ?clickable:bool ->
    ?map:Map.t ->
    ?opacity:float ->
    unit ->
    t
    [@@js.builder]
  val clickable: t -> bool [@@js.get]
  val map: t -> Map.t [@@js.get]
  val opacity: t -> float [@@js.get]
  val set_clickable: t -> bool -> unit [@@js.set]
  val set_map: t -> Map.t -> unit [@@js.set]
  val set_opacity: t -> float -> unit [@@js.set]
end

module GroundOverlay: sig
  type t
  val new_ground_overlay:
    url:string ->
    bounds:LatLngBounds.t ->
    ?opts:GroundOverlayOptions.t ->
    unit ->
    t [@@js.new]
  val get_bounds: t -> LatLngBounds.t [@@js.call]
  val get_map: t -> Map.t [@@js.call]
  val get_opacity: t -> float [@@js.call]
  val get_url: t -> string [@@js.call]
  val set_map: t -> Map.t -> unit [@@js.call]
  val set_opacity: t -> float -> unit [@@js.call]
end
[@js.scope "google.maps"]
(* End Ground overlay *)

(* HeatmapLayer *)
module HeatmapLayerOptions: sig
  type t
  val create:
    (* LatLng MVCArray *)
    ?data:MVCArray.t ->
    ?dissipating:bool ->
    ?gradient:string list ->
    ?map:Map.t ->
    ?max_intensity:float ->
    ?opacity:float ->
    ?radius:float ->
    unit ->
    t
    [@@js.builder]
  val data: t -> MVCArray.t [@@js.get]
  val dissipating: t -> bool [@@js.get]
  val gradient: t -> string list [@@js.get]
  val map: t -> Map.t [@@js.get]
  val max_intensity: t -> float [@@js.get]
  val opacity: t -> float [@@js.get]
  val radius: t -> float [@@js.get]
  val set_data: t -> MVCArray.t -> unit [@@js.set]
  val set_dissipating: t -> bool -> unit [@@js.set]
  val set_gradient: t -> string list -> unit [@@js.set]
  val set_map: t -> Map.t -> unit [@@js.set]
  val set_max_intensity: t -> float -> unit [@@js.set]
  val set_opacity: t -> float -> unit [@@js.set]
  val set_radius: t -> float -> unit [@@js.set]
end

module HeatmapLayer: sig
  type t
  val new_heatmap_layer:
    ?opts:HeatmapLayerOptions.t ->
    unit ->
    t [@@js.new]
  val get_data: t -> MVCArray.t [@@js.call]
  val get_map: t -> Map.t [@@js.call]
  val set_data: t -> LatLng.t list [@@js.call]
  val set_map: t -> Map.t -> unit [@@js.call]
  val set_options: t -> HeatmapLayerOptions.t -> unit [@@js.call]
end
[@js.scope "google.maps.visualization"]
(* End HeatMapLayer *)


(* ImageMap *)
module ImageMapTypeOptions: sig
  type t
  val create:
    ?alt:string ->
    ?get_tile_url:(Point.t -> int -> string) ->
    ?max_zoom:int ->
    ?min_zoom:int ->
    ?name:string ->
    ?opacity:float ->
    ?tile_size:Size.t ->
    unit ->
    t
    [@@js.builder]
  val alt: t -> string [@@js.get]
(*  val get_tile_url: t -> unit -> (Point.t -> int -> string) [@@js.get]*)
  val max_zoom: t -> int [@@js.get]
  val min_zoom: t -> int [@@js.get]
  val name: t -> string [@@js.get]
  val opacity: t -> float [@@js.get]
  val tile_size: t -> Size.t [@@js.get]
  val set_alt: t -> string -> unit [@@js.set]
  val set_get_tile_url: t -> (Point.t -> int -> string) -> unit [@@js.set]
  val set_max_zoom: t -> int -> unit [@@js.set]
  val set_min_zoom: t -> int -> unit [@@js.set]
  val set_name: t -> string -> unit [@@js.set]
  val set_opacity: t -> float -> unit [@@js.set]
  val set_tile_size: t -> Size.t -> unit [@@js.set]
end

module ImageMapType: sig
  type t
  val new_image_map_type:
    opts:ImageMapTypeOptions.t -> t [@@js.new]
  val get_opacity: t -> float [@@js.call]
  (* Should take Document, not Converter.Element.t *)
  val get_tile: t -> Point.t -> int -> Converter.Element.t -> unit [@@js.call]
  (* Takes Node (Converter.Element.t ?) *)
  val release_tile: t -> Ojs.t -> unit [@@js.call]
  val set_opacity: t -> float -> t [@@js.call]
  (*** Attributes ***)
  val alt : t -> string [@@js.get]
  val max_zoom : t -> int [@@js.get]
  val min_zoom : t -> int [@@js.get]
  val name : t -> string [@@js.get]
  val projection : t -> Projection.t [@@js.get]
  val radius : t -> float [@@js.get]
  val tile_size : t -> Size.t [@@js.get]
  val set_alt : t -> string -> unit [@@js.set]
  val set_max_zoom : t -> int -> unit [@@js.set]
  val set_min_zoom : t -> int -> unit [@@js.set]
  val set_name : t -> string -> unit [@@js.set]
  val set_projection : t -> Projection.t -> unit [@@js.set]
  val set_radius : t -> float -> unit [@@js.set]
  val set_tile_size : t -> Size.t -> unit [@@js.set]
end
[@js.scope "google.maps"]
(* End ImageMap *)

module MapPanes: sig
  type t
  (** Only Element **)
  val create:
    ?float_pane:Converter.Element.t ->
    ?map_pane:Converter.Element.t ->
    ?marker_layer:Converter.Element.t ->
    ?overlay_layer:Converter.Element.t ->
    ?overlay_mouse_target:Converter.Element.t ->
    unit ->
    t
    [@@js.builder]
  val float_pane: t -> Converter.Element.t [@@js.get]
  val map_pane: t -> Converter.Element.t [@@js.get]
  val marker_layer: t -> Converter.Element.t [@@js.get]
  val overlay_layer: t -> Converter.Element.t [@@js.get]
  val overlay_mouse_target: t -> Converter.Element.t [@@js.get]
  val set_float_pane: t -> Converter.Element.t -> unit [@@js.set]
  val set_map_pane: t -> Converter.Element.t -> unit [@@js.set]
  val set_marker_layer: t -> Converter.Element.t -> unit [@@js.set]
  val set_overlay_layer: t -> Converter.Element.t -> unit [@@js.set]
  val set_overlay_mouse_target: t -> Converter.Element.t -> unit [@@js.set]
end

module StyledMapTypeOptions: sig
  type t
  val create:
    ?alt:string ->
    ?max_zoom:int ->
    ?min_zoom:int ->
    ?name:string ->
    unit ->
    t
    [@@js.builder]
  val alt: t -> string [@@js.get]
  val max_zoom: t -> int [@@js.get]
  val min_zoom: t -> int [@@js.get]
  val name: t -> string [@@js.get]
  val set_alt: t -> string -> unit [@@js.set]
  val set_max_zoom: t -> int -> unit [@@js.set]
  val set_min_zoom: t -> int -> unit [@@js.set]
  val set_name: t -> string -> unit [@@js.set]
end

module StyledMapType: sig
  type t
  val new_styled_map_type:
    MapTypeStyle.t -> ?opts:StyledMapTypeOptions.t -> unit -> t [@@js.new]
  val alt: t -> string [@@js.get]
  val max_zoom: t -> int [@@js.get]
  val min_zoom: t -> int [@@js.get]
  val name: t -> string [@@js.get]
  val projection: t -> Projection.t [@@js.get]
  val radius: t -> float [@@js.get]
  val tile_size: t -> Size.t [@@js.get]
  val set_alt: t -> string -> unit [@@js.set]
  val set_max_zoom: t -> int -> unit [@@js.set]
  val set_min_zoom: t -> int -> unit [@@js.set]
  val set_name: t -> string -> unit [@@js.set]
  val set_projection: t -> Projection.t -> unit [@@js.set]
  val set_radius: t -> float -> unit [@@js.set]
  val set_tile_size: t -> Size.t -> unit [@@js.set]
end
  [@js.scope "google.maps"]
(* End Map Type *)

(* Overlay *)
module OverlayCompleteEvent: sig
  type t
  val create:
    (* WARNING : Not Ojs.t but shapes *)
    ?overlay:Ojs.t ->
    ?type':(overlay_type [@js "type"]) ->
    unit ->
    t
    [@@js.builder]
  val overlay: t -> Ojs.t
  val type': t -> overlay_type  [@@js.get "type"]
  val set_overlay: t -> Ojs.t -> unit
  val set_type': t -> overlay_type -> unit  [@@js.set "type"]
end

module OverlayView: sig
  type t
  val new_overlay_view: unit -> t [@@js.new]
  val draw: t -> unit [@@js.call]
  val get_map: t -> Map.t [@@js.call]
  val get_panes: t -> MapPanes.t [@@js.call]
  val get_projection: t -> MapCanvasProjection.t [@@js.call]
  val on_add: t -> unit [@@js.call]
  val on_remove: t -> unit [@@js.call]
  val set_map: t -> Map.t -> unit [@@js.call]
  val set_map_streetview: t -> StreetViewPanorama.t -> unit [@@js.call "setMap"]
end
[@js.scope "google.maps"]
(* End Overlay *)

(* Save *)
module SaveWidgetOptions: sig
  type t
  val create:
    ?attribution:Attribution.t ->
    ?place:MarkerPlace.t ->
    unit ->
    t
    [@@js.builder]
  val attribution: t -> Attribution.t [@@js.get]
  val place: t -> MarkerPlace.t [@@js.get]
  val set_attribution: t -> Attribution.t -> unit [@@js.set]
  val set_place: t -> MarkerPlace.t -> unit [@@js.set]
end

module SaveWidget: sig
  (* MVCObject *)
  type t
  val new_save_widget :
    Ojs.t -> ?opts:SaveWidgetOptions.t -> unit -> t [@@js.new]
  val get_attribution: t -> Attribution.t [@@js.call]
  val get_place: t -> MarkerPlace.t [@@js.call]
  val set_attribution: t -> Attribution.t -> unit [@@js.call]
  val set_options: t -> SaveWidgetOptions.t -> unit [@@js.call]
  val set_place: t -> MarkerPlace.t -> unit [@@js.call]
end
  [@js.scope "google.maps"]
(* End save *)


(* Traffic Layer *)
module TrafficLayerOptions: sig
  type t
  val create:
    map:Map.t ->
    t
    [@@js.builder]
  val map: t -> Map.t [@@js.get]
  val set_map: t -> Map.t -> unit [@@js.set]
end

module TrafficLayer: sig
  type t
  val new_traffic_layer:
    ?opts:TrafficLayerOptions.t -> unit -> t [@@js.new]
  val get_map: t -> Map.t [@@js.call]
  val set_map: t -> Map.t -> unit [@@js.call]
  val set_options: t -> TrafficLayerOptions.t -> unit [@@js.call]
end
  [@js.scope "google.maps"]
(* End Traffic Layer *)

(* Namespaces *)
module Encoding: sig
  val decode_path: string -> LatLng.t list [@@js.global]
  val encode_path: LatLng.t list -> string [@@js.global]
end
[@js.scope "google.maps.geometry.encoding"]

module Spherical: sig
  val compute_area:
    LatLng.t ->
    ?radius:float ->
    unit ->
    float [@@js.global]

  val compute_distance_between:
    LatLng.t ->
    LatLng.t ->
    ?radius:float ->
    unit ->
    float [@@js.global]

  val compute_heading:
    LatLng.t ->
    LatLng.t ->
    float [@@js.global]

  val compute_length:
    LatLng.t list ->
    ?radius:float ->
    unit ->
    float [@@js.global]

  val compute_offset:
    LatLng.t ->
    float ->
    float ->
    ?radius:float ->
    unit ->
    LatLng.t [@@js.global]

  val compute_offset_origin:
    LatLng.t ->
    float ->
    float ->
    ?radius:float ->
    unit ->
    LatLng.t [@@js.global]

  val compute_signed_area:
    LatLng.t list ->
    ?radius:float ->
    unit          ->
    float
    [@@js.global]

  val interpolate:
    LatLng.t ->
    LatLng.t ->
    float    ->
    LatLng.t
  [@@js.global]
end
[@js.scope "google.maps.geometry.spherical"]

module Poly: sig
  val contains_location:
    LatLng.t  ->
    Polygon.t ->
    bool
    [@@js.global]

  val is_location_on_edge_polygon:
    LatLng.t  ->
    Polygon.t ->
    ?tolerance:float ->
    unit ->
    bool
    [@@js.global "isLocationOnEdge"]

  val is_location_on_edge_polyline:
    LatLng.t  ->
    Polyline.t ->
    ?tolerance:float ->
    unit ->
    bool
    [@@js.global "isLocationOnEdge"]
end
[@js.scope "google.maps.geometry.poly"]
(* End Namespaces *)
