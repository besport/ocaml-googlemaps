(************* Temporary ************)
module Console: sig
  type t
  val log : string -> unit [@@js.global]
end
[@js.scope "console"]

module Document: sig
  type t
  val get_element_by_id : string -> t [@@js.global]
end
[@js.scope "document"]

(************************************)
type map_types =
  | Roadmap   [@js "roadmap"]
  | Satellite [@js "satellite"]
  | Hybrid    [@js "hybrid"]
  | Terrain   [@js "terrain"]
  [@@js.enum]

module GeocoderLocationType: sig
  type t
  (** SUM TYPE **)
end

module GeocoderStatus: sig
  type t
  (** SUM TYPE **)
end

module ControlPosition: sig
  type t
    (** SUM TYPE !!!! *)
end

module OverlayType: sig
  type t
    (** SUM TPYE !!! *)
end

module StrokePosition: sig
  type t
    (** SUM TYPE !! **)
end

module VehicleType: sig
  type t
end

module MapTypeControlStyle: sig
  type t
    (** SUM TYPE !! **)
end

module Attribution: sig
  type t
  val create :
    ?ios_deep_link_id:string ->
    ?source:string ->
    ?web_url:string ->
    unit -> t
    [@@js.builder]
end

module LatLng: sig
  type t
  val new_lat_lng: lat:float -> lng:float -> t [@@js.new]
  val lat: t -> float [@@js.call]
  val lng: t -> float [@@js.call]
  (** Added for polymorphism **)
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
    ?width_unit:string ->
    ?height_unit:string ->
    width:float ->
    height:float ->
    t [@@js.new]
  val equals : t -> t -> bool [@@js.call]
  val to_string : t -> string [@@js.call]
  val height : t -> float [@@js.get]
  val width  : t -> float [@@js.get]
  val set_height : t -> float -> unit [@@js.set]
  val set_width : t -> float -> unit [@@js.set]
end
[@js.scope "google.maps"]

module Projection: sig
  type t
  val from_lat_lng_to_point : t -> LatLng.t -> Point.t
  val from_point_to_lat_lng : t -> Point.t -> LatLng.t
end
[@js.scope "google.maps"]

(* Map *)
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
    ?heading:float ->
    ?keyboard_shortcuts:bool ->
    ?map_maker:bool ->
    ?map_type_control:bool ->
    ?map_type_id:map_types ->
    ?max_zoom:float ->
    ?min_zoom:float ->
    ?no_clear:bool ->
    ?pan_control:bool ->
    ?rotate_control:bool ->
    ?scale_controle:bool ->
    ?scrollwheel:bool ->
    ?sign_in_control:bool ->
    ?tilt:float ->
    ?zoom:float ->
    ?zoom_control:bool ->
    unit ->
    t
    [@@js.builder]
end

module Map: sig
  type t
  val new_map :
    Document.t ->
    ?opts:MapOptions.t -> unit -> t [@@js.new]

  val fit_bounds : t -> LatLngBounds.t -> unit [@@js.call]
  val get_bounds : t -> LatLngBounds.t [@@js.call]
  val get_center : t -> LatLng.t [@@js.call]
  val get_clickable_icons : t -> bool [@@js.call]
  val set_map_type_id : t -> map_types -> unit [@@js.call]
  val get_map_type_id : t -> map_types [@@js.call]
  val get_div : t -> Document.t [@@js.call]
  val get_heading : t -> float [@@js.call]
  val get_projection : t -> Projection.t [@@js.call]
  val get_tilt : t -> float [@@js.call]
  val get_zoom : t -> float [@@js.call]
  val pan_by : t -> x:float -> y:float -> unit [@@js.call]
  val pan_to : t -> LatLng.t -> unit [@@js.call]
  val pan_to_bounds : t -> LatLngBounds.t -> unit [@@js.call]
  val set_center : t -> LatLng.t -> unit [@@js.call]
  val set_clickable_icons : t -> bool -> unit [@@js.call]
  val set_heading : t -> float -> unit [@@js.call]
  val set_options : t -> MapOptions.t [@@js.call]
  (* val set_street_view : t -> StreetViewPanorama.t *)
  val set_tilt : t -> float -> unit [@@js.call]
  val set_zoom : t -> float -> unit [@@js.call]
  (** Attributes need getter and setter **)
  (** Added for polymorphism **)
  val t_to_js : t -> Ojs.t
  val t_of_js : Ojs.t -> t
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
end
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
end

