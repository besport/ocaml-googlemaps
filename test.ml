open Maps

(*
let div = Document.get_element_by_id "googleMap";;
let lat = LatLng.new_lat_lng 0. (-180.);;
let prop = MapOptions.create ~center:lat ~zoom:3. ~map_type_id:"terrain" ();;
let map = Map.new_map div ~opts:prop ();;
let fpc = [ LatLng.new_lat_lng 37.772 (-122.2)
          ; LatLng.new_lat_lng 21.291 (-157.8)
          ; LatLng.new_lat_lng (-19.142) 178.431];;
let poly_opt =
  PolylineOptions.create
    ~path:fpc
    ~geodesic:true
    ~stroke_color:"#FF0000"
    ~stroke_opacity:1.0
    ~stroke_weight:2.0
    ();;
let poly = Polyline.new_polyline ~opts:poly_opt ();;
let () = Polyline.set_map poly (Some(map));;
let tab = Polyline.get_path poly;;
let last = LatLng.t_to_js (LatLng.new_lat_lng (-27.467) 153.027);;
let _ = MVCArray.push tab last;;*)

let div = Document.get_element_by_id "googleMap";;
let center = LatLng.new_lat_lng 41.879 (-87.624);;
let prop = MapOptions.create ~center ~zoom:10 ~map_type_id:Roadmap ();;
let map = Map.new_map div ~opts:prop ();;

(*let opts = PolylineOptions.create
    ~stroke_color:"#00000"
    ~stroke_opacity:1.
    ~stroke_weight:3.
    ();;
let poly = Polyline.new_polyline ~opts ();;
let () = Polyline.set_map poly (Some(map));;*)

let add_lat_lng event =
  let path = Polyline.get_path poly in
  let latlng = MouseEvent.lat_lng event in
  let len = MVCArray.push path (LatLng.t_to_js latlng) in
  let opts = MarkerOptions.create
      ~position:latlng
      ~title:("#"^string_of_int (len))
      ~map:map () in
  let _ = Marker.new_marker ~opts () in
  ()
;;
let _ = Event.add_listener (Map.t_to_js map) "click" add_lat_lng;;

(*let pos1 = LatLng.new_lat_lng 37.772 (-122.2);;
let pos2 = LatLng.new_lat_lng (-19.142) 178.431;;
let dist = Spherical.compute_distance_between pos1 pos2 ();;
let () = Console.log (string_of_float dist);;*)

(*let geo = GeocoderAddressComponent.create
    ~long_name:"BLOP"
    ~short_name:"BL"
    ~types:[]
    ()
;;
let () = GeocoderAddressComponent.set_short_name geo "HAHA";;
let () = Console.log (GeocoderAddressComponent.short_name geo);;
*)

(*let date = Date.now ();;
let date = Date.new_date ~milliseconds:date () ;;
let () = Console.log (Date.to_json date);;*)

(** Autocomplétion  **)
(*let texte = "Par";;
let myservice = AutocompleteService.new_autocomplete_service ();;
let request = AutocompletionRequest.create ~input:texte ~offset:3 () ;;
let callback predlist (stat:places_service_status) =
  let print_list () =
    let print = Console.log in
    let str1 = List.fold_left
      (fun acc1 autopred ->
        (acc1^(AutocompletePrediction.description autopred)^" ;\n")
      )
      "["
      predlist
    in
    print (str1^"]\n")
  in
  match stat with
  | Invalid_request -> Console.log "Invalide"
  | Ok -> Console.log "Ok\nList :\n"; print_list ()
  | Over_query_limit -> Console.log "Over blop"
  | Request_denied -> Console.log "Denied"
  | Unknown_error -> Console.log "Inconnue"
  | Zero_results -> Console.log "0 résultat"
  | _ -> Console.log "Autre"
;;
let () = AutocompleteService.get_place_predictions myservice request callback;;*)
