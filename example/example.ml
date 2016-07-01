open Maps

let doc = Dom_html.getElementById "googleMap";;
let div = Converter.Element.t_of_dom doc;;
let center = LatLng.new_lat_lng 47.011477 2.440667;;
let prop = MapOptions.create ~center ~zoom:5 ~map_type_id:Roadmap ();;
let map = Map.new_map div ~opts:prop ();;

let add_lat_lng event =
  let latlng = MouseEvent.lat_lng event in
  let opts = MarkerOptions.create
      ~position:latlng
      ~title:("Mon point")
      ~draggable:false
      ~map:map () in
  let _ = Marker.new_marker ~opts () in
  ()
;;

let _ = Event.add_listener (Map.t_to_js map) "click" add_lat_lng;;