module MarkerPlace: sig
  type t
  val create :
    ?location:LatLng.t ->
    ?place_id:string ->
    ?query:string ->
    unit -> t [@@js.builder]
end

module MarkerShape: sig
  type t
  val create :
    ?coords:float list ->
    ?type':string ->
    unit -> t [@@js.builder]
end

module MarkerOptions: sig
  type t
  val create :
    ?anchor_point:Point.t ->
    (*?animation:Animation.t -> *)
    ?attribution:Attribution.t ->
    ?clickable:bool ->
    ?cross_on_drag:bool ->
    ?cursor:string ->
    ?draggable:bool ->
    (* ?icon -> Icon.t *)
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
    unit -> t
    [@@js.builder]
end

module Marker: sig
  type t
  val new_marker : ?opts:MarkerOptions.t -> unit -> t [@@js.new]
  (* val get_animation : t -> Animation.t [@@js.call] *)
  val get_attribution : t -> Attribution.t [@@js.call]
  val get_clickable : t -> bool [@@js.call]
  val get_cursor : t -> bool [@@js.call]
  val get_draggable : t -> bool [@@js.call]
  (** val get_icon : t -> ???? [@@js.call] **)
  val get_label : t -> MarkerLabel.t [@@js.call]
  val get_map : t -> Map.t [@@js.call]
  val get_opacity : t -> float [@@js.call]
  val get_place : t -> MarkerPlace.t [@@js.call]
  val get_position : t -> LatLng.t [@@js.call]
  val get_shape : t -> MarkerShape.t [@@js.call]
  val get_title : t -> string [@@js.call]
  val get_visible : t -> bool [@@js.call]
  val get_z_index : t -> float [@@js.call]
  (* val set_animation : t -> Animation.t -> unit [@@js.call] **)
  val set_attribution : t -> Attribution.t -> unit  [@@js.call]
  val set_clickable : t -> flag:bool -> unit [@@js.call]
  val set_cursor : t -> cursor:string -> unit [@@js.call]
  val set_draggable : t -> flag:bool -> unit [@@js.call]
  (** val set_icon : t -> ???? -> unit **)
  val set_label : t -> MarkerLabel.t -> unit
  val set_map : t -> Map.t option -> unit [@@js.call]
  val set_opacity : t -> float -> unit [@@js.call]
  val set_options : t -> MarkerOptions.t -> unit [@@js.call]
  val set_place : t -> MarkerPlace.t -> unit [@@js.call]
  val set_position : t -> LatLng.t -> unit [@@js.call]
  val set_shape : t -> MarkerShape.t -> unit [@@js.call]
  val set_title : t -> string -> unit [@@js.call]
  val set_visible : t -> bool -> unit [@@js.call]
  val set_z_index : t -> float -> unit [@@js.call]
end
[@js.scope "google.maps"]

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
  val new_MVC_array : ?array:Ojs.t array -> unit -> t [@@js.new]
  val clear : t -> unit [@@js.call]
  val for_each : t -> (Ojs.t -> float) -> unit [@@js.call]
  val get_array : t -> Ojs.t array [@@js.call]
  val get_at : t -> int -> Ojs.t [@@js.call]
  val get_length : t -> int [@@js.call]
  val insert_at : t -> int -> Ojs.t [@@js.call]
  val pop : t -> Ojs.t [@@js.call]
  val push : t -> Ojs.t -> int [@@js.call]
  val remove_at : t -> int -> Ojs.t [@@js.call]
  val set_at : t -> int -> Ojs.t -> unit [@@js.call]
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
    unit -> t
    [@@js.builder]
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
  val open' : t-> ?map:Map.t -> ?anchor:MVCObject.t -> unit -> unit [@@js.call]
  val set_content : t -> string -> unit [@@js.call]
  val set_options : t -> InfoWindowOptions.t -> unit [@@js.call]
  val set_position : t -> LatLng.t -> unit [@@js.call]
  val set_z_index : t -> float -> unit [@@js.call]
end
[@js.scope "google.maps"]

module PolylineOptions: sig
  type t
  val create :
    ?clickable:bool ->
    ?draggable:bool ->
    ?editable:bool ->
    ?geodesic:bool ->
