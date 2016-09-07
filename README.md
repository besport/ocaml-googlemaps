#GoogleMaps binding for OCaml

### Dependencies :
To be able to compile and run correctly this binding, you need to install the following packages in ```opam``` :

[js_of_ocaml](https://github.com/ocsigen/js_of_ocaml)

[gen_js_api](https://github.com/LexiFi/gen_js_api)

### Installation :
To install it via ```opam``` use the folowing commands :

```
opam pin add ocaml-googlemaps https://github.com/besport/ocaml-googlemaps.git
opam install ocaml-googlemaps
```

### Usage :
A minimal example can be found in the folder example.
You only need to type ```make``` in the ```example``` folder to get ```example.js```, open ```index.html``` to see the result

### Compilation : 
First, compile your source code into ocaml bytecode :
```
ocamlfind ocamlc -o example.byte -no-check-prims -package js_of_ocaml,gen_js_api,ocaml-googlemaps -linkpkg example.ml
```

Then you can get a ```js``` file from your bytecode thanks to ```js_of_ocaml``` :
```
js_of_ocaml -o example.js +gen_js_api/ojs_runtime.js example.byte
```

### Documentation and conventions used :
You can find the official documentation:
https://developers.google.com/maps/documentation/javascript/reference

The conventions used are ```gen_js_api``` 's :

* An upper ```X``` letter becomes ```_x```
* Javascript ```new MyClass``` becomes ```MyClass.new_my_class```
* Javascript records ("Object" in Google Maps API documentation) become a module containing function :
    * ```create``` : which creates the object. Its parameters are all labelled by fields name
    * ```foofield``` : a getter for the field called ```foofield```
    * ```set_foofield``` : a setter for the field called ```foofield```
 
**WARNING** : Some objects in Google Map API contain a field called ```type```. As ```type``` is a keyword in OCaml, you need to use ```type'```

Example in Javascript :
```javascript
var opts = 
  {
    center: {lat: -34.397, lng: 150.644},
    zoom: 10
  };
opts.zoom = 8;
var map = new google.maps.Map(document.getElementById('map'), opts);
```

Becomes in OCaml (supposing map is the Dom element where to place the map) :
```ocaml
open Googlemaps
let position = LatLng.new_lat_lng (-34.397) 150.644 in
let opts = MapOptions.create ~center:position ~zoom:10 () in
let () = MapOptions.set_zoom opts 8 in
let map = Map.new_map maps opts ()
```
Here, as the last arguments of ```create``` and ```new_map``` are optional, we also need to give ```()```

### Version used : 
This binding is using Google Map v3.24

### Known bugs:
* The namespace ```Data```isn't done yet