(*    ?icons:IconSequence.t list ->*)
    ?map:Map.t ->
    ?path:LatLng.t list ->
    ?stroke_color:string ->
    ?stroke_opacity:float ->
    ?stroke_weight:float ->
    ?visible:bool ->
    ?z_index:float ->
    unit -> t [@@js.builder]
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
    ?path:LatLng.t list ->
    ?stroke_color:string ->
    ?stroke_opacity:float ->
    ?stroke_weight:float ->
    ?visible:bool ->
    ?z_index:float ->
    unit -> t [@@js.builder]
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
  val set_paths : t -> LatLng.t list list -> unit [@@js.call]
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
    ?stroke_position:StrokePosition.t ->
    ?stroke_weight:float ->
    ?visible:bool ->
    ?z_index:float ->
    unit ->
    t [@@js.builder]
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
    ?stroke_position:StrokePosition.t ->
    ?stroke_weight:float ->
    ?visible:bool ->
    ?z_index:int ->
    unit ->
    t
    [@@js.builder]
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

module MapsEventListener: sig
  type t
  val new_maps_event_listener : unit -> t [@@js.new]
  val remove : t -> unit [@@js.call]
end
[@js.scope "google.maps"]

module Event: sig
  val add_dom_listener :
    Ojs.t -> string -> ?capture:bool ->
    (MouseEvent.t -> unit) ->
     MapsEventListener.t
    [@@js.call "addDomListener"]

  val add_dom_listener_once :
    Ojs.t -> string -> ?capture:bool ->
    (MouseEvent.t -> unit) ->
     MapsEventListener.t
    [@@js.call "addDomListenerOnce"]

  val add_listener :
    Ojs.t -> string -> (MouseEvent.t -> unit) ->
    MapsEventListener.t
    [@@js.call "addListener"]

  val add_listener_once :
    Ojs.t -> string -> (MouseEvent.t -> unit) ->
    MapsEventListener.t
    [@@js.call "addListenerOnce"]

  val clear_instance_listeners :
    Ojs.t -> unit
    [@@js.call "clearInstanceListeners"]

  val clear_listeners :
    Ojs.t -> string -> unit
    [@@js.call "clearListeners"]

  val remove_listener :
    MapsEventListener.t -> unit [@@js.call "removeListener"]

  val trigger : Ojs.t -> string -> MouseEvent.t -> unit
    [@@js.call "trigger"]
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
    unit -> t [@@js.builder]
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
    unit -> t [@@js.builder]
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
end

module GeocoderGeometry: sig
  type t
  val create:
    ?bounds: LatLngBounds.t ->
    ?location: LatLng.t ->
    (*?location_type: GeocoderLocationType.t ->*)
    ?viewport: LatLngBounds.t ->
    unit -> t
    [@@js.verbatim_names]
    [@@js.builder]
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
    unit -> t
    [@@js.verbatim_names]
    [@@js.builder]
end

module Geocoder: sig
  type t
  val new_geocoder : unit -> t [@@js.new]
  val geocode :
    t -> GeocoderRequest.t ->
    (GeocoderResult.t list -> (*GeocoderStatus.t ->*) unit) ->
    unit
end
[@js.scope "google.maps"]
(* End geocoding *)

(* Distance, time, distance *)
module Time: sig
  type t
  val create:
    ?text:string ->
    ?time_zone:string ->
    (*?value:Date.t ->*)
    unit ->
    t
    [@@js.verbatim_names]
    [@@js.builder]
end

module Duration: sig
  type t
  val create:
    ?text:string ->
    ?value:float ->
    unit ->
    t
    [@@js.builder]
end

module Distance: sig
  type t
  val create:
    ?text:string ->
    ?value:float ->
    unit ->
    t
    [@@js.builder]
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
end

module TransitStop:sig
  type t
  val create:
    ?location:LatLng.t ->
    ?name:string ->
    unit ->
    t
    [@@js.builder]
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
end
(* End transit *)

(* Direction *)

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
(*    ?travel_mode:TravelMode.t ->    *)
    unit ->
    t
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
end

module DirectionsRoute: sig
  type t
  val create:
    ?bounds:LatLngBounds.t ->
    ?copyrights:string ->
(*    ?fare:TransitFare.t ->*)
    ?legs:DirectionsLeg.t list ->
    ?overview_path:LatLng.t list ->
    ?overview_polyline:string ->
    ?warnings:string list ->
    ?waypoint_order:int list ->
    unit ->
    t
    [@@js.verbatim_names]
    [@@js.builder]
end

module DirectionsResult: sig
  type t
  val create:
    ?geocoded_waypoints:DirectionsGeocodedWaypoint.t list ->
    ?routes:DirectionsRoute.t list ->
    unit ->
    t [@@js.builder]
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
(*    ?panel:node ->*)
    ?polyline_options:PolylineOptions.t ->
    ?preserve_viewport:bool ->
    ?route_index:int ->
    ?suppress_bicycling_layer:bool ->
    ?suppress_info_windows:bool ->
    ?suppress_markers:bool ->
    ?suppress_polylines:bool ->
    unit -> t
    [@@js.verbatim_names]
    [@@js.builder]
end

module DirectionsRenderer: sig
  type t
  val new_direction_renderer:
    opts:DirectionsRendererOptions.t ->
    unit ->
    t [@@js.new]
  val get_directions : t -> DirectionsResult.t
  val get_map : t -> Map.t
(*  val get_panel : t -> Node *)
  val get_route_index : t -> int
  val set_directions : t -> DirectionsResult.t -> unit
  val set_map : t -> Map.t -> unit
  val set_options : t -> DirectionsRendererOptions.t -> unit
(*  val set_panel : panel:Node -> unit *)
  val set_route_index : t -> int -> unit
end
[@js.scope "google.maps"]

module TrafficModel: sig
  type t
    (* SUM TYPE !! *)
end


(* Transit *)
module TravelMode: sig
  type t
  (* SUM TYPE !!! *)
end

module TransitMode: sig
  type t
    (* SUM TYPE !! *)
end

module TransitRoutePreference: sig
  type t
    (* SUM TYPE !! *)
end

module UnitSystem: sig
  type t
    (* SUM TYPE !! *)
end

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
    (* Ojs.t = Data (JS) *)
    ?arrival_time:Ojs.t ->
    ?departure_time:Ojs.t ->
    ?modes:TransitMode.t list ->
    ?routing_preference:TransitRoutePreference.t ->
    unit ->
    t [@@js.builder]
end
(* End transit *)


module DrivingOptions: sig
  type t
  val create:
    (** Ojs.t = Date (JS) **)
    ?departure_time:Ojs.t ->
    ?traffic_model:TrafficModel.t ->
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
end

module DirectionsRequest: sig
  type t
  val create:
    ?avoid_ferries:bool ->
    ?avoid_highways:bool ->
    ?avoid_tolls:bool ->
    (** ????? *)
    ?destination:LatLng.t ->
    ?driving_options:DrivingOptions.t ->
    ?optimize_waypoints:bool ->
    (** ????? *)
    ?origin:LatLng.t ->
    ?provide_route_alternatives:bool ->
    ?region:string ->
    ?transit_options:TransitOptions.t ->
    ?travel_mode:TravelMode.t ->
    ?unit_system:UnitSystem.t ->
    ?waypoints:DirectionsWaypoint.t list ->
    unit ->
    t
    [@@js.builder]
end

module DirectionsStatus: sig
  type t
  (** SUM TYPES ! **)
end

module DirectionsService: sig
  type t
  val new_directions_service: unit -> t [@@js.new]
  val route: DirectionsRequest.t ->
    (DirectionsResult.t ->
     DirectionsStatus.t ->
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
    ?type':string ->
    unit ->
    t
    [@@js.builder]
end

module PhotoOptions: sig
  type t
  val create:
    ?max_height: int ->
    ?max_width: int ->
    unit ->
    t
    [@@js.builder]
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
end

module PlacePhoto: sig
  type t
  val new_place_photo: unit -> t [@@js.new]
  val get_url: t -> PhotoOptions.t -> string [@@js.call]
  val height: t -> int [@@js.get]
  val html_attributions: t -> string list [@@js.get]
  val width: t -> int [@@js.get]
  val set_height: t -> int -> unit [@@js.set]
  (** TEST VERBATIM ! **)
  val set_html_attributions: t -> int -> unit
    [@@js.verbatim_names]
    [@@js.set]
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
end

module PlaceDetailsRequest: sig
  type t
  val create:
    ?place_id:string ->
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
end

module PlaceSearchPagination: sig
  type t
  val new_place_search_pagination: unit -> t [@@js.new]
  val next_page : t -> unit -> unit [@@js.call]
  val has_next_page : t -> bool [@@js.get]
  val set_has_next_page : t -> bool -> unit [@@js.set]
end
[@js.scope "google.maps.places"]

module RankBy: sig
  type t
    (* SUM TYPE ! DISTANCE | PROMINENCE *)
end

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
    ?rank_by:RankBy.t ->
    ?type':string ->
    unit ->
    t
    [@@js.builder]
end

module PlacesServiceStatus: sig
  type t
    (* SUM TYPE !!! *)
end

module RadarSearchRequest: sig
  type t
  val create:
    ?bounds:LatLngBounds.t ->
    ?keyword:string ->
    ?location:LatLng.t ->
    ?name:string ->
    ?radius:float ->
    ?type':string ->
    unit ->
    t
    [@@js.builder]
end

module TextSearchRequest: sig
  type t
  val create:
    ?bounds:LatLngBounds.t ->
    ?location:LatLng.t ->
    ?query:string ->
    ?radius:float ->
    ?type':string ->
    unit ->
    t
    [@@js.builder]
end

module PlacesService: sig
  type t
  val new_places_service: Map.t -> t [@@js.new]
  val get_details: t -> PlaceDetailsRequest.t ->
    (PlaceResult.t -> PlacesServiceStatus.t ->
     unit) -> unit [@@js.call]
  val nearby_search: t -> PlaceSearchRequest.t ->
    (PlaceResult.t list ->
     PlacesServiceStatus.t ->
     PlaceSearchPagination.t ->
     unit) ->
    unit [@@js.call]
  val radar_search: RadarSearchRequest.t ->
    (PlaceResult.t list ->
     PlacesServiceStatus.t ->
     unit) ->
    unit [@@js.call]
  val text_search: TextSearchRequest.t ->
    (PlaceResult.t list ->
     PlacesServiceStatus.t ->
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
    ?country:string ->
    unit ->
    t [@@js.builder]
end

module PredictionSubstring: sig
  type t
  val create:
    ?length:int ->
    ?offset:int ->
    unit ->
    t
    [@@js.builder]
end

module PredictionTerm: sig
  type t
  val create:
    ?offset:int ->
    ?value:string ->
    unit ->
    t
    [@@js.builder]
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
end
(* End queries *)

module AutocompleteOptions: sig
  type t
  val create :
    ?bounds:LatLngBounds.t ->
    ?component_restrictions:ComponentRestrictions.t ->
    ?types:string list ->
    unit ->
    t [@@js.builder]
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
    ?types:string list ->
    unit ->
    t
    [@@js.builder]
end

module AutocompleteService: sig
  type t
  val new_autocomplete_service : unit -> t [@@js.new]
  val get_place_predictions :
    AutocompletionRequest.t ->
    (AutocompletePrediction.t list -> PlacesServiceStatus.t -> unit)
    -> unit [@@js.call]

  val getQueryPredictions :
    QueryAutocompletionRequest.t ->
    (QueryAutocompletePrediction.t list -> PlacesServiceStatus.t -> unit) ->
    unit
end
[@js.scope "google.maps.places"]

module Autocomplete: sig
  type t
  val new_autocomplete :
    ?opts:AutocompleteOptions.t ->
    Document.t ->
    t [@@js.new]
  val get_bounds : t -> unit -> LatLngBounds.t [@@js.call]
  val get_place : t -> unit -> PlaceResult.t [@@js.call]
  val set_bounds : t -> LatLngBounds.t -> unit [@@js.call]
  val set_component_restrictions :
    t -> ComponentRestrictions.t -> unit [@@js.call]
  val set_types : t -> string list -> unit [@@js.call]
end
[@js.scope "google.maps.places"]
(* End autocompleter *)

(* Distance Matrix *)
module DistanceMatrixElementStatus: sig
  type t
  (* SUM TYPE *)
end

module DistanceMatrixStatus: sig
  type t
  (* SUM TYPE *)
end

module DistanceMatrixRequest: sig
  type t
  val create:
    ?avoid_ferries:bool ->
    ?avoid_highways:bool ->
    ?avoid_tolls:bool ->
    (* destinations *)
    ?destinations:LatLng.t list ->
    ?driving_options:DrivingOptions.t ->
    ?origins:LatLng.t list ->
    ?region:string ->
    ?transit_options:TransitOptions.t ->
    ?travel_mode:TravelMode.t ->
    ?unit_system:UnitSystem.t ->
    unit ->
    t
    [@@js.builder]
end

module DistanceMatrixResponseElement: sig
  type t
  val create:
    ?distance:Distance.t ->
    ?duration:Duration.t ->
    ?duration_in_traffic:Duration.t ->
    (*?fare:TransitFare.t -> *)
    ?status:DistanceMatrixElementStatus.t ->
    unit ->
    t
    [@@js.builder]
end

module DistanceMatrixResponseRow: sig
  type t
  val create:
    ?elements:DistanceMatrixResponseElement.t list ->
    unit ->
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
end

module DistanceMatrixService: sig
  type t
  val new_distance_matrix_service: unit -> t [@@js.new]
  val get_distance_matrix:
    t -> DistanceMatrixRequest.t ->
    (DistanceMatrixResponse.t ->
     DistanceMatrixStatus.t ->
     unit) ->
    unit
end
[@js.scope "google.maps"]
(* End DistanceMatrix *)

(* Drawing *)
module DrawingControlOptions: sig
  type t
  val create:
    ?drawing_modes:OverlayType.t list ->
    ?position:ControlPosition.t ->
    unit ->
    t
    [@@js.builder]
end

module DrawingManagerOptions: sig
  type t
  val create:
    ?circle_options:CircleOptions.t ->
    ?drawing_controle:bool ->
    ?drawing_control_options:DrawingControlOptions.t ->
    ?drawing_mode:OverlayType.t ->
    ?map:Map.t ->
    ?marker_options:MarkerOptions.t ->
    ?polygon_options:PolygonOptions.t ->
    ?polyline_options:PolylineOptions.t ->
    ?rectangle_options:RectangleOptions.t ->
    unit ->
    t
    [@@js.builder]
end

module DrawingManager: sig
  type t
  val new_drawing_manager:
    ?options:DrawingManagerOptions.t -> unit -> t [@@js.new]
  val get_drawing_mode : t -> OverlayType.t [@@js.call]
  val get_map : t -> Map.t [@@js.call]
  val set_drawing_mode : t -> OverlayType.t -> unit [@@js.call]
  val set_map : t -> Map.t -> unit [@@js.call]
  val set_options : t -> DrawingManagerOptions.t -> unit [@@js.call]
end
[@js.scope "google.map.drawing"]
(* End drawing *)

(* Zoom *)
module ZoomControlOptions: sig
  type t
  val create:
    ?position:ControlPosition.t ->
    unit ->
    t
    [@@js.builder]
  val position: t -> ControlPosition.t [@@js.get]
  val set_position: t -> ControlPosition.t -> unit [@@js.set]
end
(* End zoom *)


module WeightedLocation: sig
  type t
  val create:
    ?location:LatLng.t ->
    ?weight:float ->
    unit ->
    t
    [@@js.builder]
end

(* Elevation *)
module ElevationStatus: sig
  type t
    (** SUM TYPE ! **)
end

module PathElevationRequest: sig
  type t
  val create:
    ?path:LatLng.t list ->
    samples:int ->
    t
    [@@js.builder]
end

module LocationElevationRequest: sig
  type t
  val create:
    locations:LatLng.t list ->
    t
    [@@js.builder]
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
end

module ElevationService: sig
  type t
  val new_elevation_service: unit -> t [@@js.new]
  val get_elevation_along_path:
    PathElevationRequest.t ->
    (ElevationResult.t list ->
     ElevationStatus.t ->
     unit) ->
    unit [@@js.call]

  val get_elevation_for_locations :
    LocationElevationRequest.t ->
    (ElevationResult.t list ->
     ElevationStatus.t ->
     unit) ->
    unit [@@js.call]
end
  [@js.scope "google.maps"]
(* End Elevation *)

(* Fullscreen *)
module FullscreenControlOptions: sig
  type t
  val create:
    position:ControlPosition.t ->
    t
    [@@js.builder]
end
(* End Fullscreen *)

(* Fusion *)
module FusionTablesCell: sig
  type t
  val create:
    column_name:string ->
    value:string ->
    t
    [@@js.builder]
end

module FusionTablesHeatmap: sig
  type t
  val create:
    enabled:bool ->
    t
    [@@js.builder]
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
end

module FusionTablesMarkerOptions: sig
  type t
  val create:
    icon_name:string ->
    t
    [@@js.builder]
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
module KmlLayerStatus: sig
  type t
  (* SUM TYPE *)
end

module KmlAuthor: sig
  type t
  val create:
    email:string ->
    name:string ->
    uri:string ->
    t
    [@@js.builder]
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
end

module KmlLayer: sig
  type t
  val new_kml_layer:
    ?opts:KmlLayerOptions.t -> unit -> t [@@js.new]
  val get_default_viewport: t -> LatLngBounds.t [@@js.call]
  val get_map: t -> Map.t [@@js.call]
  val get_metadata: t -> KmlLayerMetadata.t [@@js.call]
  val get_status: t -> KmlLayerStatus.t [@@js.call]
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
module MaxZoomStatus: sig
  type t
    (* SUM TYPE *)
end

module MaxZoomResult: sig
  type t
  val create:
    ?status:MaxZoomStatus.t ->
    ?zoom:int ->
    unit ->
    t
    [@@js.builder]
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
  val create: bounds:LatLngBounds.t -> t
    [@@js.builder]
end

module SearchBox: sig
  type t
  val new_search_box:
    Document.t -> ?opts:SearchBoxOptions.t -> unit -> t [@@js.new]
  val get_bounds: t -> LatLngBounds.t [@@js.call]
  val get_places: t -> PlaceResult.t list [@@js.call]
  val set_bounds: t -> LatLngBounds.t -> unit [@@js.call]
end
[@js.scope "google.maps.places"]
(* End searchbox *)

(* Streetview *)
module StreetViewAddressControlOptions: sig
  type t
  val create:
    position:ControlPosition.t ->
    t
    [@@js.builder]
end

module StreetViewControlOptions: sig
  type t
  val create:
    position:ControlPosition.t ->
    t
    [@@js.builder]
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
end

module StreetViewPreference: sig
  type t
    (* SUM TYPE *)
end

module StreetViewStatus: sig
  type t
    (* SUM TYPE *)
end

module StreetViewSource: sig
  type t
    (* SUM TYPE *)
end

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
end

module StreetViewLocationRequest: sig
  type t
  val create:
    ?location:LatLng.t ->
    ?preference:StreetViewPreference.t ->
    ?radius:float ->
    ?source:StreetViewSource.t ->
    unit ->
    t
    [@@js.builder]
end

module StreetViewService: sig
  type t
  val new_street_view_service:
    unit -> t [@@js.new]
  val get_panorama:
    StreetViewLocationRequest.t ->
    (StreetViewPanoramaData.t ->
     StreetViewStatus.t ->
    unit) ->
    unit
end
[@ js.scope "google.maps"]

module PanControlOptions: sig
  type t
  val create:
    position:ControlPosition.t ->
    t
    [@@js.builder]
end

module StreetViewPanoRequest: sig
  type t
  val create:
    pano:string ->
    t
    [@@js.builder]
end

module StreetViewPov: sig
  type t
  val create:
    heading:int ->
    pitch:int ->
    t
    [@@js.builder]
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
end

module StreetViewPanorama: sig
  type t
  val new_street_view_panorama:
    container:Document.t ->
    ?opts:StreetViewPanoramaOptions.t ->
    unit ->
    t [@@js.new]
  val get_links: t -> StreetViewLink.t list [@@js.call]
  val get_location: t -> StreetViewLocation.t [@@js.call]
  val get_pano: t -> string [@@js.call]
  val get_photographer_pov: t -> StreetViewPov.t [@@js.call]
  val get_position: t -> LatLng.t [@@js.call]
  val get_pov: t -> StreetViewPov.t [@@js.call]
  val get_status: t -> StreetViewStatus.t [@@js.call]
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
end
  [@js.scope "google.maps"]

module StreetViewCoverageLayer: sig
  type t
  val new_street_view_coverage_layer: unit -> t [@@js.new]
  val get_map: t -> Map.t [@@js.call]
  val set_map: t -> Map.t -> unit [@@js.call]
end
[@js.scope "google.maps"]
(* End streetview *)

(* Rotation Control *)
module RotateControlOptions: sig
  type t
  val create: position:ControlPosition.t -> t [@@js.builder]
end
(* End Rotation control *)

(*Scale Control Style *)
module ScaleControlStyle: sig
  type t
  (* SUM TYPE *)
end

module ScaleControlOptions: sig
  type t
  val create: style:ScaleControlStyle.t -> t [@@js.builder]
end
